/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author rilah
 */
public class Lab {
    DBCon con = new DBCon();
    
    public List<GS> getlabreports(int id) throws ClassNotFoundException{
        List<GS> list = new ArrayList<GS>();
        
        try{
            
            PreparedStatement ps = con.createConnection().prepareStatement("Select * from labappointment where uid = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                GS a = new GS();
                a.setTestname(rs.getString(2));
                a.setUid(rs.getInt(3));
                a.setTestdate(rs.getString(4));
                a.setTestid(rs.getInt(1));
                a.setTesttime(rs.getString(5));
                a.setStatus(rs.getInt(8));
                list.add(a);
                }          
            
        }
        catch(SQLException e){
            
        }
        return list;
    }
    
    public List<GS> getuploadlabreports() throws ClassNotFoundException{
        List<GS> list = new ArrayList<GS>();
        List<Integer> list2 = new ArrayList<Integer>();
        List<String> list1 = new ArrayList<String>();
        List<GS> list3 = new ArrayList<GS>();
        
        try{
            
            PreparedStatement ps = con.createConnection().prepareStatement("Select * from labappointment where cancel = ? and date <= ?");        
            Date date = Date.valueOf(java.time.LocalDate.now());
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            String date1 = formatter.format(date);
            ps.setInt(1, 0);
            ps.setString(2, date1);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                GS a = new GS();
                a.setTestname(rs.getString(2));
                a.setUid(rs.getInt(3));
                a.setTestdate(rs.getString(4));
                a.setTestid(rs.getInt(1));
                a.setTesttime(rs.getString(5));
                a.setStatus(rs.getInt(8));
                list.add(a);
                }  
           
            
            PreparedStatement ps3 = con.createConnection().prepareStatement("Select fname from users where userid = ?");
            for(int i=0; i<list.size(); i++)
            {
            ps3.setInt(1, list.get(i).getUid());
            ResultSet rs3 = ps3.executeQuery();
            while(rs3.next())
            {
                list1.add(rs3.getString(1));
            }
            }
            
            for(int j=0; j<list.size(); j++)
            {
                GS a = new GS();
                a.setTestname(list.get(j).getTestname());
                a.setUid(list.get(j).getUid());
                a.setTestdate(list.get(j).getTestdate());
                a.setTestid(list.get(j).getTestid());
                a.setTesttime(list.get(j).getTesttime());
                a.setStatus(list.get(j).getStatus());
                a.setFname(list1.get(j));
                list3.add(a);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(Lab.class.getName()).log(Level.SEVERE, null, ex);
        }  
        return list3;
    }
        
    public boolean deleteappointment(int lid) throws ParseException
    {
        boolean a = false;
        try{
            Date date = null;
            String testname = null;
            int fee = 0;
            int labearning = 0;
            int newlabearning = 0;
            PreparedStatement ps = con.createConnection().prepareStatement("update labappointment set cancel = ? where lid = ? ");
            ps.setInt(1, 1);
            ps.setInt(2, lid);
            ps.executeUpdate();
            PreparedStatement ps1 = con.createConnection().prepareStatement("select testname, date from labappointment where lid = ?");
            ps1.setInt(1, lid);
            ResultSet rs1 = ps1.executeQuery();
            while(rs1.next())
            {
                testname = rs1.getString(1);
                date = java.sql.Date.valueOf(rs1.getString(2));
            }
            PreparedStatement ps2 = con.createConnection().prepareStatement("select fee from test where name = ?");
            ps2.setString(1, testname);
            ResultSet rs2 = ps2.executeQuery();
            while(rs2.next())
            {
                fee = Integer.parseInt(rs2.getString(1));
            }
            PreparedStatement ps3 = con.createConnection().prepareStatement("select labearning from earnings where date = ?");
            ps3.setDate(1, date);
            ResultSet rs3 = ps3.executeQuery();
            while(rs3.next())
            {
                labearning = Integer.parseInt(rs3.getString(1));
            }
            newlabearning = labearning - fee;
            PreparedStatement ps4 = con.createConnection().prepareStatement("update earnings set labearning = ? where date =?");
            ps4.setString(1, String.valueOf(newlabearning));
            ps4.setDate(2, date);
            ps4.executeUpdate();
            a = true;
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(Lab.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }
    
    public List<GS> adminlabappointments() {
       List<GS> results = new ArrayList<GS>();
       List<GS> results1 = new ArrayList<GS>();
       List<GS> results2 = new ArrayList<GS>();
       
       try{
           Date date = Date.valueOf(java.time.LocalDate.now());
           SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
           String date1 = formatter.format(date);
           PreparedStatement ps = con.createConnection().prepareStatement("select * from labappointment");
           
           ResultSet rs = ps.executeQuery();
           while(rs.next())
           {
               GS a = new GS();
               a.setTestname(rs.getString(2));
               a.setUid(rs.getInt(3));
               a.setTesttime(rs.getString(5));
               a.setTestdate(rs.getString(4));
               a.setTestano(rs.getInt(6));
               a.setTestid(rs.getInt(1));
               a.setDid(rs.getInt(10));
               a.setStatus(rs.getInt(9));
               a.setSlot(rs.getInt(8));
               results.add(a);
           }
           PreparedStatement ps2 = con.createConnection().prepareStatement("select name, piccode from doctor where id = ?");
           for(int j=0; j<results.size(); j++)
           {               
                   ps2.setInt(1, results.get(j).getDid());
                   ResultSet rs2 = ps2.executeQuery();
                   if(rs2.next())
                   {
                       GS a = new GS();
                       a.setDrname(rs2.getString(1));
                       a.setPiccode(rs2.getString(2));
                       results2.add(a);
                   }
                   else if(!rs2.next())
                   {
                       GS a = new GS();
                       a.setDrname("");
                       a.setPiccode("");
                       results2.add(a);
                   }
               
           }
           PreparedStatement ps1 = con.createConnection().prepareStatement("select concat(fname,' ',lname), email, piccode from users where userid = ?");
           for(int i=0; i<results.size(); i++)
           {
               ps1.setInt(1, results.get(i).getUid());
               ResultSet rs1 = ps1.executeQuery();
               while(rs1.next())
               {
                   GS a = new GS();
                   a.setUname(rs1.getString(1));
                   a.setEmail(rs1.getString(2));
                   a.setTestname(results.get(i).getTestname());
                   a.setTesttime(results.get(i).getTesttime());
                   a.setTestdate(results.get(i).getTestdate());
                   a.setTestano(results.get(i).getTestano());
                   a.setUid(results.get(i).getUid());
                   a.setTestid(results.get(i).getTestid());
                   a.setDid(results.get(i).getDid());
                   if(results2.get(i).getDrname() != null || results2.get(i).getDrname().equals(""))
                   {
                   a.setDrname(results2.get(i).getDrname());
                   a.setPiccode(results2.get(i).getPiccode());
                   }
                   a.setPiccode1(rs1.getString(3));
                   a.setStatus(results.get(i).getStatus());
                   a.setSlot(results.get(i).getSlot());
                   results1.add(a);
               }
               
           }
           
       } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(Appointment.class.getName()).log(Level.SEVERE, null, ex);
        }
        return results1;
   }
    
    public List<GS> getlabappointments(int id){
        List<GS> results1 = new ArrayList<GS>();
        
        try{
            Date date = Date.valueOf(java.time.LocalDate.now());
            PreparedStatement ps = con.createConnection().prepareStatement("select * from labappointment where uid = ? and date >= ? ");
            ps.setInt(1, id);
            ps.setDate(2, date);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                GS a = new GS();
                a.setTestid(rs.getInt(1));
                a.setTestname(rs.getString(2));
                a.setUid(rs.getInt(3));
                a.setTestdate(rs.getString(4));
                a.setTesttime(rs.getString(5));
                a.setTestano(rs.getInt(6));
                a.setStatus(rs.getInt(9));
                results1.add(a);
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Appointment.class.getName()).log(Level.SEVERE, null, ex);
        }
        return results1;
    }
    
    public int labappointmentinsert(GS a) throws ParseException{
        int x = 0;
        int earnings = 0;
        int price = 0;
        Appointment appointment = new Appointment();
        try{
//            PreparedStatement ps = con.createConnection().prepareStatement("select id from test where name = ?");
//            ps.setString(1, a.getTestname());
//            ResultSet rs = ps.executeQuery();
//            while(rs.next()){
//                a.setTestid(rs.getInt(1));
//            }
            if(a.getDrname() == null)
            {
            a.setTesttime(appointment.getAppointmentTime(a));
            PreparedStatement ps1 = con.createConnection().prepareStatement("insert into labappointment(testname, uid, date, time, slot) values(?, ?, ?, ?, ?)");
            ps1.setString(1, a.getTestname());
            ps1.setInt(2, a.getUid());
            ps1.setString(3, a.getTestdate());
            ps1.setString(4, appointment.getAppointmentTime(a));
            ps1.setInt(5, appointment.getAppointmentSlotNo(a));
            x = ps1.executeUpdate();
            
            PreparedStatement ps = con.createConnection().prepareStatement("select labearning from earnings where date = ?");
            ps.setDate(1, java.sql.Date.valueOf(a.getTestdate()));
            ResultSet rs = ps.executeQuery();
            if(rs.next())
            {              
                earnings = Integer.parseInt(rs.getString(1));
                price = earnings + Integer.parseInt(a.getEarnings());         
                
               PreparedStatement ps2 = con.createConnection().prepareStatement("update earnings set labearning = ? where date = ?");
               ps2.setString(1, String.valueOf(price));
               ps2.setDate(2, java.sql.Date.valueOf(a.getTestdate()));
               ps2.executeUpdate();
               
           }
            
            else if(!rs.next())
           {
               PreparedStatement ps2 = con.createConnection().prepareStatement("insert into earnings(labearning, date) values(?, ?) ");
               ps2.setString(1, a.getEarnings());
               ps2.setDate(2, java.sql.Date.valueOf(a.getTestdate()));
               ps2.executeUpdate();
               
           }
            
            }
            else
            {
            java.sql.Date date = java.sql.Date.valueOf(a.getTestdate());
            PreparedStatement ps = con.createConnection().prepareStatement("select id from doctor where name = ? and Speciality = ?");
            ps.setString(1, a.getDrname());
            ps.setString(2, a.getDrspeciality());
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                a.setDid(rs.getInt(1));
            }
            a.setTesttime(appointment.getAppointmentTime(a));
            PreparedStatement ps1 = con.createConnection().prepareStatement("insert into labappointment(testname, uid, date, time, slot, drid) values(?, ?, ?, ?, ?, ?)");
            ps1.setString(1, a.getTestname());
            ps1.setInt(2, a.getUid());
            ps1.setString(3, a.getTestdate());
            ps1.setString(4, appointment.getAppointmentTime(a));
            ps1.setInt(5, appointment.getAppointmentSlotNo(a));
            ps1.setInt(6, a.getDid());
            x = ps1.executeUpdate();
            
            PreparedStatement ps3 = con.createConnection().prepareStatement("select labearning from earnings where date = ?");
            
            ps3.setDate(1, date);
            ResultSet rs3 = ps3.executeQuery();
            if(rs.next())
            {              
                earnings = Integer.parseInt(rs3.getString(1));
                price = earnings + Integer.parseInt(a.getEarnings());         
                
               PreparedStatement ps2 = con.createConnection().prepareStatement("update earnings set labearning = ? where date = ?");
               ps2.setString(1, String.valueOf(price));
               ps2.setDate(2, java.sql.Date.valueOf(a.getTestdate()));
               ps2.executeUpdate();
               
           }
            
            else if(!rs.next())
           {
               PreparedStatement ps2 = con.createConnection().prepareStatement("insert into earnings(appointmentearning, date) values(?, ?) ");
               ps2.setString(1, a.getEarnings());
               ps2.setDate(2, java.sql.Date.valueOf(a.getTestdate()));
               ps2.executeUpdate();
               
           }
            
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(Lab.class.getName()).log(Level.SEVERE, null, ex);
        }
        return x;
    }  
    
//    public boolean addlab(String lab)
//    {
//        boolean a = false;
//        try{
//            PreparedStatement ps = con.createConnection().prepareStatement("insert into test(name) values(?)");
//            ps.setString(1, lab);
//            ps.executeUpdate();
//            a = true;
//        } catch (ClassNotFoundException ex) {
//            Logger.getLogger(Lab.class.getName()).log(Level.SEVERE, null, ex);
//        } catch (SQLException ex) {
//            Logger.getLogger(Lab.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return a;
//    }
    
    public boolean labfileremove(int lid)
    {
        boolean a = false;
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("update labappointment set Report_status = 0 where lid = ? ");
            ps.setInt(1, lid);
            ps.executeUpdate();
            a = true;
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(Lab.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }
    
    public int checkTime(GS a)
    {
        int b = 0;
        
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("select * from labappointment date = ? and time = ?");
            ps.setString(1, a.getTestdate());
            ps.setString(2, "02:00");
            ResultSet rs = ps.executeQuery();
            if(rs.next())
            {
                b = 1;
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Lab.class.getName()).log(Level.SEVERE, null, ex);
        }
        return b;
    }
}
