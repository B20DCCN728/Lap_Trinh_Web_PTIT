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
public class SearchProductControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        ArrayList<Product> listProduct = null;
        ArrayList<Category> listCategory = new CategoryDAO().getAllCategory();
        
        String searchContent = request.getParameter("searchContent").trim();
        String page = request.getParameter("page"); //null or current page
        int totalPage = new ProductDAO().getQuantityOfPages(searchContent);
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
                listProduct = new ProductDAO().searchProductsByPriceOrderByASCIndexOf(index, searchContent);
            }
            else if(orderBy.equals("DESC")) {
                listProduct = new ProductDAO().searchProductsByPriceOrderByDESCIndexOf(index, searchContent);
            }
            else {
                listProduct = new ProductDAO().searchProductsIndexOf(index, searchContent);
            }
        }
        else {
            listProduct = new ProductDAO().searchProductsIndexOf(index, searchContent);
        }
        
        request.setAttribute("sevlet", "SearchProductControl");
        request.setAttribute("searchContent", searchContent);
        request.setAttribute("index", index);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("listCategory", listCategory);
        
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
