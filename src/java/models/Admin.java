/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author rilah
 */
public class Admin extends Appointment{
   
    public boolean verifyAdmin(String id, String password) throws NoSuchAlgorithmException, InvalidKeySpecException{//Read
        boolean verified = false;
        int status = 0;
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("select * from users where username = ? ");
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            
            
            if(rs.next() && authenticate(password, rs.getBytes("password"), rs.getBytes("salt"))){
                verified = true;
            }
            
            
        }catch(ClassNotFoundException | SQLException e){
        }
        
        return verified;
    }
    
    
    
    
    
    public List<GS> adminappointments(){
        ArrayList<GS> list = new ArrayList<GS>();
        ArrayList<Integer> list1 = new ArrayList<Integer>();
        ArrayList<Integer> list2 = new ArrayList<Integer>();
        ArrayList<Integer> list3 = new ArrayList<Integer>();
        ArrayList<String> name = new ArrayList<String>();
        ArrayList<String> speciality = new ArrayList<String>();
        ArrayList<Integer> list4 = new ArrayList<Integer>();
        ArrayList<Integer> list5 = new ArrayList<Integer>();
        ArrayList<String> list6 = new ArrayList<String>();
        ArrayList<Integer> list7 = new ArrayList<Integer>();
        ArrayList<Integer> list9 = new ArrayList<Integer>();
        ArrayList<String> username = new ArrayList<String>();
        ArrayList<String> email = new ArrayList<String>();
        ArrayList<Integer> list8 = new ArrayList<Integer>();
        ArrayList<String> piccode = new ArrayList<String>();
        ArrayList<String> piccode1 = new ArrayList<String>();
        ArrayList<String> price = new ArrayList<String>();
        
        int aid = 0;
        int did = 0;
        int ano = 0;
        int id = 0;
        int uid = 0;
        String delay = null;
        
        try{
            Date date = Date.valueOf(java.time.LocalDate.now());
            PreparedStatement ps3 = con.createConnection().prepareStatement("select aid from doctor_availability ");
            ResultSet rs3 = ps3.executeQuery();
            while(rs3.next()){            
                aid = rs3.getInt(1);
                list1.add(aid);
            }
            PreparedStatement ps = con.createConnection().prepareStatement("select appointmentno,id,uid,delay,aid,cancel from patient_appointment where aid = ?");
            for(int i=0; i<list1.size(); i++)
            {
            
            ps.setInt(1, list1.get(i));
            ResultSet rs = ps.executeQuery();
            while(rs.next()){        
                ano = rs.getInt(1);
                id = rs.getInt(2);
                uid = rs.getInt(3);
                if(rs.getString(4)==null || rs.getString(4).equals(""))
                {
                    delay = "No delay";
                }
                else
                {
                    delay = rs.getString(4);
                }
                list3.add(ano);
                list4.add(id);
                list5.add(uid);
                list6.add(delay);
                list7.add(rs.getInt(5));
                list8.add(rs.getInt(6));
            }
            }
            
            PreparedStatement ps8 = con.createConnection().prepareStatement("select did from doctor_availability where aid = ?");
            for(int p=0; p<list7.size(); p++)
            {
            ps8.setInt(1, list7.get(p));
            ResultSet rs8 = ps8.executeQuery();
            while(rs8.next()){
                did = rs8.getInt(1);
                list9.add(did);              
            }
            }
            
            PreparedStatement ps2 = con.createConnection().prepareStatement("select name, Speciality, piccode, price from doctor where id = ?");
            for(int j=0; j<list9.size(); j++)
            {
            ps2.setInt(1, list9.get(j));
            ResultSet rs2 = ps2.executeQuery();
            while(rs2.next()){
                name.add(rs2.getString(1));
                speciality.add(rs2.getString(2));
                piccode1.add(rs2.getString(3));
                price.add(rs2.getString(4));
            }}
            PreparedStatement ps7 = con.createConnection().prepareStatement("select concat(fname,' ',lname), email, piccode from users where userid = ?");
            for(int y=0; y<list5.size(); y++)
            {
            ps7.setInt(1, list5.get(y));
            ResultSet rs7 = ps7.executeQuery();
            while(rs7.next()){
                username.add(rs7.getString(1));
                email.add(rs7.getString(2));
                piccode.add(rs7.getString(3));
            }
            }
            PreparedStatement ps1 = con.createConnection().prepareStatement("select * from doctor_availability where aid = ? and did = ?");
            for(int n=0; n<list9.size(); n++)
            {
            ps1.setInt(1, list7.get(n));
            ps1.setInt(2, list9.get(n));
            ResultSet rs1 = ps1.executeQuery();
            while(rs1.next()){
                 GS a = new GS();
                 a.setDate(rs1.getDate(3).toString());
                 a.setTime(rs1.getString(4));
                 a.setDay(rs1.getString(5));
                 a.setName(name.get(n));
                 a.setSpeciality(speciality.get(n));
                 a.setAno(list3.get(n));
                 a.setPaID(list4.get(n));
                 a.setUid(list5.get(n));
                 a.setDelay(list6.get(n));
                 a.setUname(username.get(n));
                 a.setEmail(email.get(n));
                 a.setStatus(list8.get(n));
                 a.setPiccode(piccode.get(n));
                 a.setPiccode1(piccode1.get(n));
                 a.setEarnings(price.get(n));
                 list.add(a);
            }}
           
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(Appointment.class.getName()).log(Level.SEVERE, null, ex);
        } 
        return list;
    }
    
    public List<GS> adminmembers(){
        List<GS> list = new ArrayList<GS>();
        try {
            
            PreparedStatement ps = con.createConnection().prepareStatement("select userid, concat(fname,' ', lname), email, dob, mobilenumber, accstatus, piccode, logindate from users where userid <> ?");
            ps.setInt(1, -999);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                GS a = new GS();
                a.setUid(rs.getInt(1));
                a.setFname(rs.getString(2));               
                a.setEmail(rs.getString(3)); 
//                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MMM-dd");
//                LocalDate dt = LocalDate.parse(rs.getString(4), dtf);                             
//                java.time.Period diff = java.time.Period.between(dt, java.time.LocalDate.now());
                a.setDate(rs.getString(4));
                a.setMobilenumber(rs.getString(5));
                a.setStatus(rs.getInt(6));
                a.setPiccode(rs.getString(7));
                a.setDate(String.valueOf(rs.getDate(8)));
                list.add(a);
            }
            
                          
                    
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Appointment.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return list;
    }
    
   
    public List<GS> admindoctors(){
        List<GS> list = new ArrayList<GS>();
        try {
            
            PreparedStatement ps = con.createConnection().prepareStatement("select * from doctor");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                GS a = new GS();
                a.setDrname(rs.getString(1));
                a.setUname(rs.getString(3));
                a.setDid(rs.getInt(2));
                a.setDrspeciality(rs.getString(4));
                a.setPiccode(rs.getString(12));
                a.setEarnings(rs.getString(15));
                a.setStatus(rs.getInt(13));
                list.add(a);
            }
            
                          
                    
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Appointment.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return list;
    }
    
    public List<GS> getspecialities(){
        List<GS> list = new ArrayList<GS>();
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("select * from doctorspeciality");
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                GS a = new GS();
                a.setName(rs.getString(2));
                a.setAid(rs.getInt(1));
                list.add(a);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(Admin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public List<GS> getlabs(){
        List<GS> list = new ArrayList<GS>();
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("select * from test");
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                GS a = new GS();
                a.setName(rs.getString(2));
                a.setAid(rs.getInt(1));
                a.setEarnings(rs.getString(3));
                list.add(a);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(Admin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public int addspeciality(String b)
    {
        int a = 0;
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("insert into doctorspeciality(name) values(?)");
            ps.setString(1, b);
            a = ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Admin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }
    
    public int deletespeciality(int b)
    {
        int a = 0;
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("delete from doctorspeciality where id = ?");
            ps.setInt(1, b);
            a = ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Admin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }
    
    public int updatepeciality(int b, String c)
    {
        int a = 0;
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("update doctorspeciality set name = ? where id = ?");
            ps.setString(1, c);
            ps.setInt(2, b);
            a = ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Admin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }
    
    public int addtest(String b, String c)
    {
        int a = 0;
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("insert into test(name, fee) values(?, ?)");
            ps.setString(1, b);
            ps.setString(2, c);
            a = ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Admin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }
    
    public int deletetest(int b)
    {
        int a = 0;
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("delete from test where id = ?");
            ps.setInt(1, b);
            a = ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Admin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }
    
    public int updatetest(int b, String c, String d)
    {
        int a = 0;
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("update test set name = ?, fee = ? where id = ?");
            ps.setString(1, c);
            ps.setString(2, d);
            ps.setInt(3, b);
            a = ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Admin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }
      
    public int updatedoctor(GS b)
    {
        int a = 0;
        try{
            if(b.getPassword() != null)
            {
                PreparedStatement ps = con.createConnection().prepareStatement("update doctor set name = ?, username = ?, Speciality = ?, password = ?, salt = ? where id = ?");
                ps.setString(1, b.getDrname());
                ps.setString(2, b.getUname());
                ps.setString(3, b.getDrspeciality());
                ps.setBytes(4, b.getPassword());
                ps.setBytes(5, b.getSalt());
                ps.setInt(6, b.getDid());
                a = ps.executeUpdate();
            }
            if(b.getPassword() == null)
            {
                PreparedStatement ps = con.createConnection().prepareStatement("update doctor set name = ?, username = ?, Speciality = ? where id = ?");
                ps.setString(1, b.getDrname());
                ps.setString(2, b.getUname());
                ps.setString(3, b.getDrspeciality());
                
                ps.setInt(4, b.getDid());
                a = ps.executeUpdate();
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Admin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }
    
    public int deactivatedoctor(int b)
    {
        int a = 0;
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("update doctor set accstatus = ? where id = ?");
            ps.setInt(1, 1);
            ps.setInt(2, b);
            a = ps.executeUpdate();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(Admin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }
    
    public int updatestaff(GS b)
    {
        int a = 0;
        try{
            if(b.getPassword() != null)
            {
                PreparedStatement ps = con.createConnection().prepareStatement("update staff set username = ?, password = ?, salt = ? where id = ?");
                
                ps.setString(1, b.getUname());
                
                ps.setBytes(2, b.getPassword());
                ps.setBytes(3, b.getSalt());
                ps.setInt(4, b.getDid());
                a = ps.executeUpdate();
            }
            if(b.getPassword() == null)
            {
                PreparedStatement ps = con.createConnection().prepareStatement("update staff set username = ? where id = ?");
               
                ps.setString(1, b.getUname());
                
                
                ps.setInt(2, b.getDid());
                a = ps.executeUpdate();
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Admin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }
    
    public int deactivatestaff(int b)
    {
        int a = 0;
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("update staff set accstatus = ? where id = ?");
            ps.setInt(1, 1);
            ps.setInt(2, b);
            a = ps.executeUpdate();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(Admin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }
    
    public int updateuser(GS b)
    {
        int a = 0;
        try{
            if(b.getPassword() != null)
            {
                PreparedStatement ps = con.createConnection().prepareStatement("update users set email = ?, password = ?, salt = ? where userid = ?");
                
                ps.setString(1, b.getUname());
                
                ps.setBytes(2, b.getPassword());
                ps.setBytes(3, b.getSalt());
                ps.setInt(4, b.getDid());
                a = ps.executeUpdate();
            }
            if(b.getPassword() == null)
            {
                PreparedStatement ps = con.createConnection().prepareStatement("update users set email = ? where userid = ?");
               
                ps.setString(1, b.getUname());
                
                
                ps.setInt(2, b.getDid());
                a = ps.executeUpdate();
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Admin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }
    
    public int deactivateuser(int b)
    {
        int a = 0;
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("update users set accstatus = ? where userid = ?");
            ps.setInt(1, 1);
            ps.setInt(2, b);
            a = ps.executeUpdate();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(Admin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }
    
    public int totaldoctors()
    {
        int count = 0;
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("Select count(id) from doctor where accstatus = ?");
            ps.setInt(1, 0);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                count = rs.getInt(1);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Admin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
    
    public int totalpatients()
    {
        int count = 0;
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("Select count(userid) from users where accstatus = ? and userid != -999");
            ps.setInt(1, 0);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                count = rs.getInt(1);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Admin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
    
    public int totalappointments()
    {
        int count = 0;
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("Select count(id) from patient_appointment where cancel = ?");
            ps.setInt(1, 0);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                count = rs.getInt(1);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Admin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
    
    public int totalstaff()
    {
        int count = 0;
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("Select count(id) from staff where accstatus = ?");
            ps.setInt(1, 0);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                count = rs.getInt(1);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Admin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
    
    public int appointmentearnings()
    {
        int earning = 0;
        try
        {
            PreparedStatement ps = con.createConnection().prepareStatement("select sum(appointmentearning + 0) from earnings");
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                earning = rs.getInt(1);
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Admin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return earning;
    }
    
    public int labearnings()
    {
        int earning = 0;
        try
        {
            PreparedStatement ps = con.createConnection().prepareStatement("select sum(labearning + 0) from earnings");
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                earning = rs.getInt(1);
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Admin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return earning;
    }
    
    public List<GS> adminstaff(){
        List<GS> list = new ArrayList<GS>();
        try {
            
            PreparedStatement ps = con.createConnection().prepareStatement("select id, username, piccode, accstatus, concat(firstname,' ',lastname) from staff");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                GS a = new GS();
                a.setSid(rs.getInt(1));
                a.setUname(rs.getString(2));
                a.setPiccode(rs.getString(3));
                a.setStatus(rs.getInt(4));
                a.setFname(rs.getString(5));
                list.add(a);
            }
            
                          
                    
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Appointment.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return list;
    }
    
    public int nolabappointments(){
        int a = 0;
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("select count(lid) from labappointment where cancel = 0");
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                a = rs.getInt(1);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Admin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }
    
    public int activateuser(int b)
    {
        int a = 0;
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("update users set accstatus = ? where userid = ?");
            ps.setInt(1, 0);
            ps.setInt(2, b);
            a = ps.executeUpdate();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(Admin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }
    
    public int activatestaff(int b)
    {
        int a = 0;
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("update staff set accstatus = ? where id = ?");
            ps.setInt(1, 0);
            ps.setInt(2, b);
            a = ps.executeUpdate();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(Admin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }
    
    public int activatedoctor(int b)
    {
        int a = 0;
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("update doctor set accstatus = ? where id = ?");
            ps.setInt(1, 0);
            ps.setInt(2, b);
            a = ps.executeUpdate();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(Admin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }
    
    
}
