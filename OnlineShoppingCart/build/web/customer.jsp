<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" type="image/png" href="/images/logo.png"/>
        <meta charset="UTF-8">
		<meta name="description" content="ShopEasy">
		<meta name="keywords" content="HTML,CSS,XML,JavaScript">
		<meta name="viewport" content="width=device-width,initial-scale=1.0">
        <title>ShopEasy</title>
     
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="js/jquery-3.1.1.min.js"></script>
         <script src="js/selectbox.js"></script>   
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
       <link rel="stylesheet" href="css/animate.css"/>
        <style>
            
            #first{
                background-color: #181818;
                border-radius:10px;
            }
            h4{
                color:#d0e9c6;
            }
            #second{
                background-color: #181818;
                opacity:.99;
                margin-top: 10px;
                border-radius: 10px;
                padding:20px;
                color:white;
            }
            #third{
                background-color: #181818;
                opacity:.99;
                margin-top: 10px;
                border-radius: 10px;
                padding:20px;
                color:white;
            }
            #file-input{
                display:none;
            }
            body{
                background-image: url("images/back5.jpg");
                background-attachment: fixed;
            }
            #changeok{
                display:none;
            }
                     
.image {
  position: relative;
  display: inline-block; /* This can be inline too */
  margin: 0 auto;
  padding: 0px;
}

.image .data {
  padding: 0 10px;
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  box-sizing: border-box;
  
  background-color: rgba(0, 0, 0, 0.7);
   word-wrap: break-word;
  font-size: 11px;
  font-family: 'Source Sans Pro',sans-serif;
  font-style: normal;
  font-weight: 700;
  color: #FFF;
}
.close {
  position: absolute;
  top: 20px;
  right: 0;
  opacity:1;
}
</style>
          <script src="js/wow.min.js"></script>
              <script>
              new WOW().init();
              </script>
  </head>
    <body>
        <%
     if(session.getAttribute("type")!=null)
     {
         if (session.getAttribute("type").equals("customer")) {
            
         }
            else
            {
                String loginPage=response.encodeRedirectURL("index.jsp?id=17");
                response.sendRedirect(loginPage);
            }
     }
     else
     {
           String loginPage=response.encodeRedirectURL("index.jsp?id=16");
                response.sendRedirect(loginPage);
     }
  %>
        <!-- Modal -->
        <div class="modal fade" id="memberModal" tabindex="-1" role="dialog" aria-labelledby="memberModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h3 class="modal-title" id="memberModalLabel">Thank you for signing in!</h3>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <%
            if (session.getAttribute("popup") != null) {
        %>
        <script>
            $(document).ready(function() {
                $('#memberModal').modal('show');
            });
        </script>
        <%
            session.removeAttribute("popup");
        } else {
        %>
        <script>
            $(document).ready(function() {
                $('#memberModal').modal('hide');
            });
        </script>
        <%
                }
        %>
        <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
        <a class="navbar-brand" href="index.jsp?id=1"><img src="images/logo.png" class="wow tada infinite" width="100" height="45" hspace="10px" style="margin-top:-10px; "/></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
        <div id="nav2">
             <ul class="nav navbar-nav navbar-right main-nav" >
      <li><img src="images/user.png" width="40" height="40" id="tooltip1"/></li>          
      <li> <a href="logout.jsp"><span class="glyphicon glyphicon-log-in"></span> Log Out</a></li>
        </ul>
        </div>
    </div>
  </div>
</nav>
    
      <div class="container-fluid">
      <div class="container-fluid col-lg-3 wow bounceInUp" id="first">
          <center>
              <form class="form" action="changedp.jsp" enctype="multipart/form-data" method="post">
              
                  <%@include file="connection.jsp" %>
<%
            int balance=0;
try
{
    String password=request.getParameter("password");
    String email=request.getParameter("email");
    String query = "select flag,balance from registration where id="+Integer.parseInt((String)session.getAttribute("id"));
    Class.forName( driver );
    // initialize the Connection, with our DB info ...
    Connection con = DriverManager.getConnection( url, name, pass );
    PreparedStatement ps=con.prepareStatement(query);
    ResultSet rs=ps.executeQuery();
    if(rs.next())
    {
        if(rs.getInt(1)==0)
        {
                 %> <img src="images/user1.png" class="img-rounded" alt="Cinque Terre" width="200" height="150" style="cursor:pointer;margin-top:20px;" vspace="10">
         <%}
        else
        {
           %>      <img src="images/profilepic/<%=session.getAttribute("id")+"_"+rs.getInt(1)%>.jpg" class="img-rounded wow pulse" alt="Cinque Terre" width="200" height="150" style="cursor:pointer;margin-top:20px;" vspace="10">
       <% }
        balance=rs.getInt(2);
    }
  con.close();
}
       catch(Exception e)
       {
           out.print("error occur");
       }
%> 
<div class="container-fluid ">
   <button type="button"  id="changedp" class="btn btn-primary col-lg-offset-2 col-lg-8 col-lg-offset-2 col-xs-offset-2 col-xs-8 col-xs-offset-2" >
              <label for="file-input" style="margin:0;cursor:pointer;" >Change Profile Picture</label></button>
              <input id="file-input" type="file" name="file-input"/>
   <button type="submit" class="btn btn-success col-lg-offset-2 col-lg-8 col-lg-offset-2 col-xs-offset-2 col-xs-8 col-xs-offset-2" id="changeok"><b>Click to Change</b></button>
</div>   
            <h4 class="wow fadeInLeft"><%=session.getAttribute("name")%></h4>
           <h4 class="wow fadeInRight"><%=session.getAttribute("email")%></h4>
           <h4 class="wow fadeInLeft"><%=session.getAttribute("mobile")%></h4>
           <h4 class="wow fadeInLeft">Rs. <%=balance%></h4>
              </form>
          </center>
       </div>
              <div class="container-fluid col-lg-offset-1 col-lg-8">
      <div class="container-fluid wow bounceInRight" id="second">
          <center> <h3>Cart Products</h3></center><hr style="color:white;">
                  <%@include file="cartcontent.jsp" %>
      </div>
      <div class="container-fluid wow bounceInRight" id="third">
          <center> <h3>Purchased Products</h3></center><hr style="color:white;">
                  <%@include file="buycontent.jsp" %>
      </div>
      </div>
      </div>
    
        <div class="container col-lg-12 navbar-bottom" style="background-color:#262626;margin-top: 10px;color:white;border:0px solid black;border-radius:4px;">
            <center><h4>&COPY;&nbsp;ShopEasy</h4></center>
        </div>
              
              <script>
                  $("#changedp").click(function(e){
	$("#changeok").show();
             $("#changedp").hide();
                });
               $(document).ready(function(){
            $('#tooltip1').tooltip({title: "<h4>Welcome on <h3 style='color: #f4d15e;'>ShopEasy</h3></h4>", html: true, placement: "bottom"}); 
             });
              </script>
    </body>
</html>