/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.doctor;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Doctor;
import models.GS;
import models.MyOzSmsClient;
import models.Staff;

/**
 *
 * @author rilah
 */
public class doctorslotchange extends HttpServlet {

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
        Doctor a = new Doctor();
        Staff b = new Staff();
        String Date = null;
        String Time = null;
        int aid = Integer.parseInt(request.getParameter("aid"));
        String value = request.getParameter("change");
        if (value.equals("Change"))
        {
            request.setAttribute("aid", aid);
            request.getRequestDispatcher("adminappointmentslot.jsp").forward(request, response);
        }
        if (value.equals("Cancel"))
        {
            b.reduceearnings(aid);
            ArrayList<String> phonenumber = new ArrayList();
            List<String> phone = b.getphone(aid);
            for (int j = 0; j < phone.size(); j++)
            {
                phonenumber.add(phone.get(j));
            }
            if(a.deleteslot(aid)){
                
            ArrayList<GS> dr = new ArrayList();
            List<GS> doc = b.getdetails(aid);
            for (int i = 0; i < doc.size(); i++)
            {
                dr.add(doc.get(i));
            }    
            
            
            try {
                        String host = "127.0.0.1";
                        int port = 9500;
                        String username = "admin";
                        String password = "130399";
 
                        MyOzSmsClient osc = new MyOzSmsClient(host, port);
                        osc.login(username, password);
 
                         
                        String line = "Your Appointment for Doctor "+dr.get(0).getDrname()+" Speciality "+dr.get(0).getDrspeciality()+" on "+dr.get(0).getDate()+" at "+dr.get(0).getTime()+" has been cancelled your money will be refunded";
 
                        System.out.println("SMS message:");
                        for(int k=0; k < phonenumber.size(); k++)
                        {
                        if(osc.isLoggedIn()) {
                            osc.sendMessage(phonenumber.get(k), line);
                                
                        }
                        
                        }
                        osc.logout();
 
 
                } catch (IOException | InterruptedException e) {
                        System.out.println(e.toString());
                }
                
                
                HttpSession session = request.getSession();
            session.setAttribute("cancel", "success");
            request.getRequestDispatcher("doctorappointments").forward(request, response);
            }
            else
            {
                HttpSession session = request.getSession();
                session.setAttribute("cancel", "fail");
                request.getRequestDispatcher("doctorappointments").forward(request, response);
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
