<%-- 
    Document   : AminPage
    Created on : Nov 8, 2023, 11:45:58 PM
    Author     : QuocHai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="data.DAO"%>
<%@page import="controller.JunkFood"%>  
<%@page import="java.util.List"%>
<link href="css/AdminCss.css" rel="stylesheet">
<span style="font-family: verdana, geneva, sans-serif;"><!DOCTYPE html>
    <html lang="en">
        <head>
            <meta charset="UTF-8" />
            <title>Attendance Dashboard | By Code Info</title>
            <link rel="stylesheet" href="style.css" />
            <!-- Font Awesome Cdn Link -->
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"/>
        </head>
        <body>
            <div class="container">
                <nav>
                    <ul>
                        <li><a href="#" class="logo">
                                <img src="https://scontent.fsgn5-10.fna.fbcdn.net/v/t39.30808-6/368059961_681727200661097_1818875285088731296_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=5f2048&_nc_ohc=-JoOxJS7l-cAX_WSYYa&_nc_ht=scontent.fsgn5-10.fna&oh=00_AfBBfTEU9sKZotpDKhY-P6xIP4L8yxSU7k5ZyTzDYeCklw&oe=6551B036">
                                <span class="nav-item">Admin</span>
                            </a></li>
                        <li><a href="#" id="user-link">
                                <i class="fas fa-menorah"></i>
                                <span class="nav-item">User</span>
                            </a></li>
                        <li><a href="#" id="movie-link"">
                                <i class="fas fa-comment"></i>
                                <span class="nav-item">Movie</span>
                            </a></li>
                        <li><a href="#" id="showtime-link">
                                <i class="fas fa-database"></i>
                                <span class="nav-item">Show Time</span>
                            </a></li>
                        <li><a href="#" id="Theater-link">
                                <i class="fas fa-chart-bar"></i>
                                <span class="nav-item">Theater</span>
                            </a></li>
                        <li><a href="#" id="JunkFood-link">
                                <i class="fas fa-cog" ></i>
                                <span class="nav-item">JunkFood</span>
                            </a></li>

                        <li><a href="login.jsp" class="logout">
                                <i class="fas fa-sign-out-alt"></i>
                                <span class="nav-item">Log out</span>
                            </a></li>
                    </ul>
                </nav>


                <section class="main">
                    <%DAO dao = new DAO();%>
                    <section class="attendance" id="user-management" >
                        <div class="attendance-list">
                            <h1> User </h1>
                            <button>ADD</button>
                            <table class="table">

                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Phone</th>
                                        <th>BirthDay</th>
                                        <th>Gender</th>
                                        <th>Region</th>
                                        <th>Favorite Cinema</th>
                                        <th>edit</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <% 
                                ResultSet rsc = dao.getAllaccount();
                                while (rsc.next()) {
                                    %>
                                    <tr>
                                        <td><%=rsc.getString("UserID")%></td>
                                        <td><%=rsc.getString("Username")%></td>
                                        <td><%=rsc.getString("Email")%></td>
                                        <td><%=rsc.getString("Phone")%></td>
                                        <td><%=rsc.getString("BirthDay")%></td>
                                        <td><%=rsc.getString("Gender")%></td>
                                        <td><%=rsc.getString("Region")%></td>
                                        <td><%=rsc.getString("FavoriteCinema")%></td>
                                        <td><button>Edit</button></td>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>
                        </div>

                    </section>

                    <section class="attendance" id="movie-management" style="display:none;">
                        <div class="attendance-list">
                            <h1>Movie</h1>
                            <a href="AddMovie.jsp"><button>ADD</button></a>
                            <table class="table">

                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Title</th>
                                        <th>ReleaseDate</th>
                                        <th>Genre</th>
                                        <th>ImageUrl</th>
                                        <th>status</th>
                                        <th>Evaluate</th>
                                        <th>ImageUrl Big</th>
                                        <th>edit</th>
                                        <th>delete</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <% 
                                 ResultSet rsm = dao.getAllMovie();
                                    while (rsm.next()) {
                                    %>
                                    <tr>
                                        <td><%=rsm.getString("MovieID")%></td>
                                        <td><%=rsm.getString("Title")%></td>                     
                                        <td><%=rsm.getString("ReleaseDate")%></td>
                                        <td><%=rsm.getString("Genre")%></td>
                                        <td><img src="<%=rsm.getString("ImageUrl")%>" alt="alt" style="width: 100px; height: 100px"/></td>
                                        <td><%=rsm.getString("status")%></td>
                                        <td><%=rsm.getString("Evaluate")%></td>
                                        <td><img src="<%=rsm.getString("ImageUrlBig")%>" alt="alt" style="width: 150px; height: 100px"/></td>
                                        <td><a href="UpdateMovie.jsp?id=<%=rsm.getString("MovieID")%>" style="text-decoration: none; width: 100%"><button>Edit</button></a></td>
                                        <td><a href="DeleteMovie?id=<%=rsm.getString("MovieID")%>" style="text-decoration: none; width: 100%"><button>delete</button></a></td>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>
                        </div>

                    </section>     
                    <section class="attendance"  id="showtime-management"style="display:none;">
                        <div class="attendance-list">
                            <h1> Showtimes</h1>
                            <a href="AddShowtime.jsp"><button>ADD</button></a>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Movie ID</th>
                                        <th>Start Time</th>
                                        <th>End Time</th>
                                        <th>TheaterID</th>
                                        <th>TicketPrice</th>
                                        <th>DateAdded</th>
                                        <th>delete</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <% 
                               ResultSet rsS = dao.getAllShowtimes();
                                while (rsS.next()) {
                                    %>
                                    <tr>
                                        <td><%=rsS.getString("ShowtimeID")%></td>
                                        <td><%=rsS.getString("MovieID")%></td>                     
                                        <td><%=rsS.getString("StartTime")%></td>
                                        <td><%=rsS.getString("EndTime")%></td>
                                        <td><%=rsS.getString("TheaterID")%></td>
                                        <td><%=rsS.getString("TicketPrice")%></td>
                                        <td><%=rsS.getString("DateAdded")%></td>
                                        <td><a href="DeleteShowtimes?id=<%=rsS.getString("ShowtimeID")%>" style="text-decoration: none; width: 100%"><button>delete</button></a></td>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>
                        </div>
                    </section>  
                    <section class="attendance"  id="Theater-management"style="display:none;">
                        <div class="attendance-list">
                            <h1>Theater</h1>
                            <a href="AddThearters.jsp"><button>ADD</button></a>
                            <table class="table">

                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Address</th>
                                        <th>SeatCount</th>
                                        <th>edit</th>
                                        <th>delete</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <% 
                              ResultSet rsT = dao.getAllTheaters();
                                while (rsT.next()) {
                                    %>
                                    <tr>
                                        <td><%=rsT.getString("TheaterID")%></td>
                                        <td><%=rsT.getString("Name")%></td>                     
                                        <td><%=rsT.getString("Address")%></td>
                                        <td><%=rsT.getString("SeatCount")%></td>
                                        <td><a href="Updatethearter.jsp?id=<%=rsT.getString("TheaterID")%>" style="text-decoration: none; width: 100%"><button>Edit</button></a></td>
                                        <td><a href="DeleteThearter?id=<%=rsT.getString("TheaterID")%>" style="text-decoration: none; width: 100%"><button>delete</button></a></td>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>
                        </div>

                    </section> 
                    <section class="attendance"  id="JunkFood-management"style="display:none;">
                        <div class="attendance-list">
                            <h1>Theater</h1>
                            <a href="AddJunkFood.jsp"><button>ADD</button></a>
                            <table class="table">

                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Price</th>
                                        <th>Image</th>
                                        <th>edit</th>
                                        <th>delete</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <% 
                                        ResultSet rsJ = dao.getAllJunkFoods();
                                        while (rsJ.next()) {
                                    %>
                                    <tr>
                                        <td><%=rsJ.getString("JunkFoodID")%></td>
                                        <td><%=rsJ.getString("Name")%></td>                     
                                        <td><%=rsJ.getString("Price")%></td>
                                        <td><img src="<%=rsJ.getString("ImageUrl")%>" width="150px" height="100px" alt="alt"/></td>
                                        <td><a href="UpdateJunkFood.jsp?id=<%=rsJ.getString("JunkFoodID")%>" style="text-decoration: none; width: 100%"><button>Edit</button></a></td>
                                        <td><a href="DeleteJunkFood?id=<%=rsJ.getString("JunkFoodID")%>" style="text-decoration: none; width: 100%"><button>delete</button></a></td>
                                    </tr>
                               <%}%>
                                </tbody>
                            </table>
                        </div>

                    </section>
                </section>
            </div>
            <script >
                function showSection(sectionId) {
                    // Ẩn tất cả các phần
                    document.querySelectorAll('.attendance').forEach(function (section) {
                        section.style.display = 'none';
                    });

                    // Hiển thị phần được chọn
                    document.getElementById(sectionId).style.display = 'block';
                }

// Gán hàm này vào các liên kết hoặc nút trên menu của bạn
                document.getElementById('user-link').addEventListener('click', function () {
                    showSection('user-management');
                });
                document.getElementById('movie-link').addEventListener('click', function () {
                    showSection('movie-management');
                });
                document.getElementById('showtime-link').addEventListener('click', function () {
                    showSection('showtime-management');
                });
                document.getElementById('Theater-link').addEventListener('click', function () {
                    showSection('Theater-management');
                });
                document.getElementById('JunkFood-link').addEventListener('click', function () {
                    showSection('JunkFood-management');
                });
            </script>
        </body>

    </html>
</span>