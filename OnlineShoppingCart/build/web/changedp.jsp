<%@ page import="java.sql.*" %>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.io.output.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%
   Connection conn=null;
   Class.forName("com.mysql.jdbc.Driver").newInstance();
   conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopeasy","root", "");
   PreparedStatement ps=null;
   byte[] b=null;
   int flag=0;
   try{
       String query = "select flag from registration where id="+Integer.parseInt((String)session.getAttribute("id"));
    ps=conn.prepareStatement(query);
    ResultSet rs=ps.executeQuery();
    if(rs.next())
    {
       flag= rs.getInt(1);
    }
    flag++;
      query="update registration set flag="+flag+" where id="+Integer.parseInt((String)session.getAttribute("id"));
      ps=conn.prepareStatement(query);
       ps.executeUpdate();
       conn.close();
      DiskFileItemFactory factory = new DiskFileItemFactory();
      ServletFileUpload sfu = new ServletFileUpload(factory);
      List items = sfu.parseRequest(request);
      
      Iterator iter = items.iterator();

      while (iter.hasNext()) {
         FileItem item = (FileItem) iter.next();
         if (item.isFormField()) {

            } 
         else {
              b = item.get();
         }
      }
      
      FileOutputStream fout=new FileOutputStream("D:\\java\\OnlineShoppingCart\\web\\images\\profilepic\\"+session.getAttribute("id")+"_"+flag+".jpg");
      fout.write(b);
      fout.close();
      out.println("sachin");
      Thread.sleep(3000);
      if(session.getAttribute("type").equals("admin"))
      {
      String loginPage=response.encodeRedirectURL("admin.jsp?id=1");
       response.sendRedirect(loginPage);
      }
      else if(session.getAttribute("type").equals("customer"))
              {
                String loginPage=response.encodeRedirectURL("customer.jsp?id=1");
                response.sendRedirect(loginPage);
              }
      else
      {
          
      }
   }
   catch(Exception e)
   {
     out.print(e.getMessage());
     }

%><%-- 
    Document   : save
    Created on : 10 Feb, 2017, 6:33:34 AM
    Author     : SACHIN DEV TOMAR
--%>