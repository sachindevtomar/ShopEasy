
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
    query = "select * from buy where customer_id="+Integer.parseInt((String)session.getAttribute("id"));
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
           <img src="images/products/<%=rs1.getString(3)%>/<%=rs.getInt(2)%>.jpg" class="img-rounded wow fadeInDown " alt="Cinque Terre" width="200" height="150" style="cursor:pointer;margin-top:20px;" vspace="0">
            <div class="data">
               <%=rs1.getString(2)%>
               </div>
                   
               </div>
           </center>
               <div class="col-lg-12" style="border-bottom:1px solid white;border-right:1px solid white;border-left:1px solid white; border-radius: 10px;">
                   <center> 
                       <h5 style="color:#d0f9c6;">Transaction: <%=rs.getString(3)%>
                       </h5>  <h5> Address: <%=rs.getString(4)%>
                       </h5><h5>Pin: <%=rs.getInt(5)%>
                       </h5><h5 style="color:#ce8483;">Order-Time: <%=rs.getTimestamp(6)%></h5>
                   </center>
               </div>
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