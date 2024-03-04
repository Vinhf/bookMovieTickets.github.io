<%-- 
    Document   : ShowInforMovie
    Created on : Oct 26, 2023, 12:21:42 AM
    Author     : QuocHai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controller.Movie"%>  
<%@page import="java.sql.ResultSet"%>
<%@page import="data.DAO"%>  
<%@page import="java.util.List"%> 
<%@page import="controller.Showtime"%>  
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/InforMovie.css">     
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
        <link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_red.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
        


        <title>Cinema</title>

    </head>
    <body>
        <%int Mid = (Integer) request.getSession().getAttribute("Mid");
         String selectedDate = request.getParameter("selectedDate");
                         // Chắc chắn rằng bạn đã nhận được một ngày hợp lệ từ request.
             if(selectedDate == null) {
             selectedDate = "2023-11-01";
            }
             DAO dao = new DAO();       
                    
            ResultSet rs = dao.getMovieID(Mid);
            while (rs.next()) {
        %>

        <div class="container mt-5">
            <!-- Header -->
            <div id="header" class="text-center bg-dark text-white py-4 mb-3">
                <h1 class="display-4">Cinema - <%= rs.getString("Title") %></h1>
            </div>
            <div class="mb-3">
                <a href="Home.jsp" class="btn btn-primary">
                    <i class="bi bi-arrow-left"></i> Back
                </a>
            </div>
            <div class="layer" style="display: flex;">
                <div class="layer1" style="flex: 60%;">
                    <div class="row">
                        <div class="col-lg-8 mb-3">
                            <!-- Main movie info with a shadow -->
                            <div id="main-movie" class="card shadow-sm" >
                                <div class="row g-0">
                                    <div class="col-md-6">
                                        <img src="<%= rs.getString("ImageUrl") %>" alt="Movie Image" class="img-fluid rounded-start">
                                    </div>
                                    <div class="col-md-6">
                                        <div class="card-body">
                                            <h2 class="card-title"><%= rs.getString("Title") %></h2>
                                            <p class="card-text"><%= rs.getString("Description") %></p>
                                            <p class="card-text"><small class="text-muted">Ngày chiếu: <%= rs.getString("ReleaseDate") %></small></p>
                                            <p class="card-text"><small class="text-muted">Thể loại: <%= rs.getString("Genre") %></small></p>
                                            <!-- ... Other details ... -->
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <!-- Showtimes -->

                            <div id="showtimes" >
                                <div class="showtime-header">
                                    <h3>Lịch chiếu <%= rs.getString("Title")%></h3>
                                </div>
                                <div class="mb-3">
                                    <label for="Date" class="form-label">Chọn ngày</label>
                                    <input name="Date" id="Date" type="datetime-local" name="selectedDate" class="form-control" onchange="reloadWithDate(this.value)" placeholder="<%= selectedDate != null ? selectedDate : "Chọn Ngày" %>">
                                </div>
                                <div class="showtime-list"style="display: flex; margin: 5px">

                                    <%                     
                                    List<Showtime> listS = dao.getShowtimesByMovieID(1, selectedDate);
                                    for (Showtime showtime : listS) {         
                                    %>
                                    <a href="SeatBooking?ShowID=<%= showtime.getShowtimeID()%>&Mid=<%= Mid%>" style="text-decoration: none">  
                                        <button class="showtime-button" data-showtime-id="<%= showtime.getShowtimeID() %>">
                                            <%= showtime.getStartTime()%> - <%=showtime.getEndTime()%>
                                        </button>
                                    </a>
                                    <%}%>
                                </div>
                            </div>
                            <%
                        }%>
                        </div>
                    </div> 
                </div>
                <!-- Other movies -->
                <div class="layer2" style="flex: 40%;">
                    <div id="other-movies" class="mt-3">
                        <h3 class="mb-3">Phim đang chiếu</h3>
                        <div class="row">
                            <% 
                                 List<Movie> listM = dao.getMovie();
                                for (Movie M : listM) {
                                if (M.getEvaluate() >= 3 && M.getEvaluate() <=5 && M.getMovieId() != Mid) { %>
                            <div class="col-sm-6 col-md-4 col-lg-3 mb-4">
                                <div class="card h-100">
                                    <a href="InforMovie?Mid=<%= M.getMovieId() %>">
                                        <img class="card-img-top" src="<%= M.getImageUrl() %>" alt="<%= M.getTitle() %>" style="width: 100%; height: 100px;">
                                    </a>
                                    <div class="card-body">
                                        <h5 class="card-title text-center"><%= M.getTitle() %></h5>
                                        <!-- Thêm các thông tin khác về phim ở đây -->
                                    </div>
                                </div>
                            </div>
                            <%      }
                            } %>
                        </div>
                    </div>
                </div>




            </div>
            <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
            <script>
                                        flatpickr("#Date", {});

                                        function reloadWithDate(selectedDate) {
                                            if (selectedDate) {
                                                // Xây dựng URL mới với tham số ngày tháng và reload trang.
                                                var url = new URL(window.location.href);
                                                url.searchParams.set('selectedDate', selectedDate);
                                                window.location.href = url.href; // Điều này sẽ làm mới trang với tham số mới.
                                            }
                                        }


            </script>

    </body>
</html>
