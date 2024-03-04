<%@page import="java.sql.ResultSet"%>
<%@page import="data.DAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Showtime</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">

        <style>
            body {
                background-color: #f8f9fa; /* màu nền nhẹ nhàng */
            }
            .container {
                margin-top: 50px;
            }
        </style>
    </head>
    <body>
        <form action="AminPage.jsp">
            <button type="submit" class="btn btn-primary">Back</button>
        </form>
        <div class="container">
            <h2>Add New Showtime</h2>
            <% 
                DAO dao = new DAO(); // Khởi tạo DAO
               ResultSet rsm = dao.getAllMovie();
               ResultSet rsT = dao.getAllTheaters();

          
           
            %>
            <form action="AddShowtimes" method="post">
                <!-- MovieID dropdown -->
                <div class="form-group">
                    <label for="movieId">Movie:</label>
                    <select class="form-control" id="movieId" name="movieId" required>
                        <%   while (rsm.next())  { %>
                        <option value="<%=rsm.getString("MovieID")%>"><%=rsm.getString("Title")%></option>
                        <% } %>
                    </select>
                </div>

                <!-- TheaterID dropdown -->
                <div class="form-group">
                    <label for="theaterId">Theater:</label>
                    <select class="form-control" id="theaterId" name="theaterId" required>
                        <% while (rsT.next()) { %>
                        <option value="<%= rsT.getString("TheaterID") %>"><%= rsT.getString("Name") %></option>
                        <% } %>
                    </select>
                </div>

                <!-- StartTime input -->
                <div class="form-group">
                    <label for="startTime">Start Time:</label>
                    <input type="text" class="form-control flatpickr" id="startTime" name="startTime" required/>
                </div>

                <!-- EndTime input -->
                <div class="form-group">
                    <label for="endTime">End Time:</label>
                    <input type="text" class="form-control flatpickr" id="endTime" name="endTime" required/>
                </div>

                <!-- TicketPrice input -->
                <div class="form-group">
                    <label for="ticketPrice">Ticket Price:</label>
                    <input type="number" min="0" step="0.01" class="form-control" id="ticketPrice" name="ticketPrice" required/>
                </div>

                <!-- DateAdded input -->
                <div class="form-group">
                    <label for="dateAdded">Date Added:</label>
                    <input type="text" class="form-control flatpickr" id="dateAdded" name="dateAdded" required/>
                </div>

                <!-- Submit button -->
                <button type="submit" class="btn btn-primary">Add Showtime</button>
            </form>
        </div>

        <!-- Flatpickr script -->


        <!-- Other scripts -->
        <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

        <script>
            flatpickr("#startTime", {
                enableTime: true,
                noCalendar: true,
                dateFormat: "H:i",
                time_24hr: true,
                onChange: function (selectedDates, dateStr, instance) {
                    // Khi có sự thay đổi ở StartTime, cập nhật EndTime
                    if (selectedDates[0]) {
                        // Tạo một đối tượng Date mới dựa trên thời gian đã chọn
                        let endTime = new Date(selectedDates[0]);
                        // Cộng thêm 2 giờ 15 phút
                        endTime.setHours(endTime.getHours() + 2);
                        endTime.setMinutes(endTime.getMinutes() + 15);

                        // Cập nhật giá trị của EndTime bằng cách sử dụng giờ và phút
                        let endHour = endTime.getHours().toString().padStart(2, '0');
                        let endMinutes = endTime.getMinutes().toString().padStart(2, '0');

                        // Đặt giá trị mới cho EndTime
                        document.getElementById("endTime").value = endHour + ':' + endMinutes;
                    }
                }
            });
            
            // Khởi tạo flatpickr cho EndTime
            flatpickr("#endTime", {
                enableTime: true,
                noCalendar: true,
                dateFormat: "H:i",
                time_24hr: true
            });
            // Khởi tạo flatpickr cho DateAdded
            flatpickr("#dateAdded", {
                minDate: "today",
                dateFormat: "Y-m-d"
            });

        </script>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.9/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
