/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Admin;
import models.GS;

/**
 *
 * @author rilah
 */
public class testupdate extends HttpServlet {

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
        GS a = new GS();
        Admin u = new Admin();
        
        String name = request.getParameter("change");
        
        
        
        
        
        if(name.equals("save"))
        {   String special = request.getParameter("test");
            String price = request.getParameter("price");
            int b = u.addtest(special, price);
            if(b > 0)
            {
                HttpSession session = request.getSession();
                session.setAttribute("add", "success");
                request.getRequestDispatcher("adminlabtest").forward(request, response);
            }
            else
            {
                HttpSession session = request.getSession();
                session.setAttribute("add", "fail");
                request.getRequestDispatcher("adminlabtest").forward(request, response);
            }
        }
        else if(name.equals("delete"))
        {
            int sid1 = Integer.parseInt(request.getParameter("sid1"));
            int b = u.deletetest(sid1);
            if(b > 0)
            {
                HttpSession session = request.getSession();
            session.setAttribute("cancel", "success");
                request.getRequestDispatcher("adminlabtest").forward(request, response);
            }
            else
            {
                request.getRequestDispatcher("adminlabtest").forward(request, response);
            }
        }
        else if(name.equals("update"))
        {
            int sid = Integer.parseInt(request.getParameter("sid"));
            String special1 = request.getParameter("speciality");
            String price = request.getParameter("price");
            int b = u.updatetest(sid, special1, price);
            if(b > 0)
            {
                HttpSession session = request.getSession();
            session.setAttribute("update", "success");
                request.getRequestDispatcher("adminlabtest").forward(request, response);
            }
            else
            {
                HttpSession session = request.getSession();
            session.setAttribute("update", "fail");
                request.getRequestDispatcher("adminlabtest").forward(request, response);
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
