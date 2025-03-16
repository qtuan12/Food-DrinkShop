/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CategoryDAO;
import dao.DAO;
import dao.DrinkDAO;
import entity.Cart;
import entity.Category;
import entity.Drink;
import entity.Item;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.List;

/**
 *
 * @author Admin
 */
public class AddToCartServlet extends HttpServlet {

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
        HttpSession session = request.getSession(true);
        Cart cart = null;
        Object o = session.getAttribute("cart");
        DrinkDAO fdao = new DrinkDAO();
        CategoryDAO cdao = new CategoryDAO();
        
        // co r
        if (o != null) {
            cart = (Cart) o;
        } else {
            cart = new Cart();
        }
        String tid = request.getParameter("fid");
        int id;

        try {
            id = Integer.parseInt(tid);
            Drink food = fdao.getFoodByID(id);
            double price = food.getPrice();
            
            Item i = new Item(food, 1, price); 
//            int number;
//
//            if (cart.getItemById2(id) >= 5) {
//                number = 4;
//            } else {
//                number = 1;
//            } chế độ aad nếu trong giỏ hàng quá 4 mỗi lần tang lên thành 4

            //Item i = new Item(food, number, price);
            cart.addItem(i);
        } catch (Exception e) {
        }
        List<Drink> listF = fdao.getAllFood();
        List<Category> listC = cdao.getCategory();

        List<Item> list = cart.getItems();
        request.setAttribute("listF", listF);
        request.setAttribute("listC", listC);
        session.setAttribute("cart", cart);
        session.setAttribute("size", list.size());
        request.getRequestDispatcher("chooseFood.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
