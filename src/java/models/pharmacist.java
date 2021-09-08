/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author rilah
 */
public class pharmacist extends Login {
DBCon con = new DBCon();    
    public boolean verifypharmacist(String id, String password) throws NoSuchAlgorithmException, InvalidKeySpecException{//Read
        boolean verified = false;
        int status = 0;
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("select * from pharmacist where username = ? ");
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            
            
            if(rs.next() && authenticate(password, rs.getBytes("password"), rs.getBytes("salt"))){
                verified = true;
            }
            
            
        }catch(ClassNotFoundException | SQLException e){
        }
        
        return verified;
    }
    
    public int registerpharmacist(GS d){//Create
       int x = 0;
               
        try {
            
            PreparedStatement ps = con.createConnection().prepareStatement("insert into pharmacist(name, username, password, salt) values(?, ?, ?, ?)");
            ps.setString(1, d.getName());
            ps.setString(2, d.getUname());
            ps.setBytes(3, d.getPassword());
            ps.setBytes(4, d.getSalt());
            
            
            x = ps.executeUpdate();
            
           
        } catch (ClassNotFoundException | SQLException e) {
        }
        
        return x;
    }
    
    public List<GS> adminpharmacist(){
        List<GS> list = new ArrayList<GS>();
        try {
            
            PreparedStatement ps = con.createConnection().prepareStatement("select name, username from pharmacist");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                GS a = new GS();
                a.setName(rs.getString(1));
                a.setUname(rs.getString(2));             
                list.add(a);
            }
                 
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Appointment.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return list;
    }
    
}
