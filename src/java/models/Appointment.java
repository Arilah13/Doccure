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
public class Appointment extends Login{
    DBCon con = new DBCon();
    
    public List<GS> getdoctorbyspecialityname(String speciality, String name) throws ClassNotFoundException, ParseException{
        List<GS> list = new ArrayList<GS>();
        String piccode = null;
        try{
            int did = 0;
            PreparedStatement ps = con.createConnection().prepareStatement("Select id, piccode from doctor WHERE Speciality = ? and name = ?");
            ps.setString(1, speciality);
            ps.setString(2, name);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                did = rs.getInt(1);
                piccode = rs.getString(2);
                }
            String date1 = java.time.LocalDate.now().format(DateTimeFormatter.ISO_DATE);
            java.sql.Date date = java.sql.Date.valueOf(date1);
            PreparedStatement ps1 = con.createConnection().prepareStatement("Select * from doctor_availability WHERE did = ? and date > ? and status = ?");
            ps1.setInt(1, did);
            ps1.setDate(2, date);
            ps1.setInt(3, 0);
            ResultSet rs1 = ps1.executeQuery();
            while(rs1.next()){
                GS a = new GS();
                a.setDid(rs1.getInt(2));
                a.setDate(rs1.getString(3));
                a.setTime(rs1.getString(4));
                a.setDay(rs1.getString(5));
                a.setAid(rs1.getInt(1));
                a.setSlot(rs1.getInt(7));
                a.setAslot(rs1.getInt(6));
                a.setPiccode(piccode);
                if(rs1.getInt(6) == 0)
                {
                    a.setStatus(0);
                }
                else
                {
                    a.setStatus(1);
                }
                list.add(a);
            }
            
        }
        catch(SQLException e){
            
        }
        return list;
    }
    

    public int getapointNO(int uid, int aid) throws SQLException, ClassNotFoundException{
        int ano = 0;
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("select appointmentno from patient_appointment where aid = ? and cancel = 0");
            ps.setInt(1, aid);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next() == false){
                PreparedStatement ps1 = con.createConnection().prepareStatement("insert into patient_appointment(uid, aid, appointmentno) values(?, ?, ?)");
                ps1.setInt(1, uid);
                ps1.setInt(2, aid);
                ps1.setInt(3, 1);
                ps1.executeUpdate();
                ano = 1;
                PreparedStatement ps2 = con.createConnection().prepareStatement("update doctor_availability set slot= slot -1, activeslot= activeslot + 1 where aid = ?");
                ps2.setInt(1, aid);
                ps2.executeUpdate();
            }
            else{
                PreparedStatement ps1 = con.createConnection().prepareStatement("select appointmentno from patient_appointment where aid = ? and cancel = 0");
                ps1.setInt(1, aid);           
                ResultSet rs1 = ps1.executeQuery();
                while(rs1.next()){               
                   ano = rs1.getInt(1);
                }
                ano = ano+1;
                PreparedStatement ps2 = con.createConnection().prepareStatement("insert into patient_appointment(uid, aid, appointmentno) values(?, ?, ?)");
                ps2.setInt(1, uid);
                ps2.setInt(2, aid);
                ps2.setInt(3, ano);                
                ps2.executeUpdate();
                PreparedStatement ps3 = con.createConnection().prepareStatement("update doctor_availability set slot= slot -1, activeslot= activeslot + 1 where aid = ?");
                ps3.setInt(1, aid);
                ps3.executeUpdate();
            }
                                             
        } 
        catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Appointment.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ano;
        
    }
    
    public boolean getAppointmentSlot(GS a){
        boolean result = false;
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("select MAX(slot) from labappointment where date = ? and testname = ?");
            ps.setString(1, a.getTestdate());
            ps.setString(2, a.getTestdate());
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
            if(rs.getInt(1)<=50){
               result = true; 
            }
                }           
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Appointment.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
    
    public int getAppointmentSlotNo(GS a) throws SQLException{
        int slot = 0;
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("select MAX(slot) from labappointment where date = ? and testname = ?");
            ps.setString(1, a.getTestdate());
            ps.setString(2, a.getTestname());
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                if(rs.getInt(1) == 0){
                    slot = 1;
                }
                else{
                    slot = rs.getInt(1);
                    slot = slot + 1;
                }
            }
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Appointment.class.getName()).log(Level.SEVERE, null, ex);
        }
        return slot;
    }
    
    public String getAppointmentTime(GS a) throws ParseException{
       String Time = null;
       Appointment appointment = new Appointment();
       try{
           PreparedStatement ps = con.createConnection().prepareStatement("select MAX(time) from labappointment where date = ? and testname = ?");
           ps.setString(1, a.getTestdate());
           ps.setString(2, a.getTestname());
           ResultSet rs = ps.executeQuery();
           while(rs.next()){
                   Time = rs.getString(1);
                   if(Time == "" || Time == null){
                       Time = "08:00";
                       a.setTesttime(Time);
                   }
                   else{
                       String myTime = Time;
                       SimpleDateFormat df = new SimpleDateFormat("HH:mm");
                       java.util.Date d = df.parse(myTime);
                       Calendar cal = Calendar.getInstance();
                       cal.setTime(d);
                       cal.add(Calendar.MINUTE, 10);
                       Time = df.format(cal.getTime());
                       a.setTesttime(Time);
                       
                   }
               }
           }
        catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(Appointment.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Time;
    }
    
    public List<String> getdoctorname() throws ClassNotFoundException{
        List<String> list = new ArrayList<String>();
        
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("Select name from doctor ");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                list.add(rs.getString(1));
            }
            
        }
        catch(SQLException e){
            
        }
        return list;
    }
    
    public List<String> getdoctornamewithspeciality() throws ClassNotFoundException{
        List<String> list = new ArrayList<String>();
        
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("Select CONCAT(name,' ',Speciality) from doctor ");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                list.add(rs.getString(1));
            }
            
        }
        catch(SQLException e){
            
        }
        return list;
    }
    
    public List<GS> showdoctorname(String name){
        List<GS> list = new ArrayList<GS>();
        try{
            
            PreparedStatement ps = con.createConnection().prepareStatement("select Speciality, piccode from doctor where name = ?");
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                GS d = new GS();
                d.setSpeciality(rs.getString(1));
                d.setName(name);
                d.setPiccode(rs.getString(2));
                list.add(d);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Appointment.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public List<GS> showdoctorspeciality(String speciality){
        List<GS> list = new ArrayList<GS>();
        try{
            
            PreparedStatement ps = con.createConnection().prepareStatement("select name, piccode from doctor where Speciality = ?");
            ps.setString(1, speciality);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                GS d = new GS();
                d.setName(rs.getString(1));
                d.setSpeciality(speciality);
                d.setPiccode(rs.getString(2));
                list.add(d);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Appointment.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public List<GS> showall(String name, String speciality, String date){
        List<Integer> list1 = new ArrayList<Integer>();
        List<GS> list = new ArrayList<GS>();
        try{
            
            int did = 0;
            Date date1 = Date.valueOf(date);
            PreparedStatement ps1= con.createConnection().prepareStatement("select DISTINCT(did) from doctor_availability where date = ? ");
            ps1.setDate(1, date1);
            
            ResultSet rs1 = ps1.executeQuery();
            while(rs1.next()){
                did = rs1.getInt(1);
                list1.add(did);
            }
            for(int i=0; i<list1.size(); i++){
            PreparedStatement ps = con.createConnection().prepareStatement("select Speciality, name, piccode from doctor where id = ? and name = ? and Speciality = ?");
            ps.setInt(1, list1.get(i));
            ps.setString(2, name);
            ps.setString(3, speciality);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                GS d = new GS();
                d.setSpeciality(rs.getString(1));
                d.setName(rs.getString(2));
                d.setPiccode(rs.getString(3));
                list.add(d);
            }
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Appointment.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
        
    public List<GS> showdoctordate(String date){
        List<Integer> list1 = new ArrayList<Integer>();
        List<GS> list = new ArrayList<GS>();
        try{
            
            int did = 0;
            java.sql.Date date1 = java.sql.Date.valueOf(date);
            PreparedStatement ps1= con.createConnection().prepareStatement("select DISTINCT(did) from doctor_availability where date = ?");
            ps1.setDate(1, date1);
            ResultSet rs1 = ps1.executeQuery();
            while(rs1.next()){
                did = rs1.getInt(1);
                list1.add(did);
            }
            for(int i=0; i<list1.size(); i++){
            PreparedStatement ps = con.createConnection().prepareStatement("select Speciality, name, piccode from doctor where id = ?");
            ps.setInt(1, list1.get(i));
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                GS d = new GS();
                d.setSpeciality(rs.getString(1));
                d.setName(rs.getString(2));
                d.setPiccode(rs.getString(3));
                list.add(d);
            }
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Appointment.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public List<GS> showdoctornamespeciality(String name, String speciality){
        List<GS> list = new ArrayList<GS>();
        try{
            
            PreparedStatement ps = con.createConnection().prepareStatement("select name, Speciality, piccode from doctor where name = ? and Speciality = ?");
            ps.setString(1, name);
            ps.setString(2, speciality);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                GS d = new GS();
                d.setSpeciality(rs.getString(2));
                d.setName(rs.getString(1));
                d.setPiccode(rs.getString(3));
                list.add(d);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Appointment.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public List<GS> showdoctordatename(String date, String name){
        List<Integer> list1 = new ArrayList<Integer>();
        List<GS> list = new ArrayList<GS>();
        try{
            
            int did = 0;
            Date date1 = Date.valueOf(date);
            PreparedStatement ps1= con.createConnection().prepareStatement("select DISTINCT(did) from doctor_availability where date = ?");
            ps1.setDate(1, date1);
            ResultSet rs1 = ps1.executeQuery();
            while(rs1.next()){
                did = rs1.getInt(1);
                list1.add(did);
            }
            for(int i=0; i<list1.size(); i++){
            PreparedStatement ps = con.createConnection().prepareStatement("select Speciality, name, piccode from doctor where id = ? and name = ?");
            ps.setInt(1, list1.get(i));
            ps.setString(2, name);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                GS d = new GS();
                d.setSpeciality(rs.getString(1));
                d.setName(rs.getString(2));
                d.setPiccode(rs.getString(3));
                list.add(d);
            }
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Appointment.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public List<GS> showdoctordatespeciality(String date, String speciality){
        List<Integer> list1 = new ArrayList<Integer>();
        List<GS> list = new ArrayList<GS>();
        try{
            
            int did = 0;
            Date date1 = Date.valueOf(date);
            PreparedStatement ps1= con.createConnection().prepareStatement("select DISTINCT(did) from doctor_availability where date = ?");
            ps1.setDate(1, date1);
            ResultSet rs1 = ps1.executeQuery();
            while(rs1.next()){
                did = rs1.getInt(1);
                list1.add(did);
            }
            for(int i=0; i<list1.size(); i++){
            PreparedStatement ps = con.createConnection().prepareStatement("select Speciality, name, piccode from doctor where id = ? and Speciality = ?");
            ps.setInt(1, list1.get(i));
            ps.setString(2, speciality);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                GS d = new GS();
                d.setSpeciality(rs.getString(1));
                d.setName(rs.getString(2));
                d.setPiccode(rs.getString(3));
                list.add(d);
            }
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Appointment.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public List<GS> getdoctorbyspecialitynamedate(String speciality, String name, String date) throws ClassNotFoundException{
        List<GS> list = new ArrayList<GS>();
        Date date1 = Date.valueOf(date);
        String piccode = null;
        try{
            int did = 0;
            PreparedStatement ps = con.createConnection().prepareStatement("Select id, piccode from doctor WHERE Speciality = ? and name = ?");
            ps.setString(1, speciality);
            ps.setString(2, name);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                did = rs.getInt(1);
                piccode = rs.getString(2);
                }
            PreparedStatement ps1 = con.createConnection().prepareStatement("Select * from doctor_availability WHERE did = ? and date = ? and status = ?");
            ps1.setInt(1, did);
            ps1.setDate(2, date1);
            ps1.setInt(3, 0);
            ResultSet rs1 = ps1.executeQuery();
            while(rs1.next()){
                GS a = new GS();
                a.setDid(rs1.getInt(2));
                a.setDate(rs1.getString(3));
                a.setTime(rs1.getString(4));
                a.setDay(rs1.getString(5));
                a.setAid(rs1.getInt(1));
                a.setSlot(rs1.getInt(7));
                a.setAslot(rs1.getInt(6));
                a.setPiccode(piccode);
                if(rs1.getInt(6) == 0)
                {
                    a.setStatus(0);
                }
                else
                {
                    a.setStatus(1);
                }
                list.add(a);
            }
            
        }
        catch(SQLException e){
            
        }
        return list;
    }
    
    public List<GS> showallmyappointment(int uid){
        ArrayList<GS> list = new ArrayList<GS>();
        ArrayList<Integer> list1 = new ArrayList<Integer>();
        ArrayList<Integer> list2 = new ArrayList<Integer>();
        ArrayList<Integer> list3 = new ArrayList<Integer>();
        ArrayList<String> name = new ArrayList<String>();
        ArrayList<String> speciality = new ArrayList<String>();
        ArrayList<Integer> list4 = new ArrayList<Integer>();
        ArrayList<String> list5 = new ArrayList<String>();
        ArrayList<Integer> list6 = new ArrayList<Integer>();
        ArrayList<String> piccode = new ArrayList<String>();
        int aid = 0;
        int did = 0;
        int ano = 0;
        int id = 0;
        String delay = "No Delay";
        
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("select aid,appointmentno,id,delay,cancel from patient_appointment where uid = ? ");
            ps.setInt(1, uid);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){        
                aid = rs.getInt(1);
                ano = rs.getInt(2);
                id = rs.getInt(3);
                delay = rs.getString(4);
                list1.add(aid);
                list3.add(ano);
                list4.add(id);
                list5.add(delay);
                list6.add(rs.getInt(5));
                
            }
            PreparedStatement ps3 = con.createConnection().prepareStatement("select did from doctor_availability where aid = ?");
            for(int i=0; i<list1.size();i++)
            {
            ps3.setInt(1, list1.get(i));
            ResultSet rs3 = ps3.executeQuery();
            while(rs3.next()){
                did = rs3.getInt(1);
                list2.add(did);
            }}
            PreparedStatement ps2 = con.createConnection().prepareStatement("select name, Speciality, piccode from doctor where id = ?");
            for(int j=0; j<list1.size(); j++)
            {
            ps2.setInt(1, list2.get(j));
            ResultSet rs2 = ps2.executeQuery();
            while(rs2.next()){
                name.add(rs2.getString(1));
                speciality.add(rs2.getString(2));
                piccode.add(rs2.getString(3));
            }}
            PreparedStatement ps1 = con.createConnection().prepareStatement("select * from doctor_availability where aid = ? and date >= ?");
            for(int n=0; n<list1.size(); n++)
            {
            Date date = Date.valueOf(java.time.LocalDate.now());
            ps1.setInt(1, list1.get(n));
            ps1.setDate(2, date);
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
                 a.setAid(list1.get(n));
                 a.setDelay(list5.get(n));
                 a.setStatus(list6.get(n));
                 a.setPiccode(piccode.get(n));
                 list.add(a);
            }}
           
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(Appointment.class.getName()).log(Level.SEVERE, null, ex);
        } 
        return list;
    }
    
    public boolean deleteappointment(int id){
        boolean bool = false;
        try {
            int aid = 0;
            int slot = 0;
            int activeslot = 0;
            int did = 0;
            int price = 0;
            int earning = 0;
            int totalearning = 0;
            int newearning = 0;
            int appointmentearning = 0;
            int newappointmentearning = 0;
            int newtotalearning = 0;
            Date date = null;
            PreparedStatement ps1 = con.createConnection().prepareStatement("select aid from patient_appointment where id = ?");
            ps1.setInt(1, id);
            ResultSet rs = ps1.executeQuery();
            while(rs.next()){
                aid = rs.getInt(1);
            }
            PreparedStatement ps = con.createConnection().prepareStatement("update patient_appointment set cancel = ? where id=?");
            ps.setInt(1, 1);
            ps.setInt(2, id);
            ps.executeUpdate();
            PreparedStatement ps2 = con.createConnection().prepareStatement("select slot, activeslot, did, date from doctor_availability where aid = ?");
            ps2.setInt(1, aid);
            ResultSet rs1 = ps2.executeQuery();
            while(rs1.next()){
                slot = rs1.getInt(1);
                activeslot = rs1.getInt(2);
                did = rs1.getInt(3);
                date = rs1.getDate(4);
            }
            slot = slot + 1;
            activeslot = activeslot - 1;
            PreparedStatement ps3 = con.createConnection().prepareStatement("update doctor_availability set slot = ?, activeslot = ? where aid = ?");
            ps3.setInt(1, slot);
            ps3.setInt(2, activeslot);
            ps3.setInt(3, aid);
            ps3.executeUpdate();
            
            PreparedStatement ps4 = con.createConnection().prepareStatement("select price, earnings, totalearning from doctor where id = ?");
            ps4.setInt(1, did);
            ResultSet rs4 = ps4.executeQuery();
            while(rs4.next())
            {
                price = Integer.parseInt(rs4.getString(1));
                earning = Integer.parseInt(rs4.getString(2));
                totalearning = Integer.parseInt(rs4.getString(3));
            }
            newearning = earning - price;
            newtotalearning = totalearning -(price+1000);
            PreparedStatement ps5 = con.createConnection().prepareStatement("update doctor set earnings = ?, totalearning = ?  where id = ?");
            ps5.setString(1, String.valueOf(newearning));
            ps5.setString(2, String.valueOf(newtotalearning));
            ps5.setInt(3, did);
            ps5.executeUpdate();
            PreparedStatement ps7 = con.createConnection().prepareStatement("select appointmentearning from earnings where date = ?");
            ps7.setDate(1, date);
            ResultSet rs7 = ps7.executeQuery();
            while(rs7.next())
            {
                appointmentearning = Integer.parseInt(rs7.getString(1));
            }
            newappointmentearning = appointmentearning - (price + 1000);
            PreparedStatement ps6 = con.createConnection().prepareStatement("update earnings set appointmentearning = ? where date = ?");
            ps6.setString(1, String.valueOf(newappointmentearning));
            ps6.setDate(2, date);
            ps6.executeUpdate();
            bool = true;
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Appointment.class.getName()).log(Level.SEVERE, null, ex);
        }
        return bool;
    }
    
   
    
    public static Map<String,Boolean> splitString(String reply){
        Map<String, Boolean> mapping = new HashMap<>();
        String[] mappings = reply.split(",");
        for(String s : mappings) {
            String[] parts = s.split(":");
            mapping.put(parts[0],Boolean.parseBoolean(parts[1]));
        }
        return mapping;
    }
    
    
    
   public String getdoctorfee(int did){
       String price = null;
       try{
           PreparedStatement ps = con.createConnection().prepareStatement("select price from doctor where id = ?");
           ps.setInt(1, did);
           ResultSet rs = ps.executeQuery();
           while(rs.next())
           {
               price = rs.getString(1);
           }
       } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Appointment.class.getName()).log(Level.SEVERE, null, ex);
        }
       return price;
   }
   
   public boolean increaseearning(int did, String fee, String fee1){
       boolean a = false;
       int price = 0;
       int price1 = 0;
       int earning = 0;
       int earning1 = 0;
       try{
           PreparedStatement ps1 = con.createConnection().prepareStatement("select earnings, totalearning from doctor where id = ?");
           ps1.setInt(1, did);
           ResultSet rs1 = ps1.executeQuery();
           while(rs1.next())
           {
               price = Integer.parseInt(rs1.getString(1));
               price1 = price + Integer.parseInt(fee);
               earning = Integer.parseInt(rs1.getString(2));
               earning1 = earning + Integer.parseInt(fee1);
           }
           PreparedStatement ps = con.createConnection().prepareStatement("update doctor set earnings = ?, totalearning = ? where id = ?");
           ps.setString(1, String.valueOf(price1));
           ps.setString(2, String.valueOf(earning1));
           ps.setInt(3, did);
           ps.executeUpdate();
           a = true;
       } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(Appointment.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
   }
   
   public boolean increasetotalearnings(String date, String fee){
       boolean a = false;
       int earnings = 0;
       int price = 0;
       try{
           PreparedStatement ps = con.createConnection().prepareStatement("select appointmentearning from earnings where date = ?");
           ps.setDate(1, java.sql.Date.valueOf(date));
           ResultSet rs = ps.executeQuery();
           if(rs.next())
           {
               
                earnings = Integer.parseInt(rs.getString(1));
                price = earnings + Integer.parseInt(fee);
               
               PreparedStatement ps1 = con.createConnection().prepareStatement("update earnings set appointmentearning = ? where date = ?");
               ps1.setString(1, String.valueOf(price));
               ps1.setDate(2, java.sql.Date.valueOf(date));
               ps1.executeUpdate();
               a = true;
           }
           else if(!rs.next())
           {
               PreparedStatement ps1 = con.createConnection().prepareStatement("insert into earnings(appointmentearning, date) values(?, ?) ");
               ps1.setString(1, fee);
               ps1.setDate(2, java.sql.Date.valueOf(date));
               ps1.executeUpdate();
               a = true;
           }
       } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(Appointment.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
   }
   
   
   
   public int addslot(GS a) throws ClassNotFoundException{
       int x = 0 ;
       int number = a.getNumber();
       
       try{
            PreparedStatement ps = con.createConnection().prepareStatement("select id from doctor where name = ? and Speciality = ?");
            ps.setString(1, a.getName());
            ps.setString(2, a.getSpeciality());
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                a.setDid(rs.getInt(1));
            }
            Date[] date  = new Date[2];
            
            for(int j=0; j<number; j++)
            {
            date[j] = Date.valueOf(a.getDatelist()[j]);
            }   
//            con.createConnection().setAutoCommit(false);
            PreparedStatement ps1 = con.createConnection().prepareStatement("insert into doctor_availability(did, date, time, day, slot, activeslot) values(?, ?, ?, ?, ?, ?)");
            
            for (int i=0; i<number; i++)
            {
            ps1.setInt(1, a.getDid());            
            ps1.setDate(2, date[i]);
            ps1.setString(3, a.getTimelist()[i]);
            ps1.setString(4, a.getDaylist()[i]);
            ps1.setInt(5, a.getSlotlist()[i]);
            ps1.setInt(6, 0);                        
            ps1.addBatch();
            if(i==number-1)
            {
            int[] results = ps1.executeBatch();
//            con.createConnection().commit();
            if(results.length > 0){
                x = 1;
            }
            }           
            }                        
          
       } catch (SQLException ex) {
            Logger.getLogger(Staff.class.getName()).log(Level.SEVERE, null, ex);
        }
       
       return x;
   }
   
   public List<GS> slots(){
        List<GS> list = new ArrayList<GS>();
        List<GS> list1 = new ArrayList<GS>();
        try {
            java.util.Date date1 = new java.util.Date();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date sqldate = Date.valueOf(formatter.format(date1));
            PreparedStatement ps = con.createConnection().prepareStatement("select * from doctor_availability where date >= ? ");
            ps.setDate(1, sqldate);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                GS a = new GS();
                a.setDate(rs.getDate(3).toString());
                a.setTime(rs.getString(4));
                a.setDay(rs.getString(5));
                a.setSlot(rs.getInt(6));
                a.setAslot(rs.getInt(7));
                a.setAid(rs.getInt(1));
                a.setDid(rs.getInt(2));
                a.setStatus(rs.getInt(8));
                list.add(a);
            }
            PreparedStatement ps1 = con.createConnection().prepareStatement("select name, Speciality, piccode from doctor where id = ?");
            for(int i=0; i<list.size(); i++)
            {
                ps1.setInt(1, list.get(i).getDid());
                ResultSet rs1 = ps1.executeQuery();
                while(rs1.next())
                {
                GS a = new GS();
                a.setDate(list.get(i).getDate());
                a.setTime(list.get(i).getTime());
                a.setDay(list.get(i).getDay());
                a.setSlot(list.get(i).getSlot());
                a.setAslot(list.get(i).getAslot());
                a.setAid(list.get(i).getAid());
                a.setDid(list.get(i).getDid());
                a.setDrname(rs1.getString(1));
                a.setDrspeciality(rs1.getString(2));
                a.setStatus(list.get(i).getStatus());
                a.setPiccode(rs1.getString(3));
                list1.add(a);
                }
            }
            
            
                          
                    
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Appointment.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return list1;
    } 
   
     public boolean deleteslot(int aid){
        boolean b = false;
        ArrayList<Integer> aid1 = new ArrayList();
        int did = 0, price = 0, earning = 0, totalearning = 0, newearning=0, newtotalearning = 0, count = 0;
        
        try{
            PreparedStatement ps3 = con.createConnection().prepareStatement("select did from doctor_availability where aid = ?");
            ps3.setInt(1, aid);
            ResultSet rs3 = ps3.executeQuery();
            while(rs3.next())
            {
                did = rs3.getInt(1);
            }
            
            PreparedStatement ps2 = con.createConnection().prepareStatement("select count(aid) from patient_appointment where aid = ? and cancel = ?");
            ps2.setInt(1, aid);
            ps2.setInt(2, 0);
            ResultSet rs2 = ps2.executeQuery();
            while(rs2.next())
            {
                count = rs2.getInt(1);
            }
            
            PreparedStatement ps = con.createConnection().prepareStatement("update doctor_availability set status = 1 where aid = ?");
            ps.setInt(1, aid);
            ps.executeUpdate();
            PreparedStatement ps1 = con.createConnection().prepareStatement("select aid from patient_appointment where aid = ?");
            ps1.setInt(1, aid);
            ResultSet rs1 = ps1.executeQuery();
            while(rs1.next())
            {
                aid1.add(rs1.getInt(1));
            }
            if(aid1 != null)
            {
                PreparedStatement ps5 = con.createConnection().prepareStatement("update patient_appointment set cancel = ? where aid = ?");
                for(int i=0; i<aid1.size(); i++)
                {
                    ps5.setInt(2, aid1.get(i));
                    ps5.setInt(1, 1);
                    ps5.executeUpdate();
                }
            }
            PreparedStatement ps6 = con.createConnection().prepareStatement("update doctor_availability set status = 1 where aid = ?");
            ps6.setInt(1, aid);
            ps6.executeUpdate();                      
                                              
            PreparedStatement ps4 = con.createConnection().prepareStatement("select price, earnings, totalearning from doctor where id = ?");
            ps4.setInt(1, did);
            ResultSet rs4 = ps4.executeQuery();
            while(rs4.next())
            {
                price = Integer.parseInt(rs4.getString(1));
                earning = Integer.parseInt(rs4.getString(2));
                totalearning = Integer.parseInt(rs4.getString(3));
            }
            newearning = earning - (price * count);
            newtotalearning = totalearning -((price+1000)*count);
            PreparedStatement ps5 = con.createConnection().prepareStatement("update doctor set earnings = ?, totalearning = ?  where id = ?");
            ps5.setString(1, String.valueOf(newearning));
            ps5.setString(2, String.valueOf(newtotalearning));
            ps5.setInt(3, did);
            ps5.executeUpdate();
            
            b = true;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Admin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return b;
    }
   
   public int reduceearnings(int aid)
    {
        int a = 0;
        int did = 0;
        int price = 0;
        int count = 0;
        String date = null;
        Date date1 = null;
        int earning = 0;
        int finalearning = 0;
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("select did, date from doctor_availability where aid = ?");
            ps.setInt(1, aid);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                did = rs.getInt(1);
                date = rs.getString(2);
            }
            PreparedStatement ps1 = con.createConnection().prepareStatement("select (price + 1000) from doctor where id = ?");
            ps1.setInt(1, did);
            ResultSet rs1 = ps1.executeQuery();
            while(rs1.next())
            {
                price = rs1.getInt(1);
            }
            PreparedStatement ps2 = con.createConnection().prepareStatement("select count(aid) from patient_appointment where aid = ? and cancel = ?");
            ps2.setInt(1, aid);
            ps2.setInt(2, 0);
            ResultSet rs2 = ps2.executeQuery();
            while(rs2.next())
            {
                count = rs2.getInt(1);
            }
            date1 = java.sql.Date.valueOf(date);
            PreparedStatement ps3 = con.createConnection().prepareStatement("select (appointmentearning + 0) from earnings where date = ?");
            ps3.setDate(1, date1);
            ResultSet rs3 = ps3.executeQuery();
            while(rs3.next())
            {
                earning = rs3.getInt(1);
            }
            finalearning = earning - (price*count);
            PreparedStatement ps4 = con.createConnection().prepareStatement("update earnings set appointmentearning = ? where date = ? ");
            ps4.setString(1, String.valueOf(finalearning));
            ps4.setDate(2, date1);
            a= ps4.executeUpdate();
            
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Staff.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }
   
   
   public int updateearnings(int aid, Date newdate)
   {
       int a = 0;
        int did = 0;
        int price = 0;
        int count = 0;
        String date = null;
        Date date1 = null;
        int earning = 0;
        int finalearning = 0;
        int ae = 0;
        int fae = 0;
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("select did, date from doctor_availability where aid = ?");
            ps.setInt(1, aid);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                did = rs.getInt(1);
                date = rs.getString(2);
            }
            PreparedStatement ps1 = con.createConnection().prepareStatement("select (price + 1000) from doctor where id = ?");
            ps1.setInt(1, did);
            ResultSet rs1 = ps1.executeQuery();
            while(rs1.next())
            {
                price = rs1.getInt(1);
            }
            PreparedStatement ps2 = con.createConnection().prepareStatement("select count(aid) from patient_appointment where aid = ? and cancel = ?");
            ps2.setInt(1, aid);
            ps2.setInt(2, 0);
            ResultSet rs2 = ps2.executeQuery();
            while(rs2.next())
            {
                count = rs2.getInt(1);
            }
            date1 = java.sql.Date.valueOf(date);
            PreparedStatement ps3 = con.createConnection().prepareStatement("select (appointmentearning + 0) from earnings where date = ?");
            ps3.setDate(1, date1);
            ResultSet rs3 = ps3.executeQuery();
            while(rs3.next())
            {
                earning = rs3.getInt(1);
            }
            finalearning = earning - (price*count);
            PreparedStatement ps4 = con.createConnection().prepareStatement("update earnings set appointmentearning = ? where date = ? ");
            ps4.setString(1, String.valueOf(finalearning));
            ps4.setDate(2, date1);
            ps4.executeUpdate();
            PreparedStatement ps5 = con.createConnection().prepareStatement("select (appointmentearning + 0) from earnings where date = ?");
            ps5.setDate(1, newdate);
            ResultSet rs5 = ps5.executeQuery();
            if(rs5.next())
            {
                ae = rs5.getInt(1);
                PreparedStatement ps6 = con.createConnection().prepareStatement("update earnings set appointmentearning = ? where date = ?");
                fae = ae + (price * count);
                ps6.setString(1, String.valueOf(fae));
                ps6.setDate(2, newdate);
                a = ps6.executeUpdate();
            }
            else if(!rs.next())
            {
                fae = price * count;
                PreparedStatement ps6 = con.createConnection().prepareStatement("insert into earnings(date, appointmentearning) values(?, ?)");
                ps6.setDate(1, newdate);
                ps6.setString(2, String.valueOf(fae));
                a = ps6.executeUpdate();
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Staff.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
   }
   
   
   
   
   public List getphone(int aid) {
        ArrayList<Integer> uid = new ArrayList();
        ArrayList<String> no = new ArrayList();
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("select distinct uid from patient_appointment where aid = ? and cancel = ?");
            ps.setInt(1, aid);
            ps.setInt(2, 0);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                uid.add(rs.getInt(1));
            }
            PreparedStatement ps1 = con.createConnection().prepareStatement("select mobilenumber from users where userid = ?");
            for(int i=0; i<uid.size(); i++)
            {
                ps1.setInt(1, uid.get(i));
                ResultSet rs1 = ps1.executeQuery();
                while(rs1.next())
                {
                    if(rs1.getString(1) != null)
                    {
                    no.add(rs1.getString(1));
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Staff.class.getName()).log(Level.SEVERE, null, ex);
        }
        return no;
    }
   
   public int updateslot(GS b) {
        int a = 0;
        
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("update doctor_availability SET date = ?, time = ?, slot = ? where aid = ?");
            java.sql.Date date = java.sql.Date.valueOf(b.getDate());
            ps.setDate(1, date);
            ps.setString(2, b.getTime());
            ps.setInt(3, b.getSlot());
            ps.setInt(4, b.getAid());
            a = ps.executeUpdate();
             
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(Staff.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }
   
   public List getdetails(int aid){
        ArrayList<GS> a = new ArrayList();
        String date = null;
        String time = null;
        int did = 0;
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("select did, date, time from doctor_availability where aid = ?");
            ps.setInt(1, aid);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                did = rs.getInt(1);
                date = rs.getString(2);
                time = rs.getString(3);
            }
            PreparedStatement ps1 = con.createConnection().prepareStatement("select name, Speciality from doctor where id = ?");
            ps1.setInt(1, did);
            ResultSet rs1 = ps1.executeQuery();
            while(rs1.next())
            {
                GS b = new GS();
                b.setDrname(rs1.getString(1));
                b.setDrspeciality(rs1.getString(2));
                b.setDate(date);
                b.setTime(time);
                a.add(b);               
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Staff.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }
   
   private static final String ALPHA_NUMERIC_STRING = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    public static String randomAlphaNumeric(int count) {
    StringBuilder builder = new StringBuilder();
    while (count-- != 0) {
    int character = (int)(Math.random()*ALPHA_NUMERIC_STRING.length());
    builder.append(ALPHA_NUMERIC_STRING.charAt(character));
    }
    return builder.toString();
    }
    
    public String getfee(String name)
    {
        String fee = null;
        try
        {
            PreparedStatement ps = con.createConnection().prepareStatement("select fee from test where name = ?");
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                fee = rs.getString(1);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return fee;
    }
   
   
}
