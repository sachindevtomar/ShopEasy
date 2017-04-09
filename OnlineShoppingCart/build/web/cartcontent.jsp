
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver" %>
<div class="container-fluid">
    <div class="row">
        <%
    try
    {
    
    String query=null;
    Class.forName( "com.mysql.jdbc.Driver" );
    // initialize the Connection, with our DB info ...
    Connection con1 = DriverManager.getConnection( "jdbc:mysql://localhost:3306/shopeasy","root","");
    query = "select * from cart where customer_id="+Integer.parseInt((String)session.getAttribute("id"));
    PreparedStatement ps=con1.prepareStatement(query);
    ResultSet rs=ps.executeQuery();
    while(rs.next())
    {
        query = "select * from products where id="+rs.getInt(2);
    PreparedStatement ps1=con1.prepareStatement(query);
    ResultSet rs1=ps1.executeQuery();
    rs1.next();
       %>
        <div class="col-lg-4">
           <center>
               <div class="image">
                   <a href="product.jsp?product=<%=rs.getInt(2)%>">
           <img src="images/products/<%=rs1.getString(3)%>/<%=rs.getInt(2)%>.jpg" class="img-rounded wow fadeInDown " alt="Cinque Terre" width="200" height="150" style="cursor:pointer;margin-top:20px;" vspace="0">
           <a href="removecart.jsp?product=<%=rs.getInt(2)%>"> <button type="button" class="close"><i class="glyphicon glyphicon-remove-circle text-warning"></i></button></a>
           <div class="data">
               <%=rs1.getString(2)%>
               </div>
                   </a>
               </div>
           </center>
               
       </div>
       <%
    }
    con1.close();
    }
    catch(Exception e)
    {
     //   out.println(e.getMessage());
    }
%>
    </div>
</div>