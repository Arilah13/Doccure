/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.staff;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.MyOzSmsClient;
import models.Staff;

/**
 *
 * @author rilah
 */
public class sendtext extends HttpServlet {

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
        Staff s = new Staff();
        int aid = Integer.parseInt(request.getParameter("sms"));
        String smsdrname = request.getParameter("smsdrname");
        String smsspeciality = request.getParameter("smsspeciality");
        String smsday = request.getParameter("smsday");
        String smstime = request.getParameter("smstime");
        String smsdate = request.getParameter("smsdate");
        ArrayList<String> phonenumber = new ArrayList();
        List<String> phone = s.getphone(aid);
        for (int i = 0; i < phone.size(); i++)
        {
            phonenumber.add(phone.get(i));
        }
        try {
                        String host = "127.0.0.1";
                        int port = 9500;
                        String username = "admin";
                        String password = "130399";
 
                        MyOzSmsClient osc = new MyOzSmsClient(host, port);
                        osc.login(username, password);
 
                         
                        String line = ""+smsdrname+" Speciality "+smsspeciality+" Appointment on "+smsdate+" "+smsday+" at "+smstime+" has arrived at hospital";
 
                        System.out.println("SMS message:");
                        for(int j=0; j < phonenumber.size(); j++)
                        {
                        if(osc.isLoggedIn()) {
                                osc.sendMessage(phonenumber.get(j), line);
                                
                        }
                        
                        }
                        osc.logout();
 
 
                } catch (IOException | InterruptedException e) {
                        System.out.println(e.toString());
                }
        request.getRequestDispatcher("manageslots").forward(request,response);
        
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
