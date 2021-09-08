
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
    
    ArrayList<String> appointment = new ArrayList();
    ArrayList<String> lab = new ArrayList();
    String speciality = null;
    
    LocalDate currentDate = LocalDate.now();
    LocalDate Date1 = currentDate.minusDays(1);
    LocalDate Date2 = currentDate.minusDays(2);
    LocalDate Date3 = currentDate.minusDays(3);
    LocalDate Date5 = currentDate.minusDays(4);
    LocalDate Date4 = currentDate.plusDays(1);
    Date date = Date.valueOf(currentDate);
    Date date1 = Date.valueOf(Date1);
    Date date2 = Date.valueOf(Date2);
    Date date3 = Date.valueOf(Date3);
    Date date4 = Date.valueOf(Date4);
    
    ArrayList<Date> date11 = new ArrayList();
    date11.add(date4);
    date11.add(date);
    date11.add(date1);
    date11.add(date2);
    date11.add(date3);
    
    
    
    try{
        PreparedStatement ps = con.createConnection().prepareStatement("select * from earnings where date = ?");
        for(int i=0; i<date11.size(); i++)
        {
        ps.setDate(1, date11.get(i));
        ResultSet rs = ps.executeQuery();
        if(rs.next())
        {                   
            appointment.add(rs.getString(4));
            lab.add(rs.getString(5));                       
        }
        else if(!rs.next())
        {
            appointment.add("0");
            lab.add("0");
        }
        }
        
        JSONObject obj = new JSONObject();
        obj.put("appointment", appointment);
        obj.put("lab", lab);    
        obj.put("date", date11);
        out.print(obj);
        
        
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    
    
    
%>