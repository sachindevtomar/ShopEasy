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
   PreparedStatement psImageInsertDatabase=null;
   String name=null,type=null,description=null,brand=null,imgname=null;
   int mrp=0,off=0,maxid=0;
   byte[] b=null;
   try{
        String query = "select MAX(id) from products";
    PreparedStatement ps=conn.prepareStatement(query);
    ResultSet rs=ps.executeQuery();
    if(rs.next())
    {
      maxid= rs.getInt(1);
    }
    else
    {
        maxid=1;
    }
      String sqlImageInsertDatabase="insert into products (name,type,description,mrp,off,brand,owner) values(?,?,?,?,?,?,?)";
      psImageInsertDatabase=conn.prepareStatement(sqlImageInsertDatabase);

      DiskFileItemFactory factory = new DiskFileItemFactory();
      
      ServletFileUpload sfu = new ServletFileUpload(factory);
      List items = sfu.parseRequest(request);
      
      Iterator iter = items.iterator();

      while (iter.hasNext()) {
         FileItem item = (FileItem) iter.next();
         if (item.isFormField()) {

      String fieldname = item.getFieldName();//text1
      if(fieldname.equals("pname"))
       name = item.getString();
      else if(fieldname.equals("brand"))
       brand= item.getString();
      else if(fieldname.equals("type"))
       type= item.getString();
      else if(fieldname.equals("description"))
       description= item.getString();
      else if(fieldname.equals("mrp"))
       mrp=Integer.parseInt(item.getString());
      else if(fieldname.equals("off"))
       off=Integer.parseInt(item.getString());
      else
      {
      }     
      
    } else {
             if (!item.isFormField()) {
              b = item.get();
          }
         }
      }
      
          out.println("sachin1 "+name+" "+brand+" "+type+"  "+description+"  "+mrp+" "+off);
  
      psImageInsertDatabase.setString(1,name);
      psImageInsertDatabase.setString(2,type);
      psImageInsertDatabase.setString(3,description);
      psImageInsertDatabase.setInt(4,mrp);
      psImageInsertDatabase.setInt(5,off);
      psImageInsertDatabase.setString(6,brand);
      psImageInsertDatabase.setString(7,(String)session.getAttribute("name"));
      maxid++;
      FileOutputStream fout=new FileOutputStream("D:\\java\\OnlineShoppingCart\\web\\images\\products\\"+type+"\\"+maxid+".jpg");
      fout.write(b);
      fout.close();
      psImageInsertDatabase.executeUpdate();
      String loginPage=response.encodeRedirectURL("admin.jsp?id=1");
        response.sendRedirect(loginPage);
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