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
            <h2>Add New Junk Food</h2>                
            <form action="AddJunkFood" method="post">

                <div class="form-group">
                    <label for="title">Name:</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>
                <div class="form-group">
                    <label for="genre">Price: </label>
                    <input type="text" class="form-control" id="Price" name="Price"required>
                </div>
                <div class="form-group">
                    <label for="imageUrl">ImageUrl: </label>
                    <input type="text" class="form-control" id="ImageUrl" name="ImageUrl" >
                </div>
               
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>   
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.9/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>