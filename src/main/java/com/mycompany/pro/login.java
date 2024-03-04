/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.pro;

import data.DAO;
import data.userContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.bind.DatatypeConverter;

/**
 *
 * @author QuocHai
 */
public class login extends HttpServlet {

    private boolean checkLogin(String username, String passwordFake) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean check = false;
        try {
            conn = userContext.connect();
            String sql = "select * from Users WHERE Username = ? AND Password = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, passwordFake);
            rs = ps.executeQuery();

            check = rs.next(); // Trả về true nếu có tài khoản hợp lệ
        } catch (SQLException ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
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
                Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return check;

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         Cookie arr[] =request.getCookies();
        for (Cookie cookie : arr) {
            if(cookie.getName().equals("UserC")) {
                request.setAttribute("useranme",cookie.getValue());
            }
            if(cookie.getName().equals("passC")) {
                request.setAttribute("password",cookie.getValue());
            }
        }    
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAO dao = new DAO();
       
        String u = request.getParameter("username");
        String p = request.getParameter("password");
        ResultSet rs = dao.getNameUser(u);
        int tyle = 0;
       
        try {
            while(rs.next()) {
                tyle = rs.getInt("UserType");
            }
        } catch (SQLException ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
        }
        // Băm mật khẩu bằng MD5
        String passwordFake = hashPasswordMD5(p);
        //String passwordFake= p;
        if (checkLogin(u, passwordFake)) {
            // lưu account lên cookie
            Cookie cu = new Cookie("UserC", u);
            Cookie pu = new Cookie("passC", p);
            pu.setMaxAge(60*4320);
            cu.setMaxAge(60*4320);     
            response.addCookie(cu); // luu pass and account len trinh duyet
            response.addCookie(pu);
           if(tyle == 1) {
               response.sendRedirect("Home.jsp");
           }
           else {
                response.sendRedirect("AminPage.jsp");
           }
            
        } else {
            // Đăng nhập thất bại, hãy hiển thị thông báo lỗi
            request.setAttribute("error", "Invalid username or password!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        // Kiểm tra nếu tìm thấy người dùng phù hợp

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
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
