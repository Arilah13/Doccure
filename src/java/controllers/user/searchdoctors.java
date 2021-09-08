/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.user;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Appointment;
import models.GS;

/**
 *
 * @author rilah
 */
public class searchdoctors extends HttpServlet {

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
        Appointment ap = new Appointment();
        int uid = 0; 
        String drname = request.getParameter("drname");
        String speciality = request.getParameter("specialization");
        String date = request.getParameter("date");
        if(request.getParameter("uid") != null )
        {
        uid = Integer.parseInt(request.getParameter("uid"));
        }
        
          if((!drname.equals("") || drname != null) && (!speciality.equals("") || speciality != null) && (date.equals("") || date == null)){
            try {
                List<GS> doctorbyspecialityname = ap.getdoctorbyspecialityname(speciality, drname);
                ArrayList<GS> results = new ArrayList();
                for (int i = 0; i < doctorbyspecialityname.size(); i++)
                {
                   results.add(doctorbyspecialityname.get(i));
                }
                if(uid != 0)
                {
                    request.setAttribute("uid", uid);
                }
                request.setAttribute("results", results);
                request.setAttribute("drname", drname);
                request.getRequestDispatcher("showdoctors1.jsp").forward(request,response);
            } catch (ClassNotFoundException | ParseException ex) {
                Logger.getLogger(searchdoctors.class.getName()).log(Level.SEVERE, null, ex);
            }
        request.getRequestDispatcher("showdoctors.jsp").forward(request,response);
        }
    
         else
    {
            try {
                List<GS> doctorbyspecialitynamedate = ap.getdoctorbyspecialitynamedate(speciality, drname, date);
                ArrayList<GS> results = new ArrayList();
                for (int i = 0; i < doctorbyspecialitynamedate.size(); i++)
                {
                    results.add(doctorbyspecialitynamedate.get(i));
                }
                if(uid != 0)
                {
                    request.setAttribute("uid", uid);
                }
                request.setAttribute("results", results);
                request.setAttribute("drname", drname);
                request.getRequestDispatcher("showdoctors1.jsp").forward(request,response);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(searchdoctors.class.getName()).log(Level.SEVERE, null, ex);
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
