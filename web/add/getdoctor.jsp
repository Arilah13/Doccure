
<%@page import="org.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="models.DBCon"%>
<%
    String id = request.getParameter("id");
    DBCon con = new DBCon();
    
    String username = null;
    String drname = null;
    String speciality = null;
    
    
    
    try{
        PreparedStatement ps = con.createConnection().prepareStatement("select * from doctor where id = ?");
        ps.setString(1, id);
        ResultSet rs = ps.executeQuery();
        while(rs.next())
        {                   
            username = rs.getString(3);
            drname = rs.getString(1);
            speciality = rs.getString(4);
            
            JSONObject obj = new JSONObject();
            obj.put("username", username);
            obj.put("drname", drname);
            obj.put("speciality", speciality);
            obj.put("aid", id);
            out.print(obj);
        }
        
        
        
        
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    
    
    
%>