<%-- 
    Document   : checkemail
    Created on : Apr 7, 2021, 5:45:22 PM
    Author     : rilah
--%>

<%@page import="org.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="models.DBCon"%>
<%
    String email = request.getParameter("email");
    String cookie = request.getParameter("cookie");
    DBCon con = new DBCon();
    boolean result;
    try{
        PreparedStatement ps = con.createConnection().prepareStatement("select email from users where userid != ? and email = ?");
        ps.setInt(1, Integer.parseInt(cookie));
        ps.setString(2, email);
        ResultSet rs = ps.executeQuery();
        if(rs.next())
        {
            JSONObject obj = new JSONObject();
            obj.put("status", 1);
            out.print(obj);
        }
        else
        {
            JSONObject obj = new JSONObject();
            obj.put("status", 0);
            out.print(obj);             
        }
        
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    
    
    
%>
