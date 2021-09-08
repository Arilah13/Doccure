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
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author rilah
 */
public class User extends Appointment{
    DBCon con = new DBCon();
    
    /**
     *
     * @param c
     * @return
     */
//    public int registerUser(GS c){//Create
//       int x = 0;
//        
//        try {
//            PreparedStatement ps = con.createConnection().prepareStatement("insert into users(username, fname, lname, email, nic, dob, mobilenumber, password, Salt) values(?, ?, ?, ?, ?, ?, ?, ?, ?)");
//            ps.setString(1, c.getUname());
//            ps.setString(2, c.getFname());
//            ps.setString(3, c.getLname());
//            ps.setString(4, c.getEmail());
//            ps.setString(5, c.getNic());
//            ps.setString(6, c.getDob());
//            ps.setString(7, c.getMobilenumber());
//            ps.setBytes(8, c.getPassword());
//            ps.setBytes(9, c.getSalt());
//            
//            x = ps.executeUpdate();
//            
//           
//        } catch (ClassNotFoundException | SQLException e) {
//        }
//        
//        return x;
//    }
    
    public boolean verifyUser(String email, String password) throws NoSuchAlgorithmException, InvalidKeySpecException{//Read
        boolean verified = false;
        
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("select * from users where email = ? ");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next() && authenticate(password, rs.getBytes("password"), rs.getBytes("Salt"))){
                verified = true;
            }
            
            
            
        }catch(ClassNotFoundException | SQLException e){
        }
        
        return verified;
    }
    
    public boolean activeUser(String email, String password) throws NoSuchAlgorithmException, InvalidKeySpecException{//Read
        boolean verified = false;
        
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("select * from users where email = ? ");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next() && authenticate(password, rs.getBytes("password"), rs.getBytes("Salt")) && rs.getInt(13)==0){
                verified = true;
            }
            
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDateTime now = LocalDateTime.now();
            String date = dtf.format(now);
            Date date1 = Date.valueOf(date);
            PreparedStatement ps1 = con.createConnection().prepareStatement("update users set logindate = ? where email = ?");
            ps1.setDate(1, date1);
            ps1.setString(2, email);
            ps1.executeUpdate();
            
        }catch(ClassNotFoundException | SQLException e){
        }
        
        return verified;
    }
    
    public int getUserid(String email, String password) throws NoSuchAlgorithmException, InvalidKeySpecException{
        int uid = 0;
    
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("select * from users where email = ? ");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next() && authenticate(password, rs.getBytes("password"), rs.getBytes("Salt")) ){
                uid = rs.getInt(1);
                
            }
        }
        catch(ClassNotFoundException | SQLException e){
            
        }
        
        return uid;
    }
    
    /**
     *
     * @return
     * @throws NoSuchAlgorithmException
     */
    
    
    public String getEmail(int uid)
   {
       String email = null;
       try{
           PreparedStatement ps = con.createConnection().prepareStatement("select email from users where userid = ?");
           ps.setInt(1, uid);
           ResultSet rs = ps.executeQuery();
           while(rs.next())
           {
               email = rs.getString(1);
           }
       } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Appointment.class.getName()).log(Level.SEVERE, null, ex);
        }
        return email;
   }
    
    public List<GS> getuserdetails(int id)
    {
        List<GS> list = new ArrayList();
        try
        {
            PreparedStatement ps = con.createConnection().prepareStatement("select * from users where userid = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {               
                GS a = new GS();
                a.setUname(rs.getString(2));
                a.setEmail(rs.getString(5));
                a.setFname(rs.getString(3));
                a.setLname(rs.getString(4));
                a.setMobilenumber(rs.getString(7));               
                a.setDate(rs.getString(6));
                a.setBlood(rs.getString(11));
                list.add(a);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Staff.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public String getusername(int id)
    {
        String name = null;
        try
        {            
            PreparedStatement ps = con.createConnection().prepareStatement("select lname from users where userid = ?");
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
    
    public String getpic(int id) {
        String code = null;
        try
        {
            PreparedStatement ps = con.createConnection().prepareStatement("select piccode from users where userid = ?");
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
    
    public String getname(int id){
        String code = null;
        try
        {
            PreparedStatement ps = con.createConnection().prepareStatement("select concat(fname,' ',lname) from users where userid = ?");
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
    
    
    
    public int adduser(GS a)
    {
        int x = 0;
        try {
            PreparedStatement ps = con.createConnection().prepareStatement("insert into users(email , password, Salt) values(?, ?, ?)");
            ps.setString(1, a.getEmail());
            ps.setBytes(2, a.getPassword());
            ps.setBytes(3, a.getSalt());
            x = ps.executeUpdate();
            
            PreparedStatement ps2 = con.createConnection().prepareStatement("select patient from register where date = ?");
            ps2.setDate(1, Date.valueOf(java.time.LocalDate.now()));
            ResultSet rs2 = ps2.executeQuery();
            if(rs2.next())
            {
                  int staff1 = rs2.getInt(1);
                  int count = staff1 + 1;
                  PreparedStatement ps3 = con.createConnection().prepareStatement("update register set patient = ? where date = ?");
                  ps3.setInt(1, count);
                  ps3.setDate(2, Date.valueOf(java.time.LocalDate.now()));
                  ps3.executeUpdate();
              }
              else if(!rs2.next())
              {
                  PreparedStatement ps3 = con.createConnection().prepareStatement("insert into register(patient, date) values(?, ?)");
                  ps3.setInt(1, 1);
                  ps3.setDate(2, Date.valueOf(java.time.LocalDate.now()));
                  ps3.executeUpdate();
              }
            
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return x;
    }
    
    public String getuserphone(int id)
    {
        String mobile = null;
        try {
            PreparedStatement ps = con.createConnection().prepareStatement("select mobilenumber from users where userid = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                mobile = rs.getString(1);
            }
            
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
       return mobile; 
    }
}
