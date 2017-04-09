<%-- 
    Document   : removecart
    Created on : 22 Feb, 2017, 2:57:48 AM
    Author     : SACHIN DEV TOMAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connection.jsp" %>

<!DOCTYPE html>
<%
   int pid=0;
    try
    {
        pid=Integer.parseInt(request.getParameter("product"));
        String query = "delete from cart where product_id="+pid;
        Class.forName(driver);
        // initialize the Connection, with our DB info ...
        Connection con = DriverManager.getConnection( url, name, pass );
        PreparedStatement ps=con.prepareStatement(query);
        ps.executeUpdate();
        String loginPage=response.encodeRedirectURL("customer.jsp");
        response.sendRedirect(loginPage);
    }
    catch(Exception e)
    {
        out.print(e.getMessage());
    }
    %>