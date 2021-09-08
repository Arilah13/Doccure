/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.user;

import controllers.staff.staffprofileupdate;
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
import models.GS;
import models.User;

/**
 *
 * @author rilah
 */
@MultipartConfig(maxFileSize = 1024 * 1024 * 1000 * 1000)
public class userprofileupdate extends HttpServlet {

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
        User u = new User();
        Cookie ck[] = request.getCookies();
        String cookie = "";
        for(int i = 0; i < ck.length; i++){                   
                    if(ck[i].getName().equals("uid")){
                    cookie = ck[i].getValue();
                    }                                     
            }
        String code = u.randomAlphaNumeric(6);
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");        
        String dob = request.getParameter("dob");
        String email = request.getParameter("email");
        String mobilenumber = request.getParameter("mobilenumber");
        String blood = request.getParameter("blood");
        InputStream inputStream = null;
        Part filePart = request.getPart("pic");
        if(filePart != null){
            inputStream = filePart.getInputStream();
        }
        String password = null;
        byte[] Salt = null;
        byte[] pass = null;
        if(!request.getParameter("password").equals(""))
        {
        password = request.getParameter("password");
        
        try {
            Salt = u.generateSalt();
        } catch (NoSuchAlgorithmException ex) { 
            Logger.getLogger(staffprofileupdate.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        try {
            pass = u.getEncryptedPassword(password, Salt);
        } catch (NoSuchAlgorithmException | InvalidKeySpecException ex) {
            Logger.getLogger(staffprofileupdate.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
        int x = 0;
        try{          
            if(password == null){
              PreparedStatement ps = con.createConnection().prepareStatement("update users SET pic = ?, fname = ?, lname = ?, mobilenumber = ?, dob = ?, email = ?, bloodgroup = ?, piccode = ? where userid = ?");
              if (inputStream != null){
              ps.setBinaryStream(1, inputStream, (int)filePart.getSize());
              }
              ps.setString(2, fname);
              ps.setString(3, lname);
              ps.setString(4, mobilenumber);
              ps.setString(5, dob);
              ps.setString(6, email);
              ps.setString(7, blood);
              ps.setInt(9, Integer.parseInt(cookie));
              ps.setString(8, code);

              x = ps.executeUpdate();
            }
            else
              {
                  PreparedStatement ps = con.createConnection().prepareStatement("update users SET pic = ?, fname = ?, lname = ?, mobilenumber = ?, dob = ?, email = ?, bloodgroup = ?, piccode = ?, password = ?, Salt = ? where userid = ?");
              if (inputStream != null){
              ps.setBinaryStream(1, inputStream, (int)filePart.getSize());
              }
              ps.setString(2, fname);
              ps.setString(3, lname);
              ps.setString(4, mobilenumber);
              ps.setString(5, dob);
              ps.setString(6, email);
              ps.setString(7, blood);
              ps.setInt(11, Integer.parseInt(cookie));
              ps.setString(8, code);
              ps.setBytes(9, pass);
              ps.setBytes(10, Salt);
              x = ps.executeUpdate();
              }
              
              PreparedStatement ps1 = con.createConnection().prepareStatement("select * from users where userid = ?");
              ps1.setInt(1, Integer.parseInt(cookie));
              ResultSet rs = ps1.executeQuery();
              while(rs.next())
              {
                String random = rs.getString(12);
                File file = new File("C:\\Users\\rilah\\Music\\OneDrive\\Documents\\NetBeansProjects\\FinalCW\\web\\assets\\img\\patients\\"+code+".png");
                FileOutputStream fos = new FileOutputStream(file);
                byte b[];
                Blob blob;
                blob = rs.getBlob(10);
                b = blob.getBytes(1, (int)blob.length());
                fos.write(b);
              }
              
              if (x > 0){
                 
                request.getRequestDispatcher("userprofile").include(request, response);
                
                }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(uploadlabreport.class.getName()).log(Level.SEVERE, null, ex);
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
