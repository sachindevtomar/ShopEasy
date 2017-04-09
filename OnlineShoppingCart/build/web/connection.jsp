<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver" %>

<%!
// mysql driver
String driver = "com.mysql.jdbc.Driver";

// the "url" to our DB, the last part is the name of the DB
String url = "jdbc:mysql://localhost:3306/shopeasy";

// the default DB username and password may be the same as your control panel login

String name = "root";
String pass = "";

%>
