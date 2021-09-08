
<%@page import="org.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="models.DBCon"%>
<%
    String id = request.getParameter("id");
    DBCon con = new DBCon();
    
    String date = null;
    String drname = null;
    String time = null;
    String slot = null;
    
    int did = 0;
    try{
        PreparedStatement ps = con.createConnection().prepareStatement("select * from doctor_availability where aid = ?");
        ps.setString(1, id);
        ResultSet rs = ps.executeQuery();
        while(rs.next())
        {                   
            date = rs.getDate(3).toString();
            time = rs.getString(4);
            slot = String.valueOf(rs.getInt(6));
            did = rs.getInt(2);
            JSONObject obj = new JSONObject();
            obj.put("date", date);
            obj.put("time", time);
            obj.put("slot", slot);
            obj.put("aid", id);
            out.print(obj);
        }
        PreparedStatement ps1 = con.createConnection().prepareStatement("select CONCAT(name,' ',Speciality) from doctor where id = ?");
        ps1.setInt(1, did);
        ResultSet rs1 = ps1.executeQuery();
        while(rs1.next())
        {
            drname = rs1.getString(1);
        }
        
        
        
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    
    
    
%>