package Namaste;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
@WebServlet(urlPatterns = {"/MyBillSysem"})
public class MyBillSysem extends HttpServlet {

   
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       try{
                           Connection con;
                           PreparedStatement pst;
                           ResultSet rs;
     
                           Class.forName("com.mysql.jdbc.Driver");
                           con=DriverManager.getConnection("jdbc:mysql://localhost/hospital","root","");
                           
                           String  query="select * from records";
                           Statement st =con.createStatement();
                           rs = st.executeQuery(query);
                           while(rs.next()){
                           
                           
                           }
           } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
    }

    
}
