/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.staff;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.GS;
import models.Staff;

/**
 *
 * @author rilah
 */
public class appointmentslot extends HttpServlet {

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
     
            String String = request.getParameter("drname");
            String[] splitString = String.split(" ");
            String drname = splitString[0];
            String speciality = splitString[1];
            String[] datelist = request.getParameterValues("date");
            String[] timelist = request.getParameterValues("time");
            String[] slotlist1 = request.getParameterValues("slot");
            int[] slotlist = new int[slotlist1.length];
            for(int i =0; i < slotlist1.length; i++)
            {
                slotlist[i] = Integer.parseInt(slotlist1[i]);
            }
            String day1;
            
            int l = datelist.length;
            String[] day = new String[2];
            
            GS a = new GS();
            Staff staff = new Staff();
   
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            for(int j = 0; j <datelist.length; j++)
            {
                String date1 = datelist[j];
                Date date = sdf.parse(date1);
                switch (date.getDay()) {
                case 1:
                    day1 = "Monday";
                    break;
                case 2:
                    day1 = "Tuesday";
                    break;
                case 3:
                    day1 = "Wednesday";
                    break;
                case 4:
                    day1 = "Thursday";
                    break;
                case 5:
                    day1 = "Friday";
                    break;
                case 6:
                    day1 = "Saturday";
                    break;
                default:
                    day1 = "Sunday";
                    break;
            }
                day[j] = day1;
            }
                      
            
            a.setDatelist(datelist);
            a.setName(drname);
            a.setSlotlist(slotlist);
            a.setSpeciality(speciality);
            a.setTimelist(timelist);
            a.setDaylist(day);
            a.setNumber(l);
            
            int status = staff.addslot(a);
            
            if(status == 1 ){
                HttpSession session = request.getSession();
                session.setAttribute("add", "success");                
                RequestDispatcher req = request.getRequestDispatcher("manageslots");
                req.forward(request, response);
            }else{
                HttpSession session = request.getSession();
                session.setAttribute("add", "fail");
                RequestDispatcher req = request.getRequestDispatcher("manageslots");
                req.forward(request, response);
            }
            
        } catch (ClassNotFoundException | ParseException ex) {
            Logger.getLogger(appointmentslot.class.getName()).log(Level.SEVERE, null, ex);
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
