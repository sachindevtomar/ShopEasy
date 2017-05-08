
<%@ page import="java.sql.*" %>
<%@ page import="javax.activation.DataHandler"%>
<%@ page import="javax.activation.DataSource"%>
<%@ page import="javax.activation.FileDataSource"%>
<%@ page import="javax.mail.BodyPart"%>
<%@ page import="javax.mail.Message"%>
<%@ page import="javax.mail.MessagingException"%>
<%@ page import="javax.mail.PasswordAuthentication"%>
<%@ page import="javax.mail.Session"%>
<%@ page import="javax.mail.Transport"%>
<%@ page import="javax.mail.internet.InternetAddress"%>
<%@ page import="javax.mail.internet.MimeMessage"%>
<%@ page import="javax.mail.internet.MimeBodyPart"%>
<%@ page import="javax.mail.internet.MimeMultipart"%>
<%@ page import="java.util.Properties"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>send</title>
</head>
<%@include file="connection.jsp" %>
<%
    
      String to = request.getParameter("email");//change accordingly
    
      String from = "ShopEasy";//change accordingly
      final String username = "tomarsachindev@gmail.com";//change accordingly
      final String password = "***********";//change accordingly

      String host = "smtp.gmail.com";

      Properties props = new Properties();
      props.put("mail.smtp.auth", "true");
      props.put("mail.smtp.starttls.enable", "true");
      props.put("mail.smtp.host", host);
      props.put("mail.smtp.port", "587");

      Session session1 = Session.getInstance(props,new javax.mail.Authenticator() {
         protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(username, password);
         }
      });

      try {
         Message message = new MimeMessage(session1);

         message.setFrom(new InternetAddress(from));

         message.setRecipients(Message.RecipientType.TO,
         InternetAddress.parse(to));

         message.setSubject("ShopEasy");

         // This mail has 2 part, the BODY and the embedded image
         MimeMultipart multipart = new MimeMultipart("related");

         // first part (the html)
         BodyPart messageBodyPart = new MimeBodyPart();
         
            String query = "select * from registration where email='"+request.getParameter("email")+"'";
            String htmlText=null;
    Class.forName( driver );
    // initialize the Connection, with our DB info ...
    Connection con = DriverManager.getConnection( url, name, pass );
    PreparedStatement ps=con.prepareStatement(query);
    ResultSet rs=ps.executeQuery();
    if(rs.next())
    {
       
         htmlText = "<H1>Hello "+rs.getString("pname")+"<br>Your password is <b style='color:blue;'><u>"+rs.getString("password")+" </u></b></H1><img src=\"cid:image\">";
     messageBodyPart.setContent(htmlText, "text/html");
    
         // add it
         multipart.addBodyPart(messageBodyPart);

         // second part (the image)
         messageBodyPart = new MimeBodyPart();
         DataSource fds = new FileDataSource("D:\\java\\OnlineShoppingCart\\web\\images\\logo.png");

         messageBodyPart.setDataHandler(new DataHandler(fds));
         messageBodyPart.setHeader("Content-ID", "<image>");

         // add image to the multipart
         multipart.addBodyPart(messageBodyPart);

         // put everything together
         message.setContent(multipart);
         // Send message
         Transport.send(message);
        out.println("Sent message successfully....");
        String loginPage=response.encodeRedirectURL("index.jsp?id=25");
        response.sendRedirect(loginPage);
    }
    else
    {
        String loginPage=response.encodeRedirectURL("index.jsp?id=16");
        response.sendRedirect(loginPage);
    }
    con.close();
      } 
      catch (Exception e) {
            out.println(e.getMessage());
      } 
    %>
</body>
</html>
