/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control.admin;

import dao.admin.CategoryDAO;
import dao.admin.OrderDAO;
import dao.admin.OrderItemDAO;
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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import model.admin.Category;
import model.admin.User;
import model.admin.Order;
import model.admin.OrderItem;
import model.admin.Product;

/**
 *
 * @author havanthiep
 */
@WebServlet(name="StatisticServlet", urlPatterns={"/admin/statistic"})
public class StatisticServlet extends HttpServlet {
   
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
        Date currentDate = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String today = dateFormat.format(currentDate);
        String start_date = request.getParameter("start-date");
        String finish_date = request.getParameter("finish-date");
        HttpSession session = request.getSession();
        String start_datess = (String) session.getAttribute("start_date");
        String finish_datess = (String) session.getAttribute("finish_date");
        String time = "";
        OrderDAO dao = new OrderDAO();
        OrderItemDAO oidao = new OrderItemDAO();
        UserDAO udao = new UserDAO();
        if(start_date == null || finish_date == null){
            if(start_datess == null || finish_datess == null){
                start_date = today;
                finish_date = today;
                time = "hôm nay " + today;
            }
            else {
                start_date = start_datess;
                finish_date = finish_datess;
                if(!start_date.equals(finish_date)) time = "từ ngày " + start_date + " đến ngày " + finish_date;
                else if(!start_date.equals(today)) time = "ngày " + start_date;
                else time = "hôm nay " + today;
            }
        }
        else if(!start_date.equals(finish_date)) time = "từ ngày " + start_date + " đến ngày " + finish_date;
        else if(!start_date.equals(today)) time = "ngày " + start_date;
        else time = "hôm nay " + today;
        List<Order> list_Order = dao.getOrders(start_date, finish_date);
        List<OrderItem> list_OrderItem = new ArrayList<>();
        for(Order i : list_Order){
            list_OrderItem.addAll(oidao.getOrderItems(i.getId()));
        }
        ProductDAO pdao = new ProductDAO();
        CategoryDAO cdao = new CategoryDAO();
        List<Product> list_Product = pdao.getProducts();
        List<Category> list_Category = cdao.getCategorys();
        List<User> list_User = udao.getUsers();
        HashMap<Integer, Integer> mapProduct = new LinkedHashMap<>();
        for(OrderItem o : list_OrderItem) {
            if (mapProduct.containsKey(o.getProduct_id())) {
                mapProduct.put(o.getProduct_id(), mapProduct.get(o.getProduct_id()) + o.getQuantity());
            } else {
                mapProduct.put(o.getProduct_id(), o.getQuantity());
            }
        }
        HashMap<Integer, Integer> mapUser = new LinkedHashMap<>();
        for(Order o : list_Order) {
            if (mapUser.containsKey(o.getUser_id())) {
                mapUser.put(o.getUser_id(), mapUser.get(o.getUser_id()) + 1);
            } else {
                mapUser.put(o.getUser_id(), 1);
            }
        }
        request.setAttribute("time", time);
        request.setAttribute("mapProduct", mapProduct);
        request.setAttribute("list_Order", list_Order);
        request.setAttribute("list_Product", list_Product);
        request.setAttribute("list_Category", list_Category);
        request.setAttribute("list_User", list_User);
        request.setAttribute("mapUser", mapUser);
        session.setAttribute("start_date", start_date);
        session.setAttribute("finish_date", finish_date);
        request.getRequestDispatcher("statistic.jsp").forward(request, response);
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
