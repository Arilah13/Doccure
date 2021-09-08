/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.admin;

import controllers.staff.appointmentslot;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Admin;
import models.DBCon;
import models.GS;
import models.MyOzSmsClient;
import models.Staff;

/**
 *
 * @author rilah
 */
public class adminslotupdate extends HttpServlet {

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
        Admin u = new Admin();
        
        String name = request.getParameter("change");
        
        
        
        
        
        if(name.equals("save"))
        {   
            try {
     
            String String = request.getParameter("drname");
            String[] splitString = String.split(" ");
            String drname = splitString[0];
            String speciality = splitString[1];
            String[] datelist = request.getParameterValues("date");
            String[] timelist = request.getParameterValues("time");
            String[] slotlist1 = request.getParameterValues("slot");
            int[] slotlist = new int[slotlist1.length];
            for(int i =0; i < slotlist1.length; i++)
            {
                slotlist[i] = Integer.parseInt(slotlist1[i]);
            }
            String day1;
            
            int l = datelist.length;
            String[] day = new String[2];
            
            
           
            Admin admin = new Admin();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            for(int j = 0; j <datelist.length; j++)
            {
                String date1 = datelist[j];
                Date date = sdf.parse(date1);
                switch (date.getDay()) {
                case 1:
                    day1 = "Monday";
                    break;
                case 2:
                    day1 = "Tuesday";
                    break;
                case 3:
                    day1 = "Wednesday";
                    break;
                case 4:
                    day1 = "Thursday";
                    break;
                case 5:
                    day1 = "Friday";
                    break;
                case 6:
                    day1 = "Saturday";
                    break;
                default:
                    day1 = "Sunday";
                    break;
            }
                day[j] = day1;
            }
                      
            
            a.setDatelist(datelist);
            a.setName(drname);
            a.setSlotlist(slotlist);
            a.setSpeciality(speciality);
            a.setTimelist(timelist);
            a.setDaylist(day);
            a.setNumber(l);
            
            int status = admin.addslot(a);
            
            if(status == 1 ){
                HttpSession session = request.getSession();
                session.setAttribute("add", "success");
                request.setAttribute("status", 1);                
                RequestDispatcher req = request.getRequestDispatcher("adminslots");
                req.include(request, response);
            }else{
                HttpSession session = request.getSession();
                session.setAttribute("add", "fail");
                request.setAttribute("status", 0);
                RequestDispatcher req = request.getRequestDispatcher("adminslots");
                req.include(request, response);
            }
            
        } catch (ClassNotFoundException | ParseException ex) {
            Logger.getLogger(appointmentslot.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
        else if(name.equals("cancel"))
        {
            int sid1 = Integer.parseInt(request.getParameter("sid1"));
            Admin n = new Admin();
            n.reduceearnings(sid1);
            ArrayList<String> phonenumber = new ArrayList();
            List<String> phone = n.getphone(sid1);
            for (int j = 0; j < phone.size(); j++)
            {
                phonenumber.add(phone.get(j));
            }
            boolean b = u.deleteslot(sid1);
            
            ArrayList<GS> dr = new ArrayList();
            List<GS> doc = n.getdetails(sid1);
            for (int i = 0; i < doc.size(); i++)
            {
                dr.add(doc.get(i));
            }    
            
            
            try {
                        String host = "127.0.0.1";
                        int port = 9500;
                        String username = "admin";
                        String password = "130399";
 
                        MyOzSmsClient osc = new MyOzSmsClient(host, port);
                        osc.login(username, password);
 
                         
                        String line = "Your Appointment for Doctor "+dr.get(0).getDrname()+" Speciality "+dr.get(0).getDrspeciality()+" on "+dr.get(0).getDate()+" at "+dr.get(0).getTime()+" has been cancelled your money will be refunded";
 
                        System.out.println("SMS message:");
                        for(int k=0; k < phonenumber.size(); k++)
                        {
                        if(osc.isLoggedIn()) {
                            osc.sendMessage(phonenumber.get(k), line);
                                
                        }
                        
                        }
                        osc.logout();
 
 
                } catch (IOException | InterruptedException e) {
                        System.out.println(e.toString());
                }
                
            
            if(b == true)
            {
                HttpSession session = request.getSession();
            session.setAttribute("cancel", "success");
                request.getRequestDispatcher("adminslots").forward(request, response);
            }
            else
            {
                HttpSession session = request.getSession();
                session.setAttribute("cancel", "fail");
                request.getRequestDispatcher("adminslots").forward(request, response);
            }
        }
        else if(name.equals("update"))
        {
            
        Admin s = new Admin();
        
        a.setDate(request.getParameter("apptdate"));
        a.setTime(request.getParameter("appttime"));
        a.setSlot(Integer.parseInt(request.getParameter("apptslots")));
        a.setAid(Integer.parseInt(request.getParameter("aid")));
        
        int aid = Integer.parseInt(request.getParameter("aid"));
        String Date1 = request.getParameter("apptdate");
        java.sql.Date date = java.sql.Date.valueOf(Date1);
        String Time = request.getParameter("appttime");
        
        ArrayList<GS> dr = new ArrayList();
        List<GS> doc = s.getdetails(aid);
        for (int i = 0; i < doc.size(); i++)
        {
            dr.add(doc.get(i));
        }
        
        ArrayList<String> phonenumber = new ArrayList();
        List<String> phone = s.getphone(aid);
        for (int j = 0; j < phone.size(); j++)
        {
            phonenumber.add(phone.get(j));
        }
        
        int reduce = s.updateearnings(aid, date);
        
        
        int b = s.updateslot(a);
        
        if(b > 0)
        {
            
            try {
                        String host = "127.0.0.1";
                        int port = 9500;
                        String username = "admin";
                        String password = "130399";
 
                        MyOzSmsClient osc = new MyOzSmsClient(host, port);
                        osc.login(username, password);
 
                         
                        String line = "Your Appointment for Doctor "+dr.get(0).getDrname()+" Speciality "+dr.get(0).getDrspeciality()+" on "+dr.get(0).getDate()+" at "+dr.get(0).getTime()+" has been updated to be on "+Date1+" at "+Time;
 
                        System.out.println("SMS message:");
                        for(int k=0; k < phonenumber.size(); k++)
                        {
                        if(osc.isLoggedIn()) {
                                osc.sendMessage(phonenumber.get(k), line);
                                
                        }
                        
                        }
                        osc.logout();
 
 
                } catch (IOException | InterruptedException e) {
                        System.out.println(e.toString());
                }
            
            HttpSession session = request.getSession();
            session.setAttribute("update", "success");
            request.getRequestDispatcher("adminslots").forward(request, response);
        }
        else
        {
            HttpSession session = request.getSession();
            session.setAttribute("update", "fail");
            request.getRequestDispatcher("adminslots").forward(request, response);
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
