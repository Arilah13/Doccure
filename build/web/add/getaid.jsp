
<%@page import="org.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="models.DBCon"%>
<%
    String id = request.getParameter("id");
    DBCon con = new DBCon();
    
    String pid = null;
    
    
    try{
        PreparedStatement ps = con.createConnection().prepareStatement("select id from patient_appointment where id = ?");
        ps.setString(1, id);
        ResultSet rs = ps.executeQuery();
        while(rs.next())
        {                   
            pid = rs.getString(1);
            
            JSONObject obj = new JSONObject();
            obj.put("name", pid);           
            obj.put("id", id);           
            out.print(obj);
        }
     
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    
    
    
%>