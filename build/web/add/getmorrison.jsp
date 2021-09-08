
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="models.DBCon"%>
<%
    String id = request.getParameter("id");
    DBCon con = new DBCon();
    
    ArrayList<String> patient = new ArrayList();
    ArrayList<String> doctor = new ArrayList();
    ArrayList<String> staff = new ArrayList();
    String speciality = null;
    
    LocalDate currentDate = LocalDate.now();
    LocalDate Date1 = currentDate.minusDays(1);
    LocalDate Date2 = currentDate.minusDays(2);
    LocalDate Date3 = currentDate.minusDays(3);
    
    Date date = Date.valueOf(currentDate);
    Date date1 = Date.valueOf(Date1);
    Date date2 = Date.valueOf(Date2);
    Date date3 = Date.valueOf(Date3);
    
    
    ArrayList<Date> date11 = new ArrayList();
    date11.add(date);
    date11.add(date1);
    date11.add(date2);
    date11.add(date3);
    
    
    try{
        PreparedStatement ps = con.createConnection().prepareStatement("select * from register where date = ?");
        for(int i=0; i<date11.size(); i++)
        {
        ps.setDate(1, date11.get(i));
        ResultSet rs = ps.executeQuery();
        if(rs.next())
        {                   
            patient.add(rs.getString(2));
            staff.add(rs.getString(3));          
            doctor.add(rs.getString(4));
        }
        else if(!rs.next())
        {
            patient.add("0");
            staff.add("0");
            doctor.add("0");
        }
        }
        
        JSONObject obj = new JSONObject();
        obj.put("patient", patient);
        obj.put("doctor", doctor);  
        obj.put("staff", staff);
        obj.put("date", date11);
        out.print(obj);
        
        
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    
    
    
%>