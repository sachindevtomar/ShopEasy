<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="connection.jsp" %>
<div class="container-fluid">
    <div class="row">
<%
    try
    {
    String product=request.getParameter("product");
    String query=null;
    Class.forName( driver );
    // initialize the Connection, with our DB info ...
    Connection con = DriverManager.getConnection( url, name, pass );
    if(product==null)
    {
        query = "select * from products order by id desc";
    }
    else
    {
         query = "select * from products where name like '%"+product+"%'"+" order by id desc";
    }
    PreparedStatement ps=con.prepareStatement(query);
    ResultSet rs=ps.executeQuery();
    while(rs.next())
    {
       %>
       <div class="col-lg-4">
           <center>
               <div class="image">
                   <a href="product.jsp?product=<%=rs.getInt(1)%>">
           <img src="images/products/<%=rs.getString(3)%>/<%=rs.getInt(1)%>.jpg" class="img-rounded wow fadeInDown " alt="Cinque Terre" width="200" height="150" style="cursor:pointer;margin-top:20px;" vspace="0">
           <div class="data">
               <%=rs.getString(2)%>
               </div>
                   </a>
               </div>
           </center>
       </div>
       <%
    }
    }
    catch(Exception e)
    {
     //   out.println(e.getMessage());
    }
%>
    </div>
</div>