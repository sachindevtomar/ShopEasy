<%-- 
    Document   : login
    Created on : 8 Feb, 2017, 3:06:22 PM
    Author     : SACHIN DEV TOMAR
--%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connection.jsp" %>
<%
try
{
    String password=request.getParameter("password");
    String email=request.getParameter("email");
    String query = "select * from registration where email='"+email+"' AND password='"+password+"'";
    Class.forName( driver );
    // initialize the Connection, with our DB info ...
    Connection con = DriverManager.getConnection( url, name, pass );
    PreparedStatement ps=con.prepareStatement(query);
    ResultSet rs=ps.executeQuery();
    if(rs.next())
    {
        %><h1>valid</h1><%
        session.setAttribute("name", rs.getString(1));
        session.setAttribute("type", rs.getString(2));
        session.setAttribute("mobile", rs.getString(5));
        session.setAttribute("id",rs.getString(6));
        session.setAttribute("email",rs.getString(4));
        session.setAttribute("popup","1");
        if(rs.getString(2).equals("customer"))
        {
        String loginPage=response.encodeRedirectURL("index.jsp?id=1");
        response.sendRedirect(loginPage);
        }
        else
        {
         String loginPage=response.encodeRedirectURL("admin.jsp");
         response.sendRedirect(loginPage);   
        }
    }
    else
    {
        %><h1>Invalid</h1><%
        response.sendRedirect("index.jsp?id=21");
    }
}    
catch (SQLException sqle)
{ out.println("<p> Error opening JDBC, cause:</p> <b> " + sqle + "</b>"); }
%>
