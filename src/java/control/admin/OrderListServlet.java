/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control.admin;

import dao.admin.OrderDAO;
import dao.admin.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.admin.Order;
import model.admin.User;

/**
 *
 * @author havanthiep
 */
@WebServlet(name="OrderListServlet", urlPatterns={"/admin/order-list"})
public class OrderListServlet extends HttpServlet {
   
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
        String s = request.getParameter("search-input");
        HttpSession session = request.getSession();
        String ss = (String) session.getAttribute("search-order-ss");
        OrderDAO dao = new OrderDAO();
        UserDAO udao = new UserDAO();
        List<Order> list_Order = dao.getOrders();
        List<User> list_User = udao.getUsers();
        if(s==null && ss!=null) s = ss;
        if(s!=null){
            list_User = udao.getUsers(s);
            List<Order> list_SearchOrder = new ArrayList<>();
            for(Order o : list_Order){
                int k = 0;
                for(User u : list_User){
                    if(o.getUser_id()==u.getId()){
                        k = 1;
                        break;
                    }
                }
                if(k==1) list_SearchOrder.add(o);
            }
            request.setAttribute("list_Order", list_SearchOrder);
        }
        else{
            request.setAttribute("list_Order", list_Order);
        }
        request.setAttribute("list_User", list_User);
        request.setAttribute("search-content", s);
        session.setAttribute("search-order-ss", s);
        request.getRequestDispatcher("order_list.jsp").forward(request, response);
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
