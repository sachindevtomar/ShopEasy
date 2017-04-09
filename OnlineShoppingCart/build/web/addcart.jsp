<%-- 
    Document   : addcart
    Created on : 19 Feb, 2017, 12:46:13 AM
    Author     : SACHIN DEV TOMAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connection.jsp" %>

<!DOCTYPE html>
<%
    int pid=0;
    int cid=0;
    if(session.getAttribute("name")!=null)
    {
    try
    {
        pid=Integer.parseInt(request.getParameter("product"));
        cid=Integer.parseInt((String)session.getAttribute("id"));
    String query = "insert into cart values ("+cid+","+pid+")";
    Class.forName( driver );
    // initialize the Connection, with our DB info ...
    Connection con = DriverManager.getConnection( url, name, pass );
    PreparedStatement ps=con.prepareStatement("select * from cart where product_id="+pid+" and customer_id="+cid);
    ResultSet rs=ps.executeQuery();
    if(!rs.next())
    {
        ps=con.prepareStatement(query);
        ps.executeUpdate();
        String loginPage=response.encodeRedirectURL("product.jsp?product="+pid+"&id=27");
        response.sendRedirect(loginPage);
    }
    else
    {
        String loginPage=response.encodeRedirectURL("product.jsp?product="+pid+"&id=26");
        response.sendRedirect(loginPage);
    }
    }
    catch(Exception e)
    {
    }
    }
    else
    {
    String loginPage=response.encodeRedirectURL("index.jsp?id=16");
    response.sendRedirect(loginPage);    
    }
%>