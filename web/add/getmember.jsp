
<%@page import="org.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="models.DBCon"%>
<%
    String id = request.getParameter("id");
    DBCon con = new DBCon();
    
    String username = null;
    
    try{
        PreparedStatement ps = con.createConnection().prepareStatement("select * from users where userid = ?");
        ps.setString(1, id);
        ResultSet rs = ps.executeQuery();
        while(rs.next())
        {                   
            username = rs.getString(5);           
            
            JSONObject obj = new JSONObject();
            obj.put("username", username);          
            obj.put("aid", id);
            out.print(obj);
        }
        
        
        
        
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    
    
    
%>