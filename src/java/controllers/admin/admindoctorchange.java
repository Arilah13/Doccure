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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Admin;
import models.Doctor;
import models.GS;

/**
 *
 * @author rilah
 */
public class admindoctorchange extends HttpServlet {

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
        GS b = new GS();
        Admin a = new Admin();
        Doctor doctor = new Doctor();
        int did = Integer.parseInt(request.getParameter("aid"));
        String drname = request.getParameter("drname");
        String speciality = request.getParameter("drspeciality");
        String uname = request.getParameter("druname");
        String password = request.getParameter("password");
        byte[] Salt = null;
        byte[] pass = null;
        if(request.getParameter("change").equals("Edit"))
        {
            if(!password.equals(""))
            {
            
            try {
                
                Salt = doctor.generateSalt();               
                
                pass = doctor.getEncryptedPassword(password, Salt);
            } catch (NoSuchAlgorithmException | InvalidKeySpecException ex) {
                Logger.getLogger(admindoctorchange.class.getName()).log(Level.SEVERE, null, ex);
            }
            b.setSalt(Salt);
            b.setPassword(pass);
            }
            
            b.setDrname(drname);
            b.setDrspeciality(speciality);
            b.setUname(uname);
            
            b.setDid(did);
            int c = a.updatedoctor(b);
            if(c >0)
            {
                HttpSession session = request.getSession();
            session.setAttribute("update", "success");
                request.getRequestDispatcher("admindoctors").forward(request, response);
            }
            else
            {
                HttpSession session = request.getSession();
            session.setAttribute("update", "fail");
                request.getRequestDispatcher("admindoctors").forward(request, response);
            }
        }
        else if (request.getParameter("change").equals("cancel"))
        {
            int c = a.deactivatedoctor(did);
            if (c > 0)
            {
                HttpSession session = request.getSession();
            session.setAttribute("cancel", "success");
                request.setAttribute("status", 1);
                request.getRequestDispatcher("admindoctors").forward(request, response);
            }
            else
            {
                HttpSession session = request.getSession();
            session.setAttribute("cancel", "success");
                request.setAttribute("status", 0);
                request.getRequestDispatcher("admindoctors").forward(request, response);
            }
        }
        else if (request.getParameter("change").equals("active"))
        {
            int r = a.activatedoctor(did);
            if(r>0)
            {
                 HttpSession session = request.getSession();
            session.setAttribute("activate", "success");
            request.getRequestDispatcher("admindoctors").forward(request, response);
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
