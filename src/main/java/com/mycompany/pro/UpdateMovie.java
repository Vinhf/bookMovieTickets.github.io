/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.pro;

import controller.Movie;
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
public class UpdateMovie extends HttpServlet {

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
            out.println("<title>Servlet UpdateMovie</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateMovie at " + request.getContextPath() + "</h1>");
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
        // Lấy dữ liệu từ request
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String releaseDate = request.getParameter("releaseDate");
        String genre = request.getParameter("genre");
        String imageUrl = request.getParameter("imageUrl");
        String imageUrlBig = request.getParameter("imageUrlBig");
        int status = Integer.parseInt(request.getParameter("status"));
        int evaluate = Integer.parseInt(request.getParameter("evaluate"));

        // Tạo một đối tượng movie
        Movie movie = new Movie();
        movie.setMovieId(id);
        movie.setTitle(title);
        movie.setDescription(description);
        movie.setReleaseDate(releaseDate);
        movie.setGenre(genre);
        movie.setImageUrl(imageUrl);
        movie.setStatus(status);
        movie.setEvaluate(evaluate);
        movie.setImageUrlBig(imageUrlBig);

        

        // Gọi DAO để insert movie vào database
        DAO dao = new DAO();
        boolean isInserted = dao.updateMovie(movie);

        if (isInserted) {
            // Redirect hoặc gửi thông báo thành công
            response.sendRedirect("AminPage.jsp"); // Ví dụ: trang thông báo thành công
        } else {
            request.getSession().setAttribute("id", id);
            request.getRequestDispatcher("UpdateMovie.jsp").forward(request, response);
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
