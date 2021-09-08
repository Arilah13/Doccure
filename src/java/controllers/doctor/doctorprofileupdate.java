/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.doctor;

import controllers.staff.uploadlabreport;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import models.DBCon;
import models.Doctor;
import models.GS;

/**
 *
 * @author rilah
 */
@MultipartConfig(maxFileSize = 1024 * 1024 * 1000 * 1000)
public class doctorprofileupdate extends HttpServlet {

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
        DBCon con = new DBCon();
        GS a = new GS();
        Doctor u = new Doctor();
        
        Cookie ck[] = request.getCookies();
        String cookie = "";
        for(int i = 0; i < ck.length; i++){                   
                    if(ck[i].getName().equals("didhm")){
                    cookie = ck[i].getValue();
                    }                                     
            }
        int x = 0;
        Doctor staff = new Doctor();
        byte[] Salt = null;
        byte[] pass = null;
        String password = null;
        String fname = request.getParameter("fname");
        String speciality = request.getParameter("speciality");   
        String email = request.getParameter("email");
        if(!request.getParameter("password").equals(""))
        {
            password = request.getParameter("password");
            try {
            Salt = staff.generateSalt();
        } catch (NoSuchAlgorithmException ex) { 
            Logger.getLogger(doctorprofileupdate.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        try {
            pass = staff.getEncryptedPassword(password, Salt);
        } catch (NoSuchAlgorithmException | InvalidKeySpecException ex) {
            Logger.getLogger(doctorprofileupdate.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
        String dob = request.getParameter("dob");
        String code = u.randomAlphaNumeric(6);
        String mobilenumber = request.getParameter("mobilenumber");
        String gender = request.getParameter("gender");
        InputStream inputStream = null;
        Part filePart = request.getPart("pic");
        if(filePart != null){
            inputStream = filePart.getInputStream();
        }
        
        
        
        
        try{   
              if(password == null)
              {
              PreparedStatement ps = con.createConnection().prepareStatement("update doctor SET pic = ?, name = ?, phonenumber = ?, speciality = ?, gender = ?, dob = ?, piccode = ?, email = ? where id = ?");
              if (inputStream != null){
              ps.setBinaryStream(1, inputStream, (int)filePart.getSize());
              }
              ps.setString(2, fname);
              ps.setString(4, speciality);
              ps.setString(3, mobilenumber);
              ps.setString(5, gender);
              ps.setString(6, dob);
              ps.setInt(9, Integer.parseInt(cookie));
              ps.setString(8, email);
              ps.setString(7, code);
              x = ps.executeUpdate();
              }
              else
              {
                  PreparedStatement ps = con.createConnection().prepareStatement("update doctor SET pic = ?, name = ?, phonenumber = ?, speciality = ?, gender = ?, dob = ?, piccode = ?, email = ?, password = ?, salt =? where id = ?");
                  if (inputStream != null){
                  ps.setBinaryStream(1, inputStream, (int)filePart.getSize());
                  }
                  ps.setString(2, fname);
                  ps.setString(4, speciality);
                  ps.setString(3, mobilenumber);
                  ps.setString(5, gender);
                  ps.setString(6, dob);
                  ps.setInt(11, Integer.parseInt(cookie));
                  ps.setString(8, email);
                  ps.setBytes(9, pass);
                  ps.setBytes(10, Salt);
                  ps.setString(7, code);
                  x = ps.executeUpdate();
              
              }
              
              PreparedStatement ps1 = con.createConnection().prepareStatement("select * from doctor where id = ?");
              ps1.setInt(1, Integer.parseInt(cookie));
              ResultSet rs = ps1.executeQuery();
              while(rs.next())
              {
                File file = new File("C:\\Users\\rilah\\Music\\OneDrive\\Documents\\NetBeansProjects\\FinalCW\\web\\assets\\img\\doctors\\"+code+".png");
                FileOutputStream fos = new FileOutputStream(file);
                byte b[];
                Blob blob;
                blob = rs.getBlob(7);
                b = blob.getBytes(1, (int)blob.length());
                fos.write(b);
              }
              
              if (x > 0){
                  List<GS> appointments = u.getdoctordetails(Integer.parseInt(cookie));
                  ArrayList<GS> results = new ArrayList();
                  for (int i = 0; i < appointments.size(); i++)
                  {
                    results.add(appointments.get(i));
                  }
                  request.setAttribute("results", results);
                  request.getRequestDispatcher("doctorprofile.jsp").forward(request, response);
              }
            
        } catch (SQLException ex) {
            Logger.getLogger(uploadlabreport.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(doctorprofileupdate.class.getName()).log(Level.SEVERE, null, ex);
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
