/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.DAO;
import dao.DrinkDAO;
import entity.Cart;
import entity.Drink;
import entity.Item;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.List;

/**
 *
 * @author Admin
 */
public class CartProcessControlServlet extends HttpServlet {

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
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        // cong tru san pham
        HttpSession session = request.getSession();
        Cart cart = null;
        Object o = session.getAttribute("cart");
        DrinkDAO fdao = new DrinkDAO();
        //co r
        if (o != null) {
            cart = (Cart) o;
            // chua co
        } else {
            cart = new Cart();
        }
        
        String snum = request.getParameter("num").trim();
        String sid = request.getParameter("id");
        int id, num;
        try {
            id = Integer.parseInt(sid);
            num = Integer.parseInt(snum);
            if(num==-1 && (cart.getQuantityById(id)) <=1){
                cart.removeItem(id);
            } else {
                Drink food = fdao.getFoodByID(id);
                double price = food.getPrice();
                Item i = new Item(food, num, price); // tao 1 item moi
                cart.addItem(i); // add vao cart => quantity + 1
            }
        } catch (Exception e) {
        }
        List<Item> list = cart.getItems();
        session.setAttribute("cart", cart);
        session.setAttribute("size", list.size());
        request.getRequestDispatcher("cart.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        // xoa san pham
        HttpSession session = request.getSession();
        Cart cart = null;
        Object o = session.getAttribute("cart");
        //co r
        if (o != null) {
            cart = (Cart) o;
            // chua co
        } else {
            cart = new Cart();
        }
        // lay id de xoa
        int id = Integer.parseInt(request.getParameter("id"));
        cart.removeItem(id);
        List<Item> list = cart.getItems();
        // set lai du lieu
        session.setAttribute("cart", cart);
        session.setAttribute("size", list.size());
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

}
