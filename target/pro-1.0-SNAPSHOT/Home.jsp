<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="data.DAO"%>  
<%@page import="controller.Movie"%>  
<%@page import="java.util.List"%> 
<%@page import="jakarta.servlet.http.Cookie"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet"type="text/css"href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>



        <title>VIETTICK Mock-up</title>
    </head>
    <body style="background-color: #fffdf5">
        <header style="background-color: #1df0f2;">
            <div class="text-left" >
                <%
                   DAO dao = new DAO();
                   List<Movie> listM = dao.getMovie();
                   String username = null;
                    Cookie[] cookies = request.getCookies();
                    if (cookies != null) {
                        for (Cookie cookie : cookies) {
                            if ("UserC".equals(cookie.getName())) { // Thay "UserC" bằng tên của cookie bạn muốn lấy
                                 username = cookie.getValue();
                                    break; // Ngắt vòng lặp sau khi tìm thấy cookie
                                     }
                         }
                    }

                     if (username != null) {
        // Người dùng đã đăng nhập
                %>
                HELLO , <%= username%>
                <%
                     } else {
        // Chưa đăng nhập hoặc cookie không tồn tại
        response.sendRedirect("signOut");
        return; // Kết thúc việc thực thi mã sau khi chuyển hướng
    }           
                %>
            </div>
            <nav class="text-right" style="display: flex; justify-content: flex-end;">
                <a href="list.jsp">VÉ CỦA TÔI</a>
                <a href="#">THÀNH VIÊN</a>
                <a href="signOut">SIGN-UP</a>
            </nav>
        </header>
        <div class="text-container">
            <div class="bold-text">VIETTICK</div>
        </div>



        <div class="menu-bar" style="background-color: #1df0f2">
            <a href="#">MUA VÉ</a>
            <a href="#">RẠP CHIẾU PHIM</a>
            <a href="#">KHUYẾN MÃI</a>
        </div>

        <div class>
            <h1 style="text-align: center">GỢI Ý PHIM HAY</h1>
        </div>
        <div class ="layer">
            <div class="bg-image hover-zoom slide-show">
                <div class="list-images">
                    <%                   
                    int count = 0;
                             ResultSet rsm = dao.getAllMovie();
                         while (rsm.next()) {   
                         if (rsm.getInt("Evaluate") == 5) { 
                            count++;
                    %>                  

                    <img src="<%= rsm.getString("ImageUrlBig")%>" alt="img<%=count%>" class="w-100">
                    <%   }        
                       }%>
                </div>
            </div>
            <div class ="btns">
                <div class = "btns-left btn">
                    <i class='bx bx-chevron-left'></i>
                </div>
                <div class = "btns-right btn">
                    <i class='bx bx-chevron-right'></i>
                </div>
            </div>
            <div class="index-images">
                <div class="index-item index-item-0 active"></div>
                <%for(int i = 1; i < count ; i++) {      
                %>
                <div class="index-item index-item-<%=i%> "></div>                  
                <%}
                %>



            </div>
        </div>




        <div class="selection-area">

            <select>
                <option>Chọn Phim</option>

            </select>
            <select>
                <option>Chọn Rạp</option>
                <!-- Other cinema options -->
            </select>
            <select>
                <option>Chọn Ngày</option>
                <!-- Other date options -->
            </select>
            <select>
                <option>Chọn Xuất</option>
                <!-- Other showtime options -->
            </select>
        </div>

        <div class="movie-section">

            <button id="nowShowingButton" class="button is-rounded" onclick="showNowShowing()">Sắp chiếu</button>
            <button id="upcomingButton" class="button is-rounded" onclick="showUpcoming()">Đang chiếu </button>

            <div class="movie-content">
                <div class="container">
                    <div class="row" style="display: flex; flex-wrap: wrap;justify-content: space-evenly;">
                        <%       
                        for (Movie M : listM) {
                        if(M.getStatus() == 1) {
                        %>
                        <div class="col-12 col-md-6 col-lg-3 now-showing" style="display: none; justify-content: center; align-items: center; margin: 10px;">
                            <div class="card">
                                <a href="InforMovie?Mid=<%= M.getMovieId()%>">
                                    <img class="card-img-top" src="<%=M.getImageUrl()%>" style="width: 300px; height: 440px; border-radius: 30px">
                                    <div class="card-body">
                                        <h4 class="card-title" style="color: #262626; font-size: 20px; font-family: Montserrat; font-weight: 700; word-wrap: break-word"><%=M.getTitle()%></h4>
                                    </div>
                                </a>

                            </div>
                        </div>  
                        <%
                            }
                } %>
                        <% for (Movie Mo : listM) { 
                if(Mo.getStatus() == 0) {%>
                        <div class="col-12 col-md-6 col-lg-3 upcoming" style="display: flex; justify-content: center; align-items: center; margin: 10px;">
                            <div class="card">
                                <a href="InforMovie?Mid=<%= Mo.getMovieId()%>">
                                    <img class="card-img-top" src="<%=Mo.getImageUrl()%>" style="width: 300px; height: 440px; border-radius: 30px">
                                    <div class="card-body">
                                        <h4 class="card-title" style="color: #262626; font-size: 20px; font-family: Montserrat; font-weight: 700; word-wrap: break-word"><%=Mo.getTitle()%></h4>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <%
                    }
               } %>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <script src="js/scripts.js"></script>
</body>

</html>
