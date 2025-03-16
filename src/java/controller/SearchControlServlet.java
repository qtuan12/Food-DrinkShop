/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CategoryDAO;
import dao.DAO;
import dao.DrinkDAO;
import entity.Category;
import entity.Drink;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.List;

/**
 *
 * @author Admin
 */
public class SearchControlServlet extends HttpServlet {

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
        String txtSearch = request.getParameter("txt");
        int index = Integer.parseInt(request.getParameter("index"));
        DAO dao = new DAO();
        DrinkDAO fdao = new DrinkDAO();
        CategoryDAO cdao = new CategoryDAO();

        List<Drink> list = fdao.getFoodByName(txtSearch, index);
        List<Category> listC = cdao.getCategory();

        int count = fdao.countByName(txtSearch);

        int sizePerPage = 3;
        int endPage = count / sizePerPage;

        if (count % sizePerPage != 0) {
            endPage++;
        }

        request.setAttribute("textSearch", txtSearch);
        request.setAttribute("endPageSearch", endPage);
        request.setAttribute("listF", list);
        request.setAttribute("listC", listC);

        // Kiểm tra nếu danh sách rỗng
        if (list.isEmpty()) {
            request.setAttribute("searchMessage", "No results found for: " + txtSearch);
        }

        request.getRequestDispatcher("chooseFood.jsp").forward(request, response);
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
        processRequest(request, response);
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
