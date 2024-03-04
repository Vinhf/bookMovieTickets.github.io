/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.pro;

import controller.Showtime;
import data.DAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


/**
 *
 * @author QuocHai
 */
public class AddShowtimes extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddShowtimes</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddShowtimes at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
              // Lấy dữ liệu từ form
        int movieId = Integer.parseInt(request.getParameter("movieId"));
        int theaterId = Integer.parseInt(request.getParameter("theaterId"));
        String startTime = request.getParameter("startTime")+":00"; // Đảm bảo thêm ":00" cho giây nếu cần
        String endTime = request.getParameter("endTime")+":00"; // Tương tự như trên
        int ticketPrice = Integer.parseInt(request.getParameter("ticketPrice"));
        String dateAdded = request.getParameter("dateAdded"); // Định dạng YYYY-MM-DD

        // Tạo đối tượng Showtime từ dữ liệu form
        Showtime showtime = new Showtime(movieId, startTime, endTime, theaterId, ticketPrice, dateAdded);

        // Sử dụng DAO để thêm showtime vào cơ sở dữ liệu
        DAO dao = new DAO();
        boolean success = dao.addShowtime(showtime);

        if (success) {
            // Chuyển hướng đến trang danh sách hoặc trang thông báo thành công
            response.sendRedirect("AminPage.jsp");
        } else {
            // Hiển thị thông báo lỗi hoặc ghi log
            response.getWriter().println("AddShowtime");
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
