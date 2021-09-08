/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

/**
 *
 * @author rilah
 */
public class Doctor extends Appointment{
    DBCon con = new DBCon();
    
    public int registerDoctor(GS d){//Create
       int x = 0;
               
        try {
            
            PreparedStatement ps = con.createConnection().prepareStatement("insert into doctor(name, Speciality, password, salt) values(?, ?, ?, ?)");
            ps.setString(1, d.getName());
            ps.setString(2, d.getSpeciality());
            ps.setBytes(3, d.getPassword());
            ps.setBytes(4, d.getSalt());
            
            
            x = ps.executeUpdate();
            
           
        } catch (ClassNotFoundException | SQLException e) {
        }
        
        return x;
    }
    
    public boolean verifyDoctor(String id, String password) throws NoSuchAlgorithmException, InvalidKeySpecException{//Read
        boolean verified = false;
        int status = 0;
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("select * from doctor where username = ? ");
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            
            
            if(rs.next() && authenticate(password, rs.getBytes("password"), rs.getBytes("salt")) ){
                verified = true;
            }
            
            
        }catch(ClassNotFoundException | SQLException e){
        }
        
        return verified;
    }
    
    public boolean activeDoctor(String id, String password) throws NoSuchAlgorithmException, InvalidKeySpecException{//Read
        boolean verified = false;
        int status = 0;
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("select * from doctor where username = ? ");
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            
            
            if(rs.next() && authenticate(password, rs.getBytes("password"), rs.getBytes("salt")) && rs.getInt(13)==0){
                verified = true;
            }
            
            
        }catch(ClassNotFoundException | SQLException e){
        }
        
        return verified;
    }
    
    

   public int getDoctorId(String id){
       int Id = 0;
       try{
           PreparedStatement ps = con.createConnection().prepareStatement("select id from doctor where username = ?");
           ps.setString(1, id);
           ResultSet rs = ps.executeQuery();
           while(rs.next()){
               Id = rs.getInt(1);
           }
       } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Staff.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Id;
   }
   
   public boolean updateDoctorDetails(GS a){
       boolean b = false;
       byte[] pass = a.getPassword();
       try{
           if(pass != null)
           {
              PreparedStatement ps = con.createConnection().prepareStatement("update doctor set name = ?, username = ? , speciality = ? , password = ? , Salt = ? where id = ?");
              ps.setString(1, a.getDrname());
              ps.setString(2, a.getUname());
              ps.setString(3, a.getDrspeciality());
              ps.setBytes(4, a.getPassword());
              ps.setBytes(5, a.getSalt());
              ps.setInt(6, a.getDid());
              ps.executeUpdate();
              b = true;
               
           }
           else
           {
              PreparedStatement ps = con.createConnection().prepareStatement("update doctor set name = ?, username = ? , speciality = ? where id = ?");
              ps.setString(1, a.getDrname());
              ps.setString(2, a.getUname());
              ps.setString(3, a.getDrspeciality());
              ps.setInt(4, a.getDid());
              ps.executeUpdate();
              b = true;
           }
       } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(Doctor.class.getName()).log(Level.SEVERE, null, ex);
        }
       return b;
   }
 
   public List<GS> getlabs(int did){
    List<GS> list = new ArrayList<GS>();
    List<GS> list1 = new ArrayList<GS>();
    
    try{
//    PreparedStatement ps2 = con.createConnection().prepareStatement("select id from doctor where username = ?");
//    ps2.setString(1, uname);
//    ResultSet rs2 = ps2.executeQuery();
//    while(rs2.next())
//    {
//        did = rs2.getInt(1);
//    }
    PreparedStatement ps = con.createConnection().prepareStatement("select * from labappointment where Report_status = ? and cancel = ? and drid = ?");
    ps.setInt(1, 1);
    ps.setInt(2, 0);
    ps.setInt(3, did);
    ResultSet rs = ps.executeQuery();
    while(rs.next())
    {
            GS a = new GS();
            a.setTestid(rs.getInt(1));
            a.setTestname(rs.getString(2));
            a.setUid(rs.getInt(3));
            a.setDate(rs.getString(4));
            a.setBlob(rs.getBlob(7));
            a.setTesttime(rs.getString(5));
            list.add(a);
        
    }
    PreparedStatement ps1 = con.createConnection().prepareStatement("select CONCAT(fname,' ', lname), piccode from users where userid = ?");
    for(int i=0; i<list.size(); i++)
    {
        ps1.setInt(1, list.get(i).getUid());
        ResultSet rs1 = ps1.executeQuery();
        while(rs1.next())
        {
            GS a = new GS();
            a.setUname(rs1.getString(1));
            a.setTestid(list.get(i).getTestid());
            a.setTestname(list.get(i).getTestname());
            a.setUid(list.get(i).getUid());
            a.setDate(list.get(i).getDate());
            a.setBlob(list.get(i).getBlob());
            a.setTesttime(list.get(i).getTesttime());
            a.setPiccode(rs1.getString(2));
            list1.add(a);
        }
    }
    
    }   
    catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Doctor.class.getName()).log(Level.SEVERE, null, ex);
        }
    return list1;
}
   
   public List<GS> getappointments(int did){
    List<GS> list = new ArrayList<GS>();
    
    
    try{
//    PreparedStatement ps2 = con.createConnection().prepareStatement("select id from doctor where username = ?");
//    ps2.setString(1, uname);
//    ResultSet rs2 = ps2.executeQuery();
//    while(rs2.next())
//    {
//        did = rs2.getInt(1);
//    }
    PreparedStatement ps = con.createConnection().prepareStatement("select * from doctor_availability where did = ?");
    ps.setInt(1, did);
    ResultSet rs = ps.executeQuery();
    while(rs.next())
    {
            GS a = new GS();
            a.setDate(rs.getDate(3).toString());
            a.setDay(rs.getString(5));
            a.setTime(rs.getString(4));
            a.setSlot(rs.getInt(6));
            a.setStatus(rs.getInt(8));
            a.setAid(rs.getInt(1));
            list.add(a);
        
    }
    
    
    }   
    catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Doctor.class.getName()).log(Level.SEVERE, null, ex);
        }
    return list;
}
   
   
   public List<GS> todayappointment(int ddid){
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
        
        int aid = 0;
        int did = 0;
        int ano = 0;
        int id = 0;
        int uid = 0;
        int c = 0;
        String delay = null;
        int Cstat = 0; 
        
        try{
            java.util.Date date1 = new java.util.Date();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date sqldate = Date.valueOf(formatter.format(date1));
            PreparedStatement ps3 = con.createConnection().prepareStatement("select aid from doctor_availability where date = ? and did = ?");
            ps3.setDate(1, sqldate);
            ps3.setInt(2, ddid);
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
                Cstat = rs.getInt(6);               
                list3.add(ano);
                list4.add(id);
                list5.add(uid);
                list6.add(delay);
                list7.add(rs.getInt(5));
                list8.add(Cstat);
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
            
            PreparedStatement ps2 = con.createConnection().prepareStatement("select name, Speciality from doctor where id = ?");
            for(int j=0; j<list9.size(); j++)
            {
            ps2.setInt(1, list9.get(j));
            ResultSet rs2 = ps2.executeQuery();
            while(rs2.next()){
                name.add(rs2.getString(1));
                speciality.add(rs2.getString(2));
                
            }}
            PreparedStatement ps7 = con.createConnection().prepareStatement("select fname, email, piccode from users where userid = ?");
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
                 a.setFname(username.get(n));
                 a.setEmail(email.get(n));
                 a.setStatus(list8.get(n));
                 a.setPiccode(piccode.get(n));
                 list.add(a);
            }}
           
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(Appointment.class.getName()).log(Level.SEVERE, null, ex);
        } 
        return list;
    }
   
   public List<GS> uappointment(int ddid){
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
        
        int aid = 0;
        int did = 0;
        int ano = 0;
        int id = 0;
        int uid = 0;
        int c = 0;
        String delay = null;
        int Cstat = 0; 
        
        try{
            java.util.Date date1 = new java.util.Date();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date sqldate = Date.valueOf(formatter.format(date1));
            PreparedStatement ps3 = con.createConnection().prepareStatement("select aid from doctor_availability where date > ? and did = ?");
            ps3.setDate(1, sqldate);
            ps3.setInt(2, ddid);
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
                Cstat = rs.getInt(6);               
                list3.add(ano);
                list4.add(id);
                list5.add(uid);
                list6.add(delay);
                list7.add(rs.getInt(5));
                list8.add(Cstat);
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
            
            PreparedStatement ps2 = con.createConnection().prepareStatement("select name, Speciality from doctor where id = ?");
            for(int j=0; j<list9.size(); j++)
            {
            ps2.setInt(1, list9.get(j));
            ResultSet rs2 = ps2.executeQuery();
            while(rs2.next()){
                name.add(rs2.getString(1));
                speciality.add(rs2.getString(2));
                
            }}
            PreparedStatement ps7 = con.createConnection().prepareStatement("select fname, email, piccode from users where userid = ?");
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
                 a.setFname(username.get(n));
                 a.setEmail(email.get(n));
                 a.setStatus(list8.get(n));
                 a.setPiccode(piccode.get(n));
                 list.add(a);
            }}
           
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(Appointment.class.getName()).log(Level.SEVERE, null, ex);
        } 
        return list;
    }
   
   public int nopatients(int did){
        int count = 0;
        ArrayList<Integer> list = new ArrayList<Integer>();
        ArrayList<Integer> list1 = new ArrayList<Integer>();
        
        try {
            PreparedStatement ps1 = con.createConnection().prepareStatement("SELECT aid from doctor_availability where did = ?");
            ps1.setInt(1, did);
            ResultSet rs1 = ps1.executeQuery();
            while(rs1.next())
            {
                list.add(rs1.getInt(1));
            }
            PreparedStatement ps2 = con.createConnection().prepareStatement("SELECT COUNT(distinct uid) from patient_appointment where aid = ? and cancel = ?");
            for(int i=0; i<list.size(); i++)
            {
                ps2.setInt(1, list.get(i));
                ps2.setInt(2, 0);
                ResultSet rs2 = ps2.executeQuery();
                while(rs2.next())
                {
                    list1.add(rs2.getInt(1));
                }
            }
            
            for(int j =0; j<list1.size(); j++)
            {
                count += list1.get(j);
            }
            
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(Staff.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
   
   public int notodaypatients(int did){
        List<Integer> count = new ArrayList<Integer>();
        List<Integer> aid = new ArrayList<Integer>();
        int sum = 0;
        java.util.Date date1 = new java.util.Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date sqldate = Date.valueOf(formatter.format(date1));
        try {
            
            PreparedStatement ps1 = con.createConnection().prepareStatement("select aid from doctor_availability where date = ? and did = ?");
            ps1.setDate(1, sqldate);
            ps1.setInt(2, did);
            ResultSet rs1 = ps1.executeQuery();
            while(rs1.next())
            {
                aid.add(rs1.getInt(1));
            }
            PreparedStatement ps = con.createConnection().prepareStatement("SELECT COUNT(distinct uid) FROM patient_appointment WHERE cancel = ? and aid = ?");
            for(int i=0; i<aid.size(); i++)
            {
            ps.setInt(1, 0);
            ps.setInt(2, aid.get(i));
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                count.add(rs.getInt(1));
            }
            }
            
            for(int j=0; j<count.size(); j++)
            {
                sum += count.get(j);
            }
            
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(Staff.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sum;
    }
   
   public int notodayappointments(int did){
        List<Integer> count = new ArrayList<Integer>();
        List<Integer> aid = new ArrayList<Integer>();
        int sum = 0;
        java.util.Date date1 = new java.util.Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date sqldate = Date.valueOf(formatter.format(date1));
        try {
            
            PreparedStatement ps1 = con.createConnection().prepareStatement("select aid from doctor_availability where date = ? and did = ?");
            ps1.setDate(1, sqldate);
            ps1.setInt(2, did);
            ResultSet rs1 = ps1.executeQuery();
            while(rs1.next())
            {
                aid.add(rs1.getInt(1));
            }
            PreparedStatement ps = con.createConnection().prepareStatement("SELECT COUNT(uid) FROM patient_appointment WHERE cancel = ? and aid = ?");
            for(int i=0; i<aid.size(); i++)
            {
            ps.setInt(1, 0);
            ps.setInt(2, aid.get(i));
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                count.add(rs.getInt(1));
            }
            }
            
            for(int j=0; j<count.size(); j++)
            {
                sum += count.get(j);
            }
            
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(Staff.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sum;
    }
   
   public Date todaydate()
    {
        java.util.Date date1 = new java.util.Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date sqldate = Date.valueOf(formatter.format(date1));
        return sqldate;
        
    }
   
   public String getdoctorname (int id)
    {
        String name = null;
        try
        {
            
            PreparedStatement ps = con.createConnection().prepareStatement("select name from doctor where id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {               
                    name = rs.getString(1);
                
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Staff.class.getName()).log(Level.SEVERE, null, ex);
        }
        return name;
    }
   
   
   public List<GS> getdoctordetails(int id)
    {
        List<GS> list = new ArrayList();
        try
        {
            PreparedStatement ps = con.createConnection().prepareStatement("select * from doctor where id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {               
                GS a = new GS();
                a.setUname(rs.getString(3));
                a.setEmail(rs.getString(11));
                a.setFname(rs.getString(1));
                a.setDrspeciality(rs.getString(4));
                a.setMobilenumber(rs.getString(8));
                a.setGender(rs.getString(9));
                a.setDate(rs.getString(10));
                list.add(a);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Staff.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
   
   
    
    public String getpic(int id) {
        String code = null;
        try
        {
            PreparedStatement ps = con.createConnection().prepareStatement("select piccode from doctor where id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                code = rs.getString(1);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return code;
    }
    
    
    
    public String getname(int id) {
        String code = null;
        try
        {
            PreparedStatement ps = con.createConnection().prepareStatement("select name from doctor where id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                code = rs.getString(1);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return code;
    }
    
    public String getspeciality(int id) {
        String code = null;
        try
        {
            PreparedStatement ps = con.createConnection().prepareStatement("select Speciality from doctor where id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                code = rs.getString(1);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return code;
    }
    
    public int getdrid(String name, String speciality)
    {
        int code = 0;
        try
        {
            PreparedStatement ps = con.createConnection().prepareStatement("select id from doctor where name = ? and Speciality = ?");
            ps.setString(1, name);
            ps.setString(2, speciality);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                code = rs.getInt(1);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return code;
    }
}
