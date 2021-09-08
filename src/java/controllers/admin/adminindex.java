/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Admin;
import models.GS;

/**
 *
 * @author rilah
 */
public class adminindex extends HttpServlet {

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
        Admin a = new Admin();
        
        List<GS> list1 = new ArrayList<GS>();
        list1 = a.admindoctors();
        
        request.setAttribute("results1", list1);
        
        List<GS> list2 = new ArrayList<GS>();
        list2 = a.adminmembers();
        
        request.setAttribute("results2", list2);
        
        List<GS> adminappointments = a.adminappointments();
        ArrayList<GS> results3 = new ArrayList();
        for (int i = 0; i < adminappointments.size(); i++)
        {
            results3.add(adminappointments.get(i));
        }
        request.setAttribute("results3", results3);
        
        int Doctors = a.totaldoctors();
        int Patients = a.totalpatients();
        int Appointments = a.totalappointments();
        int staff = a.totalstaff();
        int appointmentearning = a.appointmentearnings();
        int no = a.nolabappointments();
        int labearnings = a.labearnings();
        String Revenue = null;
        
        request.setAttribute("Doctors", Doctors);
        request.setAttribute("Patients", Patients);
        request.setAttribute("Appointments", Appointments);
        request.setAttribute("staff", staff);
        request.setAttribute("appointmentearning", appointmentearning);
        request.setAttribute("labearnings", labearnings);
        request.setAttribute("nolab", no);
        
        
        request.getRequestDispatcher("adminindex.jsp").forward(request, response);
        
        
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
