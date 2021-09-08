/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.user;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Appointment;
import models.MyOzSmsClient;
import models.User;

/**
 *
 * @author rilah
 */
public class labpayment extends HttpServlet {

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
        String date = request.getParameter("dateappointment");
        String time = request.getParameter("timeappointment");
        String name = request.getParameter("testname");
        String fee = request.getParameter("fee");
        
        request.setAttribute("date", date);
        request.setAttribute("time", time);
        request.setAttribute("name", name);
        request.setAttribute("fee", fee);
        
        
        
        
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
        
        
        final String username = "j2eecw@gmail.com";
        final String password = "J2EE123123";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
          new javax.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                }
          });

        
        
        
        String phone = null;
        if(!email.equals("") || email != null)
        {
            try {
                                                                                                      
                
                
                Message message = new MimeMessage(session);
                message.setFrom(new InternetAddress("rilah1303@gmail.com"));
                message.setRecipients(Message.RecipientType.TO,
                        InternetAddress.parse(email));
                message.setSubject("Appointment");
                message.setText("Your Appointed for "+name+" is confirmed to be on "+date+" at "+time+". The price is Rs. "+fee);

                Transport.send(message);
                                
                User n = new User();
                phone = n.getuserphone(uid);
                
            } catch (MessagingException ex) {
                Logger.getLogger(bookconfirm.class.getName()).log(Level.SEVERE, null, ex);
            }
            if(phone != null)
            {
            try {
                        String host = "127.0.0.1";
                        int port = 9500;
                        String username1 = "admin";
                        String password1 = "130399";
 
                        MyOzSmsClient osc = new MyOzSmsClient(host, port);
                        osc.login(username1, password1);
 
                         
                        String line = "Your Appointed for "+name+" is confirmed to be on "+date+" at "+time+". The price is Rs. "+fee ;
 
                        System.out.println("SMS message:");                       
                        if(osc.isLoggedIn()) {
                                osc.sendMessage(phone, line);
                                
                        }                                              
                        osc.logout();
 
 
                } catch (IOException | InterruptedException e) {
                        System.out.println(e.toString());
                }
            }
            request.getRequestDispatcher("labconfirm.jsp").forward(request, response);
        }
        else
        {
            request.getRequestDispatcher("labconfirm.jsp").forward(request, response);
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
