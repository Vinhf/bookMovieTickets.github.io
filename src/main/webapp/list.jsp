<%@page import="jakarta.servlet.http.Cookie"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="data.DAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List</title>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css"/>
        <link rel="stylesheet" href="./css/stylecss.css"/>
    </head>
    <body>
        <h1>List!</h1>
        <div class="text-right">
            <%
           DAO dao = new DAO();
            Cookie[] cookies = request.getCookies();
            int id = 0;
             if (cookies != null) {
                for (Cookie cookie : cookies) {
                if ("UserC".equals(cookie.getName())) { // Thay "UserC" bằng tên của cookie bạn muốn lấy
                    String username = cookie.getValue();
                     ResultSet rs = dao.getAllaccount();
                     while (rs.next()) {
                      if (rs.getString("username").equals(username)) {                
                        id = rs.getInt("UserID");
        
            %>
            Hello,<%= username%> 

            <%
                            }
                        }
                    }
                }
            }
            %>

        </div>  
        <%
          
        %>

        <table id="example" class="display">
            <thead>
                <tr>
                        <th>Booking ID</th>
                        <th>Name</th>
                        <th>Phone</th>
                        <th>TheaterName</th>
                        <th>MovieTitle </th>
                        <th>StartTime</th>
                        <th>Seat</th>
                        <th>BookingDate</th>
                        <th>TicketCount</th>
                        <th>TotalPrice</th>
                        <th>JunkFood </th>
                       
                                    
                </tr>
            </thead>
            <tbody>
                <%
                    ResultSet rs = dao.getUserBookings(id);
                    while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getInt("BookingID")%></td>
                    <td><%=rs.getString("Username")%></td>
                    <td><%=rs.getString("Phone")%></td>
                    <td><%=rs.getString("TheaterName")%></td>
                    <td><%=rs.getString("MovieTitle")%></td>
                    <td><%=rs.getString("StartTime")%></td>
                    <td><%= rs.getString("Seats")%></td>
                    <td><%= rs.getDate("BookingTime")%></td>
                    <td><%= rs.getInt("TicketCount")%></td>
                    <td><%= rs.getDouble("TotalPrice")%></td>
                    <td><%= rs.getString("JunkFood")%></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>

        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
        <script>
            new DataTable('#example');
        </script>

        

        <form action="Home.jsp" method="post">
            <h3 style="color: red">${requestScope.error}</h3>
            <div style="text-align: center;">
                <button style="width: 150px; height: 50px;" ><h2>back</h2> </button>
            </div>
        </form>
        <script>
            function confirmOrder() {
            <%
                for (Cookie cookie : cookies) {
                if ("UserC".equals(cookie.getName())) { // Thay "UserC" bằng tên của cookie bạn muốn lấy
                    String username = cookie.getValue();
            %>
                var result = confirm("ban <%= username%> có chắc chắn muốn đặt hàng?");
            <%
                    }
                }
            %>
                if (result) {
                    // Thực hiện hành động khi người dùng chọn "Yes"
                    alert("Đã đặt hàng!");
                } else {
                    // Thực hiện hành động khi người dùng chọn "No" hoặc hủy bỏ
                    alert("Đã hủy đặt hàng.");
                }
            }

            function confirmOrder() {

            }
        </script>
    </body>
</html>
