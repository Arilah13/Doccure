/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Appointment;
import models.User;

/**
 *
 * @author rilah
 */
public class payment extends HttpServlet {

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
        String email = null;
        int uid = 0, appointmentid;
        Appointment a = new Appointment();
        User u = new User();
        
        if(request.getParameter("uid") != null)
        {
            uid = Integer.parseInt(request.getParameter("uid"));
            email = u.getEmail(uid);
        }
        else
        {
        Cookie ck[] = request.getCookies();
        for(int i = 0; i < ck.length; i++){
            if(ck[i].getName().equals("emailhm")){
                email = ck[i].getValue();
                }
            if(ck[i].getName().equals("uid")){
                    uid = Integer.parseInt(ck[i].getValue());
                }
        }
        }
        
        
        
       
        if(!email.equals("") || email != null)
        {
            int aid = Integer.parseInt(request.getParameter("aid"));
            String date = request.getParameter("dateappointment");
            String day = request.getParameter("dayappointment");
            String time = request.getParameter("timeappointment");
            String drname = request.getParameter("drname");
            int did = Integer.parseInt(request.getParameter("did"));
            int fee11 = Integer.parseInt(a.getdoctorfee(did));
            int feee = fee11 + 1000;
            String fee1 = String.valueOf(fee11);
            String fee = String.valueOf(feee);
            String piccode = request.getParameter("piccode");
            request.setAttribute("date", date);
            request.setAttribute("day", day);
            request.setAttribute("time", time);
            request.setAttribute("appointmentid", aid);
            request.setAttribute("drname", drname);
            request.setAttribute("did", did);
            request.setAttribute("fee1", fee1);
            request.setAttribute("fee", fee);
            request.setAttribute("piccode", piccode);
            request.getRequestDispatcher("payment.jsp").forward(request,response);
        }
        else
        {
            request.getRequestDispatcher("Login.jsp");
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
