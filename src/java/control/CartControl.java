//Created by Campus
package control;

import com.sun.security.ntlm.Client;
import dao.OrderDAO;
import dao.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import model.Order;
import model.OrderItem;
import model.Product;
import model.User;


/**
 *
 * @author PC
 */
public class CartControl extends HttpServlet {

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
        HttpSession mySession = request.getSession();
        try {
            ArrayList<OrderItem> listCart = (ArrayList<OrderItem>) mySession.getAttribute("listCart");
            int totalCost = 0;

            for(int i = 0;i < listCart.size();i++) {
                Product product = listCart.get(i).getProduct();
                listCart.get(i).setProduct(new ProductDAO().getProductByID(product.getID()));
                totalCost += listCart.get(i).getTotal();
            }
            mySession.setAttribute("listCart", listCart);
            mySession.setAttribute("totalCost", totalCost); 
        } catch (Exception e) {
            e.printStackTrace();
        }      
        request.getRequestDispatcher("/carts.jsp").forward(request, response);
        
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
//        response.setContentType("text/plain");
//        response.setCharacterEncoding("UTF-8");
//        System.out.println("Open Post cart");
//        HttpSession mySession = request.getSession();
//        ArrayList<OrderItem> listCart = (ArrayList<OrderItem>) mySession.getAttribute("listCart");
//        User myAccount = (User) mySession.getAttribute("myAccount");
//        System.out.println(myAccount);
//        
//        Float cost = (Float) mySession.getAttribute("totalCost");
//        float totalCost = 0;
//        if(cost != null) {
//            totalCost = cost.floatValue();
//            System.out.println(totalCost);
//            int quantity = 0;
//            for(int i = 0;i < listCart.size();i++) {
//                quantity += listCart.get(i).getQuantity();
//            }
//
//            System.out.println(quantity);
//            Order order = new Order();
//            order.setClient(myAccount);
//            order.setListOrderItems(listCart);
//            order.setTotal(totalCost);
//            order.setQuantity(quantity);
//
//            OrderDAO orderDAO = new OrderDAO();
//            if(orderDAO.addOrder(order)) {
//                response.getWriter().write("success");
//                mySession.removeAttribute("listCart");
//                mySession.removeAttribute("totalCost");
//            }  
//            else {
//                response.getWriter().write("error");
//            }
//        } 
//        else {
//            response.getWriter().write("error");
//        }
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
