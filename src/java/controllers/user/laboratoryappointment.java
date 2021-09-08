/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.user;

import java.io.IOException;
import java.text.ParseException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Appointment;
import models.GS;
import models.Lab;
import models.User;

/**
 *
 * @author rilah
 */
public class laboratoryappointment extends HttpServlet {

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
        try {
            processRequest(request, response);
            User user = new User();
            Cookie ck[] = request.getCookies();
            String test = request.getParameter("testname");
            String date = request.getParameter("date");
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate Date = java.time.LocalDate.now();
            LocalDate Date2 = java.time.LocalDate.parse(date, formatter);
            int diff = (Date.compareTo(Date2));
            if(diff >= 0)
            {
                HttpSession session = request.getSession();
                session.setAttribute("success", "fail");
                request.getRequestDispatcher("laboratoryappointment.jsp").include(request, response);
            }
            else
            {
            String fee = user.getfee(test);
            String drname = "";
            String speciality = "";
            if(!request.getParameter("drname").equals(""))
            {
            String String = null;
            String = request.getParameter("drname");
            String[] splitString = String.split(" ");
            drname = splitString[0];
            speciality = splitString[1];
            }
            String cookie = "";
            if(request.getParameter("labid") != null)
            {
               Lab l = new Lab();
               l.deleteappointment(Integer.parseInt(request.getParameter("labid")));
               cookie = request.getParameter("uid");
            }
            else
            {
            for(int i = 0; i < ck.length; i++){
                if(ck[i].getName().equals("uid")){
                    cookie = ck[i].getValue();
                }
            }
            }
            Lab appointment = new Lab();
            GS a = new GS();
            a.setTestname(test);
            a.setTestdate(date);
            a.setUid(Integer.parseInt(cookie));
            a.setEarnings(fee);
            request.setAttribute("date", date);
            request.setAttribute("testname", test);
            request.setAttribute("fee", fee);
            if(!drname.equals(""))
            {
                request.setAttribute("drname", drname);
                request.setAttribute("speciality", speciality);
                a.setDrname(drname);
                a.setDrspeciality(speciality);
            }

            int status = appointment.labappointmentinsert(a);
            request.setAttribute("time", a.getTesttime());
            if(status ==1){
            request.getRequestDispatcher("labpayment.jsp").forward(request, response);
            }}
        } catch (ParseException ex) {
            Logger.getLogger(laboratoryappointment.class.getName()).log(Level.SEVERE, null, ex);
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
