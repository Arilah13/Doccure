
<%@page import="org.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="models.DBCon"%>
<%
    String id = request.getParameter("id");
    DBCon con = new DBCon();
    
    String name = null;
  
    
    try{
        PreparedStatement ps = con.createConnection().prepareStatement("select * from doctorspeciality where id = ?");
        ps.setString(1, id);
        ResultSet rs = ps.executeQuery();
        while(rs.next())
        {                   
            name = rs.getString(2);
            
            JSONObject obj = new JSONObject();
            obj.put("name", name);           
            obj.put("id", id);
            out.print(obj);
        }
     
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    
    
    
%>