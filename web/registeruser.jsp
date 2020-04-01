<%-- 
    Document   : register
    Created on : Apr 25, 2018, 6:25:21 PM
    Author     : Rahul
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>register!</title>
    </head>
    <body>
        
        
        <%
            String email=request.getParameter("email");
            String password=request.getParameter("psw");
            String repeatpassword=request.getParameter("psw-repeat");
        %>
        
        <%
            try
            {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","abcd");
                PreparedStatement stmt=con.prepareStatement("insert into farmuser values(?,?,?)");
                stmt.setString(1, email);
                stmt.setString(2, password);
                stmt.setString(3, repeatpassword);
                int i=stmt.executeUpdate();
                System.out.println(i+" records inserted");
            }
            catch(Exception e){}
        %>
        
        <jsp:forward page = "profile.html" />
        
    </body>
</html>
