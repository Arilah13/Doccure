/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author rilah
 */
public class logout extends HttpServlet {

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
        Cookie ck[] = request.getCookies();
        String cookie = null;
        String cookie1 = null;
        String cookie2 = null;
        String cookie3 = null;
        for(int j=0; j<ck.length; j++)
        {
            if(ck[j].getName().equals("emailhm")){
                cookie = ck[j].getValue();
            }
            if(ck[j].getName().equals("sidhm")){
                cookie1 = ck[j].getValue();
            }
            if(ck[j].getName().equals("didhm")){
                cookie2 = ck[j].getValue();
            }
            if(ck[j].getName().equals("admin")){
                cookie3 = ck[j].getValue();
            }
        }
        if(cookie != null || cookie1 != null || cookie2 != null || cookie3 != null)
        {
            
            for(int i = 0; i < ck.length; i++)
            {
                ck[i].setMaxAge(0);
                response.addCookie(ck[i]);
            }      
            HttpSession session = request.getSession();
            session.invalidate();
            response.sendRedirect("index.jsp");
        }
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
          Cookie ck[] = request.getCookies();
//        String cookie = "";
//        String cookie1 = "";
//        String cookie2 = "";
//        String cookie3 = "";
//        for(int j=0; j<ck.length; j++)
//        {
//            if(ck[j].getName().equals("emailhm")){
//                cookie = ck[j].getValue();
//            }
//            if(ck[j].getName().equals("sidhm")){
//                cookie1 = ck[j].getValue();
//            }
//            if(ck[j].getName().equals("didhm")){
//                cookie2 = ck[j].getValue();
//            }
//            if(ck[j].getName().equals("admin")){
//                cookie3 = ck[j].getValue();
//            }
//        }
//        if(cookie != null || cookie1 != null || cookie2 != null || cookie3 != null)
//        {
            
            for(int i = 0; i < ck.length; i++)
            {
                ck[i].setMaxAge(0);
                response.addCookie(ck[i]);
            }      
//            HttpSession session = request.getSession();
//            session.invalidate();
            request.getRequestDispatcher("index.jsp").include(request, response);
//        }
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
