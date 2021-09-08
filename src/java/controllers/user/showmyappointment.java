/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Appointment;
import models.GS;
import models.Lab;

/**
 *
 * @author rilah
 */
public class showmyappointment extends HttpServlet {

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
        Appointment ap = new Appointment();
        Lab l = new Lab();
        Cookie ck[] = request.getCookies();
        String cookie = "";
         for(int i = 0; i < ck.length; i++){
                    if(ck[i].getName().equals("uid")){
                    cookie = ck[i].getValue();
                    }
         }
         
         List<GS> appointments = ap.showallmyappointment(Integer.parseInt(cookie));
         ArrayList<GS> results = new ArrayList();
         for (int i = 0; i < appointments.size(); i++)
         {
             results.add(appointments.get(i));
         }
         request.setAttribute("results", results);
         
         
//         List<GS> labappointments = l.getlabappointments(Integer.parseInt(cookie));
//         ArrayList<GS> results1 = new ArrayList();
//         for(int j = 0; j < labappointments.size(); j++)
//         {
//            results1.add(labappointments.get(j));
//         }
//         request.setAttribute("results1", results1);

         request.getRequestDispatcher("showmyappointment.jsp").forward(request,response);
        
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
