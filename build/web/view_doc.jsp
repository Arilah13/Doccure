<%-- 
    Document   : view_doc
    Created on : Mar 29, 2021, 10:38:47 AM
    Author     : rilah
--%>

<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Blob"%>
<%@page import="models.DBCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% DBCon con = new DBCon(); %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>View Report</title>
        <link href="assets/img/favicon.png" rel="icon">
    </head>
    <body>
        <%
            Cookie ck[] = request.getCookies();
            String cookie = "";
            String cookie2 = "";
            String cookie3 = "";
            int count = 0;
            for(int i = 0; i < ck.length; i++){
                    if(ck[i].getName().equals("uid")){
                    cookie = ck[i].getValue();
                    }
                    if(ck[i].getName().equals("didhm")){
                        cookie2 = ck[i].getValue();
                    }
                    if(ck[i].getName().equals("admin")){
                        cookie3 = ck[i].getValue();
                    }
            }
            if(!cookie.equals("") && cookie2.equals(""))
            {
            try{
                Blob blob = null;
                byte[] b = null;
                int id = Integer.parseInt(request.getParameter("lid"));
                PreparedStatement ps = con.createConnection().prepareStatement("select * from labappointment where uid = ? and lid = ?");
                ps.setInt(1, Integer.parseInt(cookie));
                ps.setInt(2, Integer.parseInt(request.getParameter("lid")));
                ResultSet rs = ps.executeQuery();
                while(rs.next()){
                  blob = rs.getBlob(7);
                  b = blob.getBytes(1, (int)blob.length());
                }
                response.setContentType("application/pdf");
                response.setHeader("Content-Disposition", "inline");
                response.setContentLength(b.length);
                OutputStream output = response.getOutputStream();
                output.write(b);
                output.flush();
            }
            catch(Exception e)
            {
                
            }
            }
            if(!cookie2.equals("") && cookie.equals("") || !cookie3.equals(""))
            {
            try{
            Blob blob = null;
            byte[] b = null;
            int id = Integer.parseInt(request.getParameter("tid"));
            PreparedStatement ps1 = con.createConnection().prepareStatement("select * from labappointment where lid = ?");
            ps1.setInt(1, Integer.parseInt(request.getParameter("tid")));
            ResultSet rs1 = ps1.executeQuery();
                while(rs1.next()){
                  blob = rs1.getBlob(7);
                  b = blob.getBytes(1, (int)blob.length());
                }
                response.setContentType("application/pdf");
                response.setHeader("Content-Disposition", "inline");
                response.setContentLength(b.length);
                OutputStream output = response.getOutputStream();
                output.write(b);
                output.flush();
            }
            catch(Exception e)
            {
                
            }
            }
            
            %>
           
    </body>
</html>
