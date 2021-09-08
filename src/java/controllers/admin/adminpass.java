/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.DBCon;
import models.Staff;

/**
 *
 * @author rilah
 */
public class adminpass extends HttpServlet {

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
        Staff staff = new Staff();
        DBCon con = new DBCon();
        int x = 0;
        String password = request.getParameter("password");
        byte[] Salt = null;
        try {
            Salt = staff.generateSalt();
        } catch (NoSuchAlgorithmException ex) { 
            Logger.getLogger(adminpass.class.getName()).log(Level.SEVERE, null, ex);
        }
        byte[] pass = null;
        try {
            pass = staff.getEncryptedPassword(password, Salt);
        } catch (NoSuchAlgorithmException | InvalidKeySpecException ex) {
            Logger.getLogger(adminpass.class.getName()).log(Level.SEVERE, null, ex);
        } 
        try
        {
            PreparedStatement ps = con.createConnection().prepareStatement("update users set password = ?, Salt = ? where userid = ?");
            ps.setBytes(1, pass);
            ps.setBytes(2, Salt);
            ps.setInt(3, -999);
            x = ps.executeUpdate();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(adminpass.class.getName()).log(Level.SEVERE, null, ex);
        }
        if(x>0)
        {
             HttpSession session = request.getSession();
            session.setAttribute("activate", "success");
            request.getRequestDispatcher("adminprofile.jsp").forward(request, response);
        }
        else
        {
             HttpSession session = request.getSession();
            session.setAttribute("activate", "fail");
            request.getRequestDispatcher("adminprofile.jsp").forward(request, response);
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
