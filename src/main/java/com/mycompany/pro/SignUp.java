/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.pro;


import data.DAO;
import data.userContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author QuocHai
 */
public class SignUp extends HttpServlet {

    private boolean checkLogin(String username) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean check = false;
        try {
            conn = userContext.connect();
            String sql = "select * from Users WHERE Username = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
   
            rs = ps.executeQuery();

            check = rs.next(); // Trả về true nếu có tài khoản hợp lệ
        } catch (SQLException ex) {
            Logger.getLogger(SignUp.class.getName()).log(Level.SEVERE, null, ex);
            check = false; // Xử lý lỗi SQL và đánh dấu tài khoản không hợp lệ
        } finally {
            // Đóng các tài nguyên kết nối sau khi sử dụng
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(SignUp.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return check;

    }
    
     private String hashPasswordMD5(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] passwordBytes = password.getBytes();
            byte[] hashBytes = md.digest(passwordBytes);

            // Chuyển đổi byte[] thành chuỗi hex
            StringBuilder sb = new StringBuilder();
            for (byte b : hashBytes) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(SignUp.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Severlet at: ").append(request.getContextPath());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("name");
        String password = request.getParameter("password");
        String fakepass = hashPasswordMD5(password);
        String email = request.getParameter("email");
        String Phone = request.getParameter("phone");
        String birthday = request.getParameter("dob-year") +"-" + request.getParameter("dob-month")+"-"+request.getParameter("dob-day");
        String gender = request.getParameter("gender");
        String Region = request.getParameter("region");
        String FavoriteCinema = request.getParameter("favCinema");

//           try (PrintWriter out = response.getWriter()) {
//        out.println("<!DOCTYPE html>");
//        out.println("<html>");
//        out.println("<head>");
//        out.println("<title>Registration Information</title>");  
//        out.println("</head>");
//        out.println("<body>");
//        out.println("<h1>Registration Information</h1>");
//        out.println("<p>Username: " + username + "</p>");
//        out.println("<p>Password: " + password + "</p>"); // Be cautious about printing passwords!
//        out.println("<p>Hashed Password: " + fakepass + "</p>");
//        out.println("<p>Email: " + email + "</p>");
//        out.println("<p>Phone: " + Phone + "</p>");
//        out.println("<p>Birthday: " + birthday + "</p>");
//        out.println("<p>Gender: " + gender + "</p>");
//        out.println("<p>Region: " + Region + "</p>");
//        out.println("<p>Favorite Cinema: " + FavoriteCinema.replaceAll("-", " ") + "</p>");
//        out.println("</body>");
//        out.println("</html>");
//    }
        if(checkLogin(username) == true || username == null) {
            request.setAttribute("wrong","The account is already in use");
            request.getRequestDispatcher("signUp.jsp").forward(request, response);
        }
        else {
            DAO dao = new DAO();
            dao.signUp(username, fakepass, 1, email, Phone, birthday, gender, Region, FavoriteCinema.replaceAll("-", " "));
            response.sendRedirect("login.jsp");
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
