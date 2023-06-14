//Created by Campus
package control;

import java.sql.Date;
import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;


/**
 *
 * @author PC
 */
public class ClientInfoControl extends HttpServlet {
    //1998-02-14
    private SimpleDateFormat myDate = new SimpleDateFormat("yyyy-MM-dd");
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
        User myAccount = (User) mySession.getAttribute("myAccount");
        myAccount = new UserDAO().getUserByID(myAccount.getId());
        
        request.setAttribute("myAccount", myAccount);
        request.getRequestDispatcher("/clientinfo.jsp").forward(request, response);
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
            throws ServletException, IOException{
        
        HttpSession mySession = request.getSession();
        User myAccount = (User) mySession.getAttribute("myAccount");
        
        String action = request.getParameter("action");
        if(action.equals("update")) {
            String fullname = request.getParameter("fullname").trim();
            String dateOfBirth = request.getParameter("dateofbirth").trim();
            String phone = request.getParameter("phone").trim();
            String email = request.getParameter("email").trim();
            String address = request.getParameter("address").trim();
            String note = request.getParameter("note").trim();
            
            myAccount.setFullName(fullname);
            try {
                System.out.println(dateOfBirth);
                myAccount.setDob(myDate.parse(dateOfBirth));
            } catch (ParseException ex) {
                Logger.getLogger(ClientInfoControl.class.getName()).log(Level.SEVERE, null, ex);
            }
            myAccount.setPhone(phone);
            myAccount.setEmail(email);
            myAccount.setAddress(address);
            myAccount.setNode(note);
            UserDAO userDAO = new UserDAO();
            if(userDAO.upDateClientInfo(myAccount)) {
                response.sendRedirect("profile");
            }
            else {
                System.out.println("Error change infomation");
            }
        } else {
            String password = request.getParameter("newpassword").trim();
            System.out.println(password);
            myAccount.setPassword(password);
            UserDAO userDAO = new UserDAO();
            boolean checkDone = false;
            try {
                checkDone = userDAO.changePassword(myAccount);
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(ClientInfoControl.class.getName()).log(Level.SEVERE, null, ex);
            }
            if(checkDone) {
                response.sendRedirect("profile");
            }
            else {
                System.out.println("Error change password");
            }
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
