//Created by Campus
package control;

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
public class CheckoutControl extends HttpServlet {

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
        
        User client = null;
        ArrayList<OrderItem> listCart = null;
        
        HttpSession mySession = request.getSession();
        client = (User) mySession.getAttribute("myAccount");
        listCart = (ArrayList<OrderItem>) mySession.getAttribute("listCart");
        
        int cost = this.getCost(listCart);
        int fee = 30000;
        int total = cost + fee;
        
        if(client != null&&listCart != null) {
            Order order = new Order(
                    client, 
                    cost, 
                    fee, 
                    total, 
                    listCart
            );
            
            request.setAttribute("order", order);
            mySession.setAttribute("order", order);
            request.getRequestDispatcher("/checkout.jsp").forward(request, response);
        }  else {
            response.sendRedirect("home");
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
        response.setContentType("text/html;charset=UTF-8");
        HttpSession mySession = request.getSession();
        
        Order order = (Order) mySession.getAttribute("order");
        OrderDAO orderDAO = new OrderDAO();
        if(orderDAO.addOrder(order)) {
            mySession.removeAttribute("order");
            mySession.removeAttribute("listCart");
            mySession.removeAttribute("totalCost");
            response.sendRedirect("checkoutcompleted.jsp");
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
    
    private int getCost(ArrayList<OrderItem> listCart) {
        int cost = 0;
        int n = listCart.size();
        for(int i = 0;i < n;i++) {
            int productID = listCart.get(i).getProduct().getID();
            Product product = new ProductDAO().getProductByID(productID);
            listCart.get(i).setProduct(product);
            listCart.get(i).setPrice(product.getPrice());
            cost += listCart.get(i).getTotal();
        }
        return cost;
    }
    
}
