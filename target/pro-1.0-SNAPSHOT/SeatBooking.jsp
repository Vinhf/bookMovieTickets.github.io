<%-- 
    Document   : SeatBooking
    Created on : Oct 30, 2023, 10:51:14 PM
    Author     : QuocHai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="data.DAO"%>  
<%@page import="java.util.List"%>
<%@page import="controller.Seat"%>  
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="css/SeatBooking.css" />
        <title>Movie Seat Booking</title>
    </head>
    <body>
        <% 
             String bookingError = (String)session.getAttribute("bookingError");
            // Kiểm tra nếu có lỗi và chuẩn bị thông báo để hiển thị
             String errorMessage = bookingError != null && !bookingError.isEmpty() ? bookingError : "";
             session.removeAttribute("bookingError"); // Xóa thông báo lỗi khỏi session sau khi lấy để không hiển thị lại nếu refresh trang.
             int ShowId = (Integer) request.getSession().getAttribute("ShowID");
                int Mid = (Integer) request.getSession().getAttribute("Mid");
            DAO dao = new DAO();
            List<Seat> allSeats = dao.getAllSeatsWithStatus(ShowId);

            int maxRow = 0;
            int maxSeat = 0;
            for(Seat seat : allSeats) {
                 if(seat.getRow() > maxRow) {
                     maxRow = seat.getRow();
                    }
                if(seat.getSeatNumber() > maxSeat) {
                    maxSeat = seat.getSeatNumber();
                }
             }
        %>
        <div class="movie-container">
            <label> Select a movie:</label>
            <div id="movie">

            </div>
        </div>

        <ul class="showcase">
            <li>
                <div class="seat"></div>
                <small>Available</small>
            </li>
            <li>
                <div class="seat selected"></div>
                <small>Selected</small>
            </li>
            <li>
                <div class="seat booked"></div>
                <small>Booked</small>
            </li>
        </ul>
        <div class="container">
            <div class="screen"></div>
            <% for(int i = 1; i <= maxRow; i++) { %>
            <div class="row">
                <% for(int j = 1; j <= maxSeat; j++) {
                // Tìm seat tương ứng với Row và Seat hiện tại
                String status = "";
               for(Seat seat : allSeats) {
                if(seat.getRow() == i && seat.getSeatNumber() == j) {
                    status = seat.getSeatStatus();
                    break;
                }
            }
                %>
                <div class="seat <%= status %>" id ="<%=i%>-<%=j%>"></div>
                <% } %>

            </div>
            <% } %>
        </div> 
        <p class="text">You have selected <span name="countD" id="count">0</span> seat for a price of RS.<span id="total" name="totalD">0</span>
        </p>
        <p id="selectedSeatsInfo">Các ghế đã chọn: </p>

        <form action="Bill.jsp" method="post" id="bookingForm">
            <input type="hidden" name="showtimeId" value="<%= ShowId %>" />
            <input type="hidden" name="selectedSeats" id="selectedSeatsInput" />
            <input type="hidden" name="MovieId" value="<%= Mid%>" />
            <input type="hidden" name="countD" id="countDInput" />
            <input type="hidden" name="totalD" id="totalDInput" />
            <button type="submit" id="bookNow">Đặt chỗ</button>
        </form>
        <script>

            const seatPrice = 4.04;
            let selectedSeats = JSON.parse(localStorage.getItem('selectedSeats')) || [];
            function updateSelectedCountAndTotal() {
                // Hiển thị số lượng ghế đã chọn
                let selectedSeatsCount = selectedSeats.length;
                document.getElementById('count').textContent = selectedSeatsCount;
                document.getElementById('countDInput').value = selectedSeatsCount; // Cập nhật input ẩn cho số lượng ghế

                // Tính và hiển thị tổng giá tiền
                let totalPrice = selectedSeatsCount * seatPrice;
                document.getElementById('total').textContent = totalPrice.toLocaleString();
                document.getElementById('totalDInput').value = totalPrice; // Cập nhật input ẩn cho tổng giá tiền
            }

            document.addEventListener('DOMContentLoaded', (event) => {
                const seats = document.querySelectorAll(".seat:not(.booked)");
                const selectedSeatsInfo = document.getElementById("selectedSeatsInfo");

                // Cập nhật giao diện người dùng khi trang được tải
                updateSelectedCountAndTotal();


                // Đánh dấu các ghế đã chọn trước đó
                seats.forEach(seat => {
                    if (selectedSeats.includes(seat.id)) {
                        seat.classList.add("selected");
                    }
                });

                // Update the displayed seat information
                selectedSeatsInfo.textContent = "Các ghế đã chọn: " + selectedSeats.join(", ");

                seats.forEach(seat => {
                    seat.addEventListener("click", (e) => {
                        if (!e.target.classList.contains("booked")) {
                            e.target.classList.toggle("selected");
                            const seatInfo = e.target.id; // Lấy thông tin từ thuộc tính id

                            if (e.target.classList.contains("selected")) {
                                selectedSeats.push(seatInfo);
                            } else {
                                const index = selectedSeats.indexOf(seatInfo);
                                if (index > -1) {
                                    selectedSeats.splice(index, 1);
                                }
                            }

                            // Lưu dữ liệu vào localStorage
                            localStorage.setItem('selectedSeats', JSON.stringify(selectedSeats));

                            // Update the displayed seat information
                            selectedSeatsInfo.textContent = "Các ghế đã chọn: " + selectedSeats.join(", ");
                        }
                        updateSelectedCountAndTotal();
                    });
                });
            });

            const bookingForm = document.getElementById("bookingForm");
            const selectedSeatsInput = document.getElementById("selectedSeatsInput");

            bookingForm.addEventListener('submit', function (event) {
                // Cập nhật giá trị cho input ẩn
                selectedSeatsInput.value = selectedSeats.join(",");

                console.log("Seats to send:", selectedSeatsInput.value); // Debug
                console.log("Count to send:", document.getElementById('countDInput').value); // Debug
                console.log("Total to send:", document.getElementById('totalDInput').value); // Debug


                // Kiểm tra xem người dùng có chọn ghế nào không
                if (selectedSeats.length === 0) {
                    alert('Vui lòng chọn ít nhất một ghế trước khi đặt.');
                    event.preventDefault(); // Ngăn chặn việc gửi form
                    return;
                }
            });

            window.onload = function () {
                // Lấy thông báo lỗi đã chuẩn bị từ JSP
                var bookingError = "<%= errorMessage %>";
                if (bookingError) {
                    alert(bookingError);
                     // Xóa thông báo lỗi khỏi session
                <% session.removeAttribute("bookingError"); %>
                // Xóa localStorage
                localStorage.clear();
                }
            };

        </script>


    </body>
</html>
