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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Appointment;
import models.GS;

/**
 *
 * @author rilah
 */
public class searchdoctors1 extends HttpServlet {
    int attr = 0;
    int uid = 0;
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
        if(request.getAttribute("paID") != null )
        {
            attr = (Integer) request.getAttribute("paID");
            uid = (Integer) request.getAttribute("uid");
            request.getRequestDispatcher("searchdoctors.jsp").forward(request, response);
        }
        else
        {
        Appointment ap = new Appointment();
        String drname = request.getParameter("drname");
        String speciality = request.getParameter("specialization");
        String date = request.getParameter("date");
        
            
        if((!drname.equals("") || drname != null) && (speciality.equals("") || speciality == null) && (date.equals("") || date == null))
        {
            String date1 = "";
            List<GS> doctorbyname = ap.showdoctorname(drname);
            ArrayList<GS> results = new ArrayList();
            for (int i = 0; i < doctorbyname.size(); i++)
            {
                results.add(doctorbyname.get(i));
            }
            if(attr != 0)
            {
            ap.deleteappointment(attr);
            }
            if(uid != 0)
            {
            request.setAttribute("uid", uid);
            }
            request.setAttribute("results", results);
            request.setAttribute("date", date1);
            request.getRequestDispatcher("showdoctors.jsp").forward(request,response);
        }
        else if((!speciality.equals("") || speciality != null) && (drname.equals("") || drname == null) && (date.equals("") || date == null))
        {
            String date1 = "";
            List<GS> doctorbyspeciality = ap.showdoctorspeciality(speciality);
            ArrayList<GS> results = new ArrayList();
            for (int i = 0; i < doctorbyspeciality.size(); i++)
            {
                results.add(doctorbyspeciality.get(i));
            }
            if(attr != 0)
            {
            ap.deleteappointment(attr);
            }
            if(uid != 0)
            {
            request.setAttribute("uid", uid);
            }
            request.setAttribute("results", results);
            request.setAttribute("date", date1);
//                request.getRequestDispatcher("showdoctors1.jsp").forward(request,response);
            request.getRequestDispatcher("showdoctors.jsp").forward(request,response);
                
        }
        else if((drname.equals("") || drname == null) && (speciality.equals("") || speciality == null) && (!date.equals("") || date != null)){
            List<GS> doctorbyname = ap.showdoctordate(date);
            ArrayList<GS> results = new ArrayList();
            for (int i = 0; i < doctorbyname.size(); i++)
            {
                results.add(doctorbyname.get(i));
            }
            if(attr != 0)
            {
            ap.deleteappointment(attr);
            }
            if(uid != 0)
            {
            request.setAttribute("uid", uid);
            }
            request.setAttribute("results", results);
            request.setAttribute("date", date);
            request.getRequestDispatcher("showdoctors.jsp").forward(request,response);
        }
        else if((!drname.equals("") || drname != null) && (speciality.equals("") || speciality == null) && (!date.equals("") || date != null)){
            List<GS> doctorbyname = ap.showdoctordatename(date, drname);
            ArrayList<GS> results = new ArrayList();
            for (int i = 0; i < doctorbyname.size(); i++)
            {
                results.add(doctorbyname.get(i));
            }
            if(attr != 0)
            {
            ap.deleteappointment(attr);
            }
            if(uid != 0)
            {
            request.setAttribute("uid", uid);
            }
            request.setAttribute("results", results);
            request.setAttribute("date", date);
            request.getRequestDispatcher("showdoctors.jsp").forward(request,response);
        }
        else if((!drname.equals("") || drname != null) && (!speciality.equals("") || speciality != null) && (date.equals("") || date == null)){
            String date1 = "";
            List<GS> doctorbyname = ap.showdoctornamespeciality(drname, speciality);
            ArrayList<GS> results = new ArrayList();
            for (int i = 0; i < doctorbyname.size(); i++)
            {
                results.add(doctorbyname.get(i));
            }
            if(attr != 0)
            {
            ap.deleteappointment(attr);
            }
            if(uid != 0)
            {
            request.setAttribute("uid", uid);
            }
            request.setAttribute("results", results);
            request.setAttribute("date", date1);
            request.getRequestDispatcher("showdoctors.jsp").forward(request,response);
        }
        else if((drname.equals("") || drname == null) && (!speciality.equals("") || speciality != null) && (!date.equals("") || date != null)){
            List<GS> doctorbyname = ap.showdoctordatespeciality(date, speciality);
            ArrayList<GS> results = new ArrayList();
            for (int i = 0; i < doctorbyname.size(); i++)
            {
                results.add(doctorbyname.get(i));
            }
            if(attr != 0)
            {
            ap.deleteappointment(attr);
            }
            if(uid != 0)
            {
            request.setAttribute("uid", uid);
            }
            request.setAttribute("results", results);
            request.setAttribute("date", date);
            request.getRequestDispatcher("showdoctors.jsp").forward(request,response);
        }
        else{
            List<GS> doctorall = ap.showall(drname, speciality, date);
            ArrayList<GS> results = new ArrayList();
            for (int i = 0; i < doctorall.size(); i++)
            {
                results.add(doctorall.get(i));
            }
            if(attr != 0)
            {
            ap.deleteappointment(attr);
            }
            if(uid != 0)
            {
            request.setAttribute("uid", uid);
            }
            request.setAttribute("results", results);
            request.setAttribute("date", date);
//                request.getRequestDispatcher("showdoctors1.jsp").forward(request,response);
            request.getRequestDispatcher("showdoctors.jsp").forward(request,response);
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
