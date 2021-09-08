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
public class bookconfirm extends HttpServlet {

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

        String date = null;
        String day = null;
        String ano = null;
        String time = null;
        String drname = null;
        String phone = null;
        String fee = null;
        if(!email.equals("") || email != null)
        {
            try {
                int aid = Integer.parseInt(request.getParameter("aid"));
                ano = Integer.toString(a.getapointNO(uid, aid));               
                date = request.getParameter("dateappointment");
                day = request.getParameter("dayappointment");
                time = request.getParameter("timeappointment");    
                drname = request.getParameter("drname");
                int did = Integer.parseInt(request.getParameter("did"));
                fee = request.getParameter("fee");
                String fee1 = request.getParameter("fee1");
                request.setAttribute("date", date);
                request.setAttribute("day", day);
                request.setAttribute("time", time);
                request.setAttribute("appointmentid", ano);
                request.setAttribute("drname", drname);
                request.setAttribute("fee", fee);
                boolean b = a.increaseearning(did, fee1, fee);
                boolean c = a.increasetotalearnings(date, fee);
                Message message = new MimeMessage(session);
                message.setFrom(new InternetAddress("rilah1303@gmail.com"));
                message.setRecipients(Message.RecipientType.TO,
                        InternetAddress.parse(email));
                message.setSubject("Appointment");
                message.setText("Your Appointment for Dr. "+drname+" is confirmed to be on "+date+" "+day+" at "+ time +". Appointment Number is "+ano+". The Fee is "+fee);

                Transport.send(message);
                                
                User n = new User();
                phone = n.getuserphone(uid);
                
            } catch (SQLException | ClassNotFoundException | MessagingException ex) {
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
 
                         
                        String line = "Your Appointment for Dr. "+drname+" is confirmed to be on "+date+" "+day+" at "+ time +". Appointment Number is "+ano+". The Fee is "+fee;
 
                        System.out.println("SMS message:");                       
                        if(osc.isLoggedIn()) {
                                osc.sendMessage(phone, line);
                                
                        }                                              
                        osc.logout();
 
 
                } catch (IOException | InterruptedException e) {
                        System.out.println(e.toString());
                }
            }
            request.getRequestDispatcher("showconfirm.jsp").forward(request,response);
        }
        else
        {
            request.getRequestDispatcher("showconfirm.jsp");
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
