<%-- 
    Document   : AddMovie
    Created on : Nov 9, 2023, 3:48:32 AM
    Author     : QuocHai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <h2>Add New Movie</h2>

            <form action="AddMovie" method="post">
                 <div class="form-group">
                    <label for="evaluate">MovieID: </label>
                    <select class="form-control" id="evaluate" name="evaluate">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="description">Description:</label>
                    <textarea class="form-control" id="description" name="description" required></textarea>
                </div>
                <div class="form-group">
                    <label for="releaseDate">Release Date:</label>
                    <input type="text" class="form-control" id="releaseDate" name="releaseDate" required/>
                </div>
                <div class="form-group">
                    <label for="genre">Genre:</label>
                    <input type="text" class="form-control" id="genre" name="genre" required>
                </div>
                <div class="form-group">
                    <label for="imageUrl">Image URL:</label>
                    <input type="text" class="form-control" id="imageUrl" name="imageUrl">
                </div>
                <div class="form-group">
                    <label for="imageUrlBig">Large Image URL:</label>
                    <input type="text" class="form-control" id="imageUrlBig" name="imageUrlBig">
                </div>
                <div class="form-group">
                    <label for="status">Status:</label>
                    <select class="form-control" id="status" name="status">
                        <option value="1">Inactive</option>
                        <option value="0">Active</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="evaluate">Evaluate:</label>
                    <select class="form-control" id="evaluate" name="evaluate">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
        <script>
            flatpickr("#releaseDate", {
                dateFormat: "Y-m-d"
            });

        </script>    
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.9/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>