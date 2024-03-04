<%-- 
    Document   : Bill
    Created on : Nov 2, 2023, 8:19:48 AM
    Author     : QuocHai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controller.Movie"%>  
<%@page import="java.sql.ResultSet"%>
<%@page import="data.DAO"%>  
<%@page import="java.util.List"%> 
<%@page import="controller.Showtime"%>  
<%@page import="controller.JunkFood"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Total Bill</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css" rel="stylesheet" />
        <link href="css/BillCss.css" rel="stylesheet">
    </head>

    <body>
        <%
                        String User = "";
                            Cookie[] cookies = request.getCookies();

                            if (cookies != null) {
                             for (Cookie cookie : cookies) {
                                if ("UserC".equals(cookie.getName())) {
                                User = cookie.getValue();
                                     break;
                                        }
                                     }
                                }
        int showtimeId = Integer.parseInt(request.getParameter("showtimeId"));
        String seatsData = request.getParameter("selectedSeats");
        String midParameter = request.getParameter("MovieId");
        int countD = Integer.parseInt(request.getParameter("countD"));
        double totalD = Double.parseDouble(request.getParameter("totalD"));
        DAO dao = new DAO();
        %>
        <section>
            <div class="container">
                <h2 class="px-5 p-2">Total Bill</h2>
                <div class="cart">


                    <div class="col-md-12 col-lg-10 mx-auto">
                        <%
                     List<JunkFood> junkFoodList = dao.getAllJunkFood();
                    for (JunkFood food : junkFoodList) {
                        %>
                        <div class="cart-item">
                            <div class="row">
                                <div class="col-md-7 center-item">
                                    <img src="<%=food.getImageUrl()%>" alt="">
                                    <h5><%=food.getName()%></h5>

                                </div>

                                <div class="col-md-5 center-item">
                                    <div class="input-group number-spinner">
                                        <button class="btn btn-default number-decrement" data-target="total-<%= food.getJunkFoodID() %>">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                        <input type="number" class="form-control text-center quantity-input" value="0"
                                               data-price="<%= food.getPrice() %>" data-id="<%= food.getJunkFoodID() %>"
                                               data-name="<%= food.getName() %>" data-target="total-<%= food.getJunkFoodID() %>" />
                                        <button class="btn btn-default number-increment" data-target="total-<%= food.getJunkFoodID() %>">
                                            <i class="fas fa-plus"></i>
                                        </button>
                                    </div>
                                    <h5>$ <span id="total-<%= food.getJunkFoodID() %>">0</span> </h5>

                                </div>
                            </div>                           
                        </div>


                        <%}%>

                        <div class="cart-item">
                            <h3>Thông tin đặt vé</h3>
                            <div class="row g-2">
                                <div class="col-6">
                                    <h4>Tên: </h4>
                                    <h4>Rạp: </h4>
                                    <h4>Thông tin phim: </h4>
                                    <h4>xuất chiếu: </h4>
                                    <h4>Thông tin vé:</h4>
                                    <h4>số ghế: </h4>
                                    <h4>đồ ăn và thức uống: </h4>
                                </div>
                                <div class="col-6 status">
                                    <h4><%=User%> </h4>
                                    <%
                                     ResultSet rs = dao.getName(showtimeId);
                                         while(rs.next()) {
                                    %>
                                    <h4><%=rs.getString("TheaterName")%> </h4>
                                    <h4><%=rs.getString("MovieTitle")%></h4>
                                    <% 
                                        }
                                       List<Showtime> listS = dao.getShowtimes(showtimeId);
                                       for (Showtime showtime : listS) {
                                    %>
                                    <h4> <%=showtime.getStartTime()%> - <%=showtime.getEndTime()%> </h4>
                                    <%}%>
                                    <h4><%=countD%> x ve 2D Thanh Vien(4.04$)</h4>
                                    <h4><%= seatsData%></h4>
                                    <h4> </h4>
                                </div>
                            </div>

                        </div>
                        <div class="cart-item">
                            <div class="row g-2">

                                <div class="col-6">
                                    <h5>Subtotal: </h5>
                                    <h5>Tax:</h5>
                                    <h5>Total:</h5>
                                </div>

                                <div class="col-6 status">
                                    <h5>$<span id="sub-total"><%=totalD%></span></h5>
                                    <h5>$<span id="tax-amount"><%=totalD / 10%></span></h5>
                                    <h5>$<span id="total-price"><%=totalD + totalD / 10%></span></h5>
                                </div>

                            </div>
                        </div>
                        <div class="col-md-12 pt-4 pb-4">
                            <form id="checkoutForm" action="InsertSeat" method="post">
                                <input type="hidden" name="showtimeId" value="<%= showtimeId %>">
                                <input type="hidden" name="seatsData" value="<%= seatsData %>">
                                <input type="hidden" name="User" value="<%= User %>">
                                <input type="hidden" name="movieId" value="<%= midParameter %>">
                                <input type="hidden" name="countD" value="<%= countD %>">
                                <input type="hidden" name="totalD" value="<%= totalD %>">
                                <input type="hidden" name="junkFoodDetails" id="junkFoodDetails" value="">
                                <button type="submit" class="btn btn-success check-out">Check Out</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script>

// Cập nhật lại tổng số lượng và giá khi trang tải xong và khi có sự thay đổi số lượng
            document.addEventListener('DOMContentLoaded', function () {
                updateCartTotals();
                attachEventListeners();
            });

            function updateCartTotals() {
                let subTotal =  <%=totalD%>
                let junkFoodDetails = [];
                document.querySelectorAll('.quantity-input').forEach(input => {
                    const price = parseFloat(input.dataset.price);
                    const quantity = parseInt(input.value);
                    const id = input.dataset.id;
                    const name = input.dataset.name;
                    subTotal += price * quantity ;

                    if (quantity > 0) {
                        junkFoodDetails.push({id: id, name: name, quantity: quantity});
                    }

                    const totalId = input.dataset.target;
                    const totalElement = document.getElementById(totalId);
                    if (totalElement) {
                        totalElement.textContent = (price * quantity).toFixed(2);
                    }
                });

                const tax = subTotal * 0.10; // Giả sử thuế là 10%
                const totalPrice = subTotal + tax ;

                document.getElementById('sub-total').textContent = subTotal.toFixed(2);
                document.getElementById('tax-amount').textContent = tax.toFixed(2);
                document.getElementById('total-price').textContent = totalPrice.toFixed(2);

                // Đặt thông tin chi tiết đồ ăn vào input hidden để gửi đi
                document.getElementById('junkFoodDetails').value = JSON.stringify(junkFoodDetails);
            }

            function attachEventListeners() {
                // Thêm sự kiện cho nút tăng và giảm số lượng
                document.querySelectorAll('.number-increment, .number-decrement').forEach(button => {
                    button.addEventListener('click', function () {
                        const inputGroup = this.closest('.number-spinner');
                        const quantityInput = inputGroup.querySelector('.quantity-input');
                        const isIncrement = this.classList.contains('number-increment');
                        const currentQuantity = parseInt(quantityInput.value);

                        quantityInput.value = isIncrement ? currentQuantity + 1 : Math.max(currentQuantity - 1, 0);
                        updateCartTotals(); // Cập nhật tổng giá trị giỏ hàng và gửi dữ liệu
                    });
                });

                // Cập nhật tổng giá khi thay đổi số lượng từ input
                document.querySelectorAll('.quantity-input').forEach(input => {
                    input.addEventListener('change', function () {
                        updateCartTotals(); // Cập nhật tổng giá trị giỏ hàng và gửi dữ liệu
                    });
                });
            }

        </script>
    </body>
</html>