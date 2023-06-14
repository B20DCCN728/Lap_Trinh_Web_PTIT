/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control.admin;

import dao.admin.OrderDAO;
import dao.admin.ProductDAO;
import dao.admin.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.admin.Order;
import model.admin.Product;
import model.admin.User;

/**
 *
 * @author havanthiep
 */
@WebServlet(name="UserDetailServlet", urlPatterns={"/admin/user-detail"})
public class UserDetailServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String idString = request.getParameter("id");
        HttpSession session = request.getSession();
        int id = 0, idss;
        if(session.getAttribute("idss") == null) idss = 0;
        else idss = (int) session.getAttribute("idss");
        if(idString==null) id = idss;
        else id = Integer.parseInt(idString);
        OrderDAO dao = new OrderDAO();
        List<Order> list_Order = dao.getOrders();
        List<Order> list_Order_User = new ArrayList<>();
        for(Order i : list_Order){
            if(i.getUser_id()==id-1000000){
                list_Order_User.add(i);
            }
        }
        request.setAttribute("list_Order", list_Order_User);
        ProductDAO pdao = new ProductDAO();
        List<Product> list_Product = pdao.getProducts();
        request.setAttribute("list_Product", list_Product);
        UserDAO udao = new UserDAO();
        List<User> list_User = udao.getUsers();
        for(User i : list_User){
            if(i.getId()==id-1000000){
                request.setAttribute("email", i.getEmail());
                request.setAttribute("fullname", i.getFullname());
                request.setAttribute("dob", i.getDob());
                request.setAttribute("phone", i.getPhone());
                request.setAttribute("address", i.getAddress());
                request.setAttribute("note", i.getNote());
                break;
            }
        }
        request.setAttribute("id", id);
        session.setAttribute("idss", id);
        request.getRequestDispatcher("user_detail.jsp").forward(request, response);
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
