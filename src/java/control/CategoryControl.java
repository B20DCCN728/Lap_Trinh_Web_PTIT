//Created by Campus
package control;

import dao.CategoryDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Category;
import model.Product;

/**
 *
 * @author PC
 */
public class CategoryControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        ArrayList<Product> listProduct = null;
        ArrayList<Category> listCategory = new CategoryDAO().getAllCategory();
        
        int categoryID = Integer.parseInt(request.getParameter("categoryID"));
        String page = request.getParameter("page"); //null or current page
        int totalPage = new ProductDAO().getQuantityOfPages(categoryID);
        String sortBy = request.getParameter("sortBy"); //price or name
        
        int index = 1;
        if(page != null) {
            try {
                index = Integer.parseInt(page);
            } catch (Exception e) {
                e.printStackTrace();
            }       
        }
        
        if(sortBy != null&&(sortBy.equals("price"))) {
            String orderBy = request.getParameter("orderBy");     
            request.setAttribute("sortBy", sortBy);
            request.setAttribute("orderBy", orderBy);
            if(orderBy.equals("ASC")) {
                listProduct = new ProductDAO().getProductsByCateIDSortByPriceOrderByASCIndexOf(index, categoryID);
            }
            else if(orderBy.equals("DESC")) {
                listProduct = new ProductDAO().getProductsByCateIDSortByPriceOrderByDESCIndexOf(index, categoryID);
            }
            else {
                listProduct = new ProductDAO().getProductsByCateIDIndexOf(index, categoryID);
            }
        }
        else {
            listProduct = new ProductDAO().getProductsByCateIDIndexOf(index, categoryID);
        }
        
        request.setAttribute("sevlet", "CategoryControl");
        request.setAttribute("index", index);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("listCategory", listCategory);
        request.setAttribute("categoryID", categoryID);
        
        request.getRequestDispatcher("/index.jsp").forward(request, response);
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
