

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%
     if(session.getAttribute("type")!=null)
     {
         if (session.getAttribute("type").equals("admin")) {
            
         }
            else
            {
                String loginPage=response.encodeRedirectURL("index.jsp?id=15");
                response.sendRedirect(loginPage);
            }
     }
     else
     {
           String loginPage=response.encodeRedirectURL("index.jsp?id=16");
                response.sendRedirect(loginPage);
     }
  %>