/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.doctor;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Doctor;
import models.GS;

/**
 *
 * @author rilah
 */
public class doctorindex extends HttpServlet {

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
        Doctor ap = new Doctor();
         
         Cookie ck[] = request.getCookies();
         String cookie = "";
         for(int i = 0; i < ck.length; i++){                   
         if(ck[i].getName().equals("didhm")){
            cookie = ck[i].getValue();
         }
         }
         int id = Integer.parseInt(cookie);
       
         List<GS> appointments = ap.todayappointment(id);
         ArrayList<GS> results = new ArrayList();
         for (int i = 0; i < appointments.size(); i++)
         {
             results.add(appointments.get(i));
         }
         request.setAttribute("results", results);
         
         List<GS> uappointments = ap.uappointment(id);
         ArrayList<GS> results1 = new ArrayList();
         for (int i = 0; i < uappointments.size(); i++)
         {
             results1.add(uappointments.get(i));
         }
         request.setAttribute("results1", results1);
         
         int count = 0;
         count = ap.notodayappointments(id);
         request.setAttribute("patients", count);
         
         int sum = 0;
         sum = ap.notodaypatients(id);
         request.setAttribute("sum", sum);
         
         Date date = ap.todaydate();
         request.setAttribute("date", date);
         
         int a = 0;
         a = ap.nopatients(id);
         request.setAttribute("nopatients", a);
                 
         request.getRequestDispatcher("doctorindex.jsp").forward(request,response);
        
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
