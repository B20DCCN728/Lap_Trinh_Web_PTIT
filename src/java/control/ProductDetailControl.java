//Created by Campus
package control;

import dao.CategoryDAO;
import dao.CommentDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.OrderItem;
import model.Category;
import model.User;
import model.Comment;
import model.Product;

/**
 *
 * @author PC
 */

@WebServlet("/productdetail")

public class ProductDetailControl extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        String url = "/productdetail.jsp";    
        int productID = Integer.parseInt(request.getParameter("productID"));
        ArrayList<Category> listCategory = new CategoryDAO().getAllCategory();
        Product product = new ProductDAO().getProductByID(productID);
        ArrayList<Product> listTop2Propose = new ProductDAO().getPropose2Product(product.getID(), product.getCategory().getId());
        //ArrayList<Comment> listComment = new CommentDAO().getCommentbyProductID(productID);
        
        request.setAttribute("proposeList", listTop2Propose);
        request.setAttribute("product", product);
        request.setAttribute("listCategory", listCategory);
        //request.setAttribute("listComment", listComment);
        request.getRequestDispatcher(url).forward(request, response);
        
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
        //processRequest(request, response);
        System.out.println("Do Post was called");
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        HttpSession mySession = request.getSession();
        
        User myAccount = (User) mySession.getAttribute("myAccount");
        
        if(myAccount != null) {  
            int productID = Integer.parseInt(request.getParameter("productID"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            ArrayList<OrderItem> listCart = null;
            listCart = (ArrayList<OrderItem>) mySession.getAttribute("listCart");
            if(listCart == null) {
                listCart = new ArrayList<>();
            }
            OrderItem newProduct = new OrderItem();
            newProduct.setProduct(new ProductDAO().getProductByID(productID));
            newProduct.setQuantity(quantity);
            listCart.add(newProduct);
            mySession.setAttribute("listCart", listCart);
            response.getWriter().write("success");
        }
        else {
            response.getWriter().write("notLogin");
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
