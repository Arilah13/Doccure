/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Admin;
import models.Doctor;
import models.Staff;
import models.User;
import models.pharmacist;

/**
 *
 * @author rilah
 */
public class login extends HttpServlet {

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
        User user = new User();
        
        String email = request.getParameter("userid");
        String password = request.getParameter("password");
        
        //RequestDispatcher rd = request.getRequestDispatcher("/Welcome");
        //rd.forward(request, response);
        
       
            if(email.contains("@staff"))
            {
                try{
                Staff staff = new Staff();       
                if(staff.verifyStaff(email, password)){
                int id = staff.getStaffId(email);
                String name = staff.getstaffname(id);
                Cookie ck = new Cookie("sidhm", Integer.toString(id));
                ck.setMaxAge(30000);
                response.addCookie(ck);
                Cookie ck1 = new Cookie("spasshm", password);               
                ck.setHttpOnly(true);
                ck1.setMaxAge(30000);
                ck1.setHttpOnly(true);
                response.addCookie(ck1);
                Cookie ck2 = new Cookie("name", name);
                ck.setMaxAge(30000);
                response.addCookie(ck2);
                HttpSession session = request.getSession();
                session.setAttribute("sid", ck);
               
                if(staff.activeStaff(email, password))
                {
                response.sendRedirect("todayappointment");
                }
                else
                {
                    HttpSession session1 = request.getSession();
                    session1.setAttribute("deactivate", "fail");
                    request.getRequestDispatcher("index.jsp").include(request, response);
                }
                }else{
                HttpSession session = request.getSession();
                session.setAttribute("fail", "fail");
                request.getRequestDispatcher("index.jsp").include(request, response);
                }
                }
                catch (NoSuchAlgorithmException | InvalidKeySpecException ex) {
                Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
            }
            }
            else if(email.contains("@doctor"))
            {
                try{
                Doctor doctor = new Doctor();                           
                //RequestDispatcher rd = request.getRequestDispatcher("/Welcome");
                //rd.forward(request, response);     
               
                if(doctor.verifyDoctor(email, password)){  
                int id = doctor.getDoctorId(email);
                String name = doctor.getdoctorname(id);
                String code = doctor.getpic(id);
                String pcode = user.getpic(id);
                String speciality = doctor.getspeciality(id);
                Cookie ck = new Cookie("didhm", Integer.toString(id));
                ck.setMaxAge(30000);
                response.addCookie(ck);
                Cookie ck1 = new Cookie("dpasshm", password);               
                ck.setHttpOnly(true);
                ck1.setMaxAge(30000);
                ck1.setHttpOnly(true);
                response.addCookie(ck1);
                Cookie ck2 = new Cookie("name", name);
                ck2.setMaxAge(30000);
                response.addCookie(ck2);
                Cookie ck3 = new Cookie("pic", code);
                ck3.setMaxAge(30000);
                response.addCookie(ck3);
                Cookie ck4 = new Cookie("speciality", speciality);
                ck4.setMaxAge(30000);
                response.addCookie(ck4);
                
                HttpSession session = request.getSession();
                session.setAttribute("didhm", ck);
//                session.setAttribute("did", id);
//                request.getRequestDispatcher("doctorindex").include(request, response);

                if(doctor.activeDoctor(email, password))
                {
                response.sendRedirect("doctorindex");
                }
                else
                {
                    HttpSession session1 = request.getSession();
                    session1.setAttribute("deactivate", "fail");
                    request.getRequestDispatcher("index.jsp").include(request, response);
                }
                }else{
                HttpSession session = request.getSession();
                session.setAttribute("fail", "fail");
                request.getRequestDispatcher("index.jsp").include(request, response);
                }
                }
                catch (NoSuchAlgorithmException | InvalidKeySpecException ex) {
                Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            else if(email.contentEquals("admin"))
            {
                try{
                Admin admin = new Admin();                           
                //RequestDispatcher rd = request.getRequestDispatcher("/Welcome");
                //rd.forward(request, response);     
               
                if(admin.verifyAdmin(email, password)){  
                String id = "admin"; 
                Cookie ck = new Cookie("admin", id);
                ck.setMaxAge(30000);
                response.addCookie(ck);
                Cookie ck1 = new Cookie("adminpass", password);               
//              ck.setHttpOnly(true);
                ck1.setMaxAge(30000);
//              ck1.setHttpOnly(true);
                response.addCookie(ck1);
                HttpSession session = request.getSession();
                session.setAttribute("admin", ck);
//                session.setAttribute("did", id);
//                request.getRequestDispatcher("adminindex.jsp").include(request, response);
                response.sendRedirect("adminindex");
                }else{
                HttpSession session = request.getSession();
                session.setAttribute("fail", "fail");
                request.getRequestDispatcher("index.jsp").include(request, response);
                }
                }
                catch (NoSuchAlgorithmException | InvalidKeySpecException ex) {
                Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            else if(email.contains("@pharmacist"))
            {            
            try {
                pharmacist a = new pharmacist();
                if(a.verifypharmacist(email, password))
                {
                    response.sendRedirect("pharmacist.jsp");     
                }
            } catch (NoSuchAlgorithmException | InvalidKeySpecException ex) {
                Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
            }
            }
            else
            {      
                try{
                if(user.verifyUser(email, password)){
                int uid = user.getUserid(email, password);
                String lname = user.getusername(uid);
                String code = user.getpic(uid);
                Cookie ck = new Cookie("emailhm", email);
                ck.setMaxAge(30000);
                response.addCookie(ck);
                Cookie ck1 = new Cookie("upasshm", password);                
//              ck.setHttpOnly(true);
                ck1.setMaxAge(30000);
//              ck1.setHttpOnly(true);               
                response.addCookie(ck1);
                Cookie ck2 = new Cookie("uid", Integer.toString(uid));
                ck2.setMaxAge(30000);
                response.addCookie(ck2);
                Cookie ck3 = new Cookie("name", lname);
                ck3.setMaxAge(30000);
                response.addCookie(ck3);
                Cookie ck4 = new Cookie("pic", code);
                ck4.setMaxAge(30000);
                response.addCookie(ck4);
                HttpSession session = request.getSession();
                session.setAttribute("emailhm", ck);
//                session.setAttribute("uid", ck2);
//                request.getRequestDispatcher("userhome.jsp").include(request, response);
                
                if(user.activeUser(email, password))
                {
                response.sendRedirect("userhome.jsp");
                }
                else
                {
                    HttpSession session1 = request.getSession();
                    session1.setAttribute("deactivate", "fail");
                    request.getRequestDispatcher("index.jsp").include(request, response);
                }
                }else{
                HttpSession session = request.getSession();
                session.setAttribute("fail", "fail");
                request.getRequestDispatcher("index.jsp").include(request, response);
                }
                }
                catch (NoSuchAlgorithmException | InvalidKeySpecException ex) {
                Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
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
