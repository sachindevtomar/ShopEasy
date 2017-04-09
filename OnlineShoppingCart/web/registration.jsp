<%@include file="connection.jsp" %>
<html>
<head>
<title>testServlet</title>
</head>
<body>
<p>Attempting to open JDBC connection to:... </p> <%=url%>
<%

try
{
// Test the DB connection by making an empty table
    String pname=request.getParameter("name");
    String type=request.getParameter("type");
    String password=request.getParameter("password");
    String email=request.getParameter("email");
    String mobile=request.getParameter("mobile");
    
    if(type.equals("customer"))
    {
         out.print("sachin1");
    String query = "insert into registration values('"+pname+"','"+type+"','"+password+"','"+email+"','"+mobile+"',0,0,1000)";
    Class.forName( driver );
    Connection con = DriverManager.getConnection( url, name, pass );
    out.print("sachin2");
    Statement stat = con.createStatement();
    stat.executeUpdate( query );
    out.print("sachin3");
    con.close();
    response.sendRedirect("index.jsp");
    }
    else
    {
    String key=request.getParameter("key");
    String query = "select * from permission where serialkey='"+key+"' AND flag=1";
    Class.forName( driver );
    // initialize the Connection, with our DB info ...
    Connection con = DriverManager.getConnection( url, name, pass );
    PreparedStatement ps=con.prepareStatement(query);
    ResultSet rs=ps.executeQuery();
    if(rs.next())
    {
       
    String query1= "insert into registration values('"+pname+"','"+type+"','"+password+"','"+email+"','"+mobile+"',0,0,0)";
    Class.forName( driver );
    Connection con1= DriverManager.getConnection( url, name, pass );
    Statement stat = con1.createStatement();
    stat.executeUpdate( query1 );
    con1.close();
    query1 = "update permission set flag=0 where serialkey='"+key+"'";
    PreparedStatement ps1=con.prepareStatement(query1);
    ps1.executeUpdate();
    response.sendRedirect("index.jsp");    
    }
    else
    {
        String loginPage=response.encodeRedirectURL("index.jsp?id=22");
        response.sendRedirect(loginPage);
    }
    }
    
}
catch (SQLException sqle)
{ out.println("<p> Error opening JDBC, cause:</p> <b> " + sqle + "</b>"); }

catch(ClassNotFoundException cnfe)
{ out.println("<p> Error opening JDBC, cause:</p> <b>" + cnfe + "</b>"); }

%>
</body>
</html>