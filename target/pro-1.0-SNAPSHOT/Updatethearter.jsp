<%-- 
    Document   : AddMovie
    Created on : Nov 9, 2023, 3:48:32 AM
    Author     : QuocHai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="data.DAO"%>  
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Movie</title>
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
    <body> <form action="AminPage.jsp">
            <button type="submit" class="btn btn-primary">Back</button>
        </form>
        <div class="container">
            <h2>Update thearter</h2>                
            <form action="UpdateThearter" method="post">
                 <%
                DAO dao = new DAO();
                int ID = Integer.parseInt(request.getParameter("id"));
                ResultSet rsT = dao.getIDTheaters(ID);
                while (rsT.next()) {
            %>
                <input type="hidden" name="id" value="<%= ID %>" />
                <div class="form-group">
                    <label for="title">Name:</label>
                    <input type="text" class="form-control" id="name" name="name" value="<%=rsT.getString("Name")%>"required>
                </div>


                <div class="form-group">
                    <label for="genre">Address: </label>
                    <input type="text" class="form-control" id="Address" name="Address" value="<%=rsT.getString("Address")%>" required>
                </div>
                <div class="form-group">
                    <label for="imageUrl">SeatCount: </label>
                    <input type="text" class="form-control" id="SeatCount" name="SeatCount" value="<%=rsT.getInt("SeatCount")%>">
                </div>
               
                <button type="submit" class="btn btn-primary">Submit</button>
                <%}%>
            </form>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>   
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.9/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>