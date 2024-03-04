/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.pro;

import data.DAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import net.minidev.json.JSONObject;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;

/**
 *
 * @author QuocHai
 */
public class InsertSeat extends HttpServlet {

    private static String formatItems(String jsonStr) throws JSONException {
        JSONArray items = new JSONArray(jsonStr);
        StringBuilder result = new StringBuilder();

        for (int i = 0; i < items.length(); i++) {
            org.codehaus.jettison.json.JSONObject item = items.getJSONObject(i);

            int quantity = item.getInt("quantity");
            String name = item.getString("name");
            int price = item.getInt("id");

            // Tạo chuỗi theo format "quantity x name (price)"
            result.append(quantity).append(" x ").append(name);

            // Nếu không phải item cuối cùng thì thêm dấu phẩy và khoảng trắng
            if (i < items.length() - 1) {
                result.append(", ");
            }
        }

        return result.toString();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get parameters from the request
        String User = request.getParameter("User");
        int showtimeId = Integer.parseInt(request.getParameter("showtimeId"));
        String seatsData = request.getParameter("seatsData");
        String midParameter = request.getParameter("movieId");
        double total = Double.parseDouble(request.getParameter("totalD"));
        int count = Integer.parseInt(request.getParameter("countD"));
        String junkFoodDetails = request.getParameter("junkFoodDetails");

        // Tạo một đối tượng SimpleDateFormat với định dạng mong muốn
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        int UserID = 0;
        Date now = new Date();
        DAO dao = new DAO();
        // lay id user
        ResultSet rs = dao.getNameUser("user123");
        try {
            while (rs.next()) {
                UserID = Integer.parseInt(rs.getString("UserID"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(InsertSeat.class.getName()).log(Level.SEVERE, null, ex);
        }
        // Format ngày giờ
        String strDate = formatter.format(now);

        if (midParameter == null) {
            // Handle the missing parameter error
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "The 'Mid' parameter is missing.");
            return;
        }

        int Mid;
        try {
            Mid = Integer.parseInt(midParameter);
        } catch (NumberFormatException e) {
            // Handle the case where Mid is not a valid integer
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "The 'Mid' parameter is not a valid number.");
            return;
        }
        // Split the seatsData by commas into an array
        String[] seatsArray = seatsData.split(",");

        // Create an instance of DAO to interact with the database
        boolean allSeatsAvailable = true;
        List<Integer> seatIdsToBook = new ArrayList<>();
        try {
            // Check availability for all seats first
            for (String seat : seatsArray) {
                // Assuming seat format is "row-column"
                String[] parts = seat.split("-");
                int row = Integer.parseInt(parts[0]);
                int column = Integer.parseInt(parts[1]);

                int seatId = dao.getSeatID(row, column);
                if (!dao.isSeatAvailable(seatId, showtimeId)) {
                    allSeatsAvailable = false;

                    break; // Break out of the loop as soon as an unavailable seat is found
                } else {

                    seatIdsToBook.add(seatId); // Add to list if seat is available

                }
            }
            String result = formatItems(junkFoodDetails);

            if (allSeatsAvailable) {
                for (int seatId : seatIdsToBook) {
                    dao.bookSeats(seatId, showtimeId, UserID);
                }
                dao.insertBooking(UserID, showtimeId, count, total, result, Mid, seatsData);
                // Redirect to a success page or another relevant page
                response.sendRedirect("deleteLocal");
            } else {
                response.setContentType("text/html");
                 PrintWriter out = response.getWriter();

                // If any seat is not available, redirect to a specific page and send an error message
                HttpSession session = request.getSession();
                request.getSession().setAttribute("Mid", Mid);
                request.getSession().setAttribute("ShowID", showtimeId);
                session.setAttribute("bookingError", "Đã có người đặt nhanh hơn bạn!");
                request.getRequestDispatcher("SeatBooking.jsp").forward(request, response);

            }

        } catch (Exception e) {
            // Handle any exceptions, roll back transaction if needed

            // Log the exception and possibly notify the user
            e.printStackTrace(); // Replace with proper logging

            // Set response status or redirect to an error page
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing booking.");
        } finally {
            // Clean up
            // ...
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
