/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.Blob;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import models.Admin;
import models.DBCon;
import models.Doctor;
import models.GS;

/**
 *
 * @author rilah
 */
@MultipartConfig(maxFileSize = 1024 * 1024 * 1000 * 1000)
public class doctorregister extends HttpServlet {

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
        Doctor doctor = new Doctor();
        DBCon con = new DBCon();
        GS d = new GS();
        
        String name = request.getParameter("name");
        String speciality = request.getParameter("speciality");
        String password = request.getParameter("password");
        String username = request.getParameter("username");
        String price = request.getParameter("price");
        InputStream inputStream = null;
        Part filePart = request.getPart("pic");
        if(filePart != null){
            inputStream = filePart.getInputStream();
        }
        
        byte[] Salt = null;
        try {
            Salt = doctor.generateSalt();
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(doctorregister.class.getName()).log(Level.SEVERE, null, ex);
        }
        byte[] pass = null;
        try {
            pass = doctor.getEncryptedPassword(password, Salt);
        } catch (NoSuchAlgorithmException | InvalidKeySpecException ex) {
            Logger.getLogger(doctorregister.class.getName()).log(Level.SEVERE, null, ex);
        }
        String code = doctor.randomAlphaNumeric(6);
        try{           
              PreparedStatement ps = con.createConnection().prepareStatement("insert into doctor(username, name, Speciality, password, salt, pic, piccode, price)  VALUES(?, ?, ?, ?, ?, ?, ?, ?)");
              if (inputStream != null){
              ps.setBinaryStream(6, inputStream, (int)filePart.getSize());
              }
              ps.setString(1, username);
              ps.setString(2, name);
              ps.setString(3, speciality);  
              ps.setBytes(4, pass);     
              ps.setBytes(5, Salt);
              ps.setString(7, code);
              ps.setString(8, price);
              int status = ps.executeUpdate();
              
              PreparedStatement ps2 = con.createConnection().prepareStatement("select doctor from register where date = ?");
              ps2.setDate(1, Date.valueOf(java.time.LocalDate.now()));
              ResultSet rs2 = ps2.executeQuery();
              if(rs2.next())
              {
                  int staff1 = rs2.getInt(1);
                  int count = staff1 + 1;
                  PreparedStatement ps3 = con.createConnection().prepareStatement("update register set doctor = ? where date = ?");
                  ps3.setInt(1, count);
                  ps3.setDate(2, Date.valueOf(java.time.LocalDate.now()));
                  ps3.executeUpdate();
              }
              else if(!rs2.next())
              {
                  PreparedStatement ps3 = con.createConnection().prepareStatement("insert into register(doctor, date) values(?, ?)");
                  ps3.setInt(1, 1);
                  ps3.setDate(2, Date.valueOf(java.time.LocalDate.now()));
                  ps3.executeUpdate();
              }
              
              PreparedStatement ps1 = con.createConnection().prepareStatement("select * from doctor where username = ?");
              ps1.setString(1, username);
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
        
        
        if(status == 1 ){
            HttpSession session = request.getSession();
            session.setAttribute("add", "success");
                
            Admin a = new Admin();
        
            List<GS> list = new ArrayList<GS>();
            list = a.admindoctors();
        
            request.setAttribute("results", list);
                
            RequestDispatcher req = request.getRequestDispatcher("admindoctors.jsp");
            req.forward(request, response);
        }else{
            HttpSession session = request.getSession();
                session.setAttribute("add", "fail");
                
            Admin a = new Admin();
        
            List<GS> list = new ArrayList<GS>();
            list = a.admindoctors();
        
            request.setAttribute("results", list);    
                
            RequestDispatcher req = request.getRequestDispatcher("admindoctors.jsp");
            req.forward(request, response);
        }
    }   catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(doctorregister.class.getName()).log(Level.SEVERE, null, ex);
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
