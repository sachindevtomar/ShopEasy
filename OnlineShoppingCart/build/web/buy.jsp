<%-- 
    Document   : buy
    Created on : 20 Feb, 2017, 10:57:09 PM
    Author     : SACHIN DEV TOMAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@include file="connection.jsp" %>
<%
    String type = request.getParameter("type");
    int pid = Integer.parseInt(request.getParameter("product3"));
    int pin = Integer.parseInt(request.getParameter("pin3"));
    String address = request.getParameter("address3");
    try{
         
    Class.forName( driver );
    // initialize the Connection, with our DB info ...
      Connection con = DriverManager.getConnection( url, name, pass );
    if(type.equals("cod"))
    { 
        PreparedStatement ps=con.prepareStatement("insert into buy values ("+Integer.parseInt((String)session.getAttribute("id"))+","+pid+",'"+type+"','"+address+"',"+pin+",?)");
        java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
        ps.setTimestamp(1, date);
        ps.executeUpdate();  
        String loginPage=response.encodeRedirectURL("product.jsp?product="+pid+"&id=24");
        response.sendRedirect(loginPage);
    }
    else
    {
    
        PreparedStatement ps=con.prepareStatement("select mrp,off from products where id="+pid);
        ResultSet rs=ps.executeQuery();
        if(rs.next())
        {
            int mrp=rs.getInt(1);
            int off=rs.getInt(2);
            float price=(float)mrp-(float)(mrp*off)/100;
            ps=con.prepareStatement("select balance from registration where id="+Integer.parseInt((String)session.getAttribute("id")));
            rs=ps.executeQuery();
            rs.next();
            float balance=(float)rs.getInt(1);
            if(balance>=price)
            {   
           ps=con.prepareStatement("insert into buy values ("+Integer.parseInt((String)session.getAttribute("id"))+","+pid+",'"+type+"','"+address+"',"+pin+",?)");
           java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
           ps.setTimestamp(1, date);
           ps.executeUpdate(); 
           ps=con.prepareStatement("update registration set balance="+(balance-price)+" where id="+Integer.parseInt((String)session.getAttribute("id")));
           ps.executeUpdate();
           String loginPage=response.encodeRedirectURL("product.jsp?product="+pid+"&id=24");
           response.sendRedirect(loginPage);
            }
            else
            {
                String loginPage=response.encodeRedirectURL("product.jsp?product="+pid+"&id=23");
                response.sendRedirect(loginPage);
            }
        }
    }
    }
    catch(Exception e)
    {
        out.println(e.getMessage());
    }
%>