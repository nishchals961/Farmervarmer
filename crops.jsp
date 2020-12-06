<%-- 
    Document   : crops
    Created on : Apr 26, 2018, 10:58:17 AM
    Author     : Nishchhal
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crops!</title>
    </head>
    <body>
        
        
        <%
            String name=request.getParameter("name");
            String sp=request.getParameter("sp");
            String descrip=request.getParameter("description");
        %>
        
        <%
            try
            {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","abcd");
                PreparedStatement stmt=con.prepareStatement("insert into crops values(?,?,?)");
                stmt.setString(1, name);
                stmt.setString(2, sp);
                stmt.setString(3, descrip);
                int i=stmt.executeUpdate();
                System.out.println(i+" records inserted");
            }
            catch(Exception e){}
        %>
        
        <h2>Crops Entered Successfully in our Databases! Our Executives will contact you soon!</h2>
        <jsp:include page="crop.html"></jsp:include>
    </body>
</html>
