<%-- 
    Document   : redirect
    Created on : 9 Feb, 2017, 1:54:35 AM
    Author     : SACHIN DEV TOMAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if(session.getAttribute("type").equals("admin"))
    {
        response.sendRedirect("admin.jsp");
    }
    else
    {
        String loginPage=response.encodeRedirectURL("customer.jsp");
        response.sendRedirect(loginPage);
    }
%>
