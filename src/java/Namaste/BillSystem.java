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
@WebServlet(urlPatterns = {"/BillSystem"})
public class BillSystem extends HttpServlet {

    

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        try{
                           Connection con;
                           PreparedStatement pst;
                           ResultSet rs;
     
                           Class.forName("com.mysql.jdbc.Driver");
                           con=DriverManager.getConnection("jdbc:mysql://localhost/hospital","root","");
                           
                           String  query="select * from records";
                           Statement st =con.createStatement();
                           rs = st.executeQuery(query);
                           while(rs.next()){ }
           } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String item = request.getParameter("drink");
        String qty = request.getParameter("qty");
        
        
        int qtty=0;
        int price = 0;
        float discount= 0.0f;
        
        
        if(item.equals("pepsi"))
        {
            price =25;
            discount = 10;
            qtty = Integer.parseInt(qty);
            float amount = qtty * price;
            float disamount = amount * discount/100.0f;
            float bill = amount - disamount;
            
            out.println("<form method='get' action='servlet'>");
            out.println("<table border=2 cellpadding=0 cellspacing=0>");
          
            out.println("<tr>");
             out.println("<td colspan=2>Order Details</td>");
            out.println("</tr>");
            
            out.println("<tr><td>Drink</td> <td> " +  item    +  "</td></tr>");
            out.println("<tr><td>Price</td> <td> " +  price    +  "</td></tr>");
            out.println("<tr><td>Amount</td> <td> " +  amount    +  "</td></tr>");
            out.println("<tr><td>DiscountAmount</td> <td> " +  disamount    +  "</td></tr>");
             out.println("<tr><td>Bill</td> <td> " +  bill    +  "</td></tr>");    
            out.println("</table>");
            out.println("</form>");
            
        }
        else if(item.equals("cock"))
        {
            price =30;
            discount = 5;
            qtty = Integer.parseInt(qty);
            float amount = qtty * price;
            float disamount = amount * discount/100.0f;
            float bill = amount - disamount;
            
            out.println("<form method='get' action='servlet'>");
            out.println("<table border=2 cellpadding=0 cellspacing=0>");
          
            out.println("<tr>");
             out.println("<td colspan=2>Order Details</td>");
            out.println("</tr>");
            
            out.println("<tr><td>Drink</td> <td> " +  item    +  "</td></tr>");
            out.println("<tr><td>Price</td> <td> " +  price    +  "</td></tr>");
            out.println("<tr><td>Amount</td> <td> " +  amount    +  "</td></tr>");
            out.println("<tr><td>DiscountAmount</td> <td> " +  disamount    +  "</td></tr>");
             out.println("<tr><td>Bill</td> <td> " +  bill    +  "</td></tr>");    
            out.println("</table>");
            out.println("</form>");        
        }
        else
        {
            out.println("no yo can't");
        }
    }  
}
