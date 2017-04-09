<%-- 
    Document   : logout.jsp
    Created on : 8 Feb, 2017, 6:47:06 PM
    Author     : SACHIN DEV TOMAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
        session.removeAttribute("name");
        session.removeAttribute("type");
        session.removeAttribute("mobile");
        session.removeAttribute("id");
        session.removeAttribute("email");
        session.removeAttribute("popup");
    String loginPage=response.encodeRedirectURL("index.jsp?id=7");
    response.sendRedirect(loginPage);
 %>