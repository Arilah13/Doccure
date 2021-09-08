/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.staff;

import java.io.IOException;
import java.io.InputStream;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import models.DBCon;
import models.Lab;

/**
 *
 * @author rilah
 */
@MultipartConfig(maxFileSize = 1024 * 1024 * 1000)
public class uploadlabreport extends HttpServlet {

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
        int testid = 0;
        testid = Integer.parseInt(request.getParameter("lid"));
        if(request.getParameter("change").equals("upload"))
        {
        InputStream inputStream = null;
            Part filePart = request.getPart("file");
            if(filePart != null){
                inputStream = filePart.getInputStream();
            }
        try{           
              PreparedStatement ps = con.createConnection().prepareStatement("update labappointment SET File_Data = ?, Report_status = ? where lid = ?");
              if (inputStream != null){
              ps.setBinaryStream(1, inputStream, (int)filePart.getSize());
              }
              ps.setInt(2, 1);
              ps.setInt(3, testid);
              int x = ps.executeUpdate();
              if (x > 0){
                  HttpSession session = request.getSession();
                  session.setAttribute("upload", "success");
                  request.getRequestDispatcher("labfiles").forward(request, response);
              }
              else
              {
                  HttpSession session = request.getSession();
                  session.setAttribute("upload", "fail");
                 request.getRequestDispatcher("labfiles").forward(request, response);
              }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(uploadlabreport.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
        else if(request.getParameter("change").equals("remove"))
        {
            testid = Integer.parseInt(request.getParameter("lid"));
            Lab l = new Lab();
            boolean a = l.labfileremove(testid);
            if(a)
            {
                request.getRequestDispatcher("labfiles").forward(request, response);
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
