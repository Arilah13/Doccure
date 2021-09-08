<%-- 
    Document   : checkemail
    Created on : Apr 7, 2021, 5:45:22 PM
    Author     : rilah
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="models.DBCon"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%
    String email = request.getParameter("query");
    String key ="%"+email+"%";
    DBCon con = new DBCon();
    boolean result;
    try{
        PreparedStatement ps = con.createConnection().prepareStatement("select CONCAT(name,' ',Speciality) from doctor where name LIKE  ?");
        ps.setString(1, key);
        ResultSet rs = ps.executeQuery();
        
        while(rs.next())
        {
            %>           
            <ul class="mystyle">
                
            <li class="mystyle"><%=rs.getString(1)%> </li>
               
            </ul>
            <% 
        }
         
        
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    
    
    
%>
