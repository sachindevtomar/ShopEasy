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
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
        <link href='//fonts.googleapis.com/css?family=Baloo Bhaina' rel='stylesheet'/>
        <script src="js/validation.js"></script>
        <link rel="stylesheet" href="css/animate.css"/>
        <script>
                $(function(){
                    $("#buy").click(function(){
                        if(<%=session.getAttribute("type")%>==null)
                        {
                            window.location.replace("index.jsp?id=16");
                        }
                    });
                });
            </script>
        <style>
             #nav1{
                display:block;
            }
            #nav2,#popup{
                display:none;
            }
            #key{
                display:none;
            }
            body{
                background-image: url("images/hiiii.jpg");
                background-size: 1360px 700px;
                background-attachment: fixed;
            }
           
            .button1 {
 
  background-color: #f4911e;
  color: #FFFFFF;
  transition: all 0.5s;
 }

.button1 span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button1 span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button1:hover span {
  padding-right: 25px;
}

.button1:hover span:after {
  opacity: 1;
  right: 0;
}
.button2 {
  background-color: #ac2925;
  color: #FFFFFF;
  transition: all 0.5s;
 }

.button2 span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button2 span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button2:hover span {
  padding-right: 25px;
}

.button2:hover span:after {
  opacity: 1;
  right: 0;
}
        h2{
             font-family: 'Baloo Bhaina';color: #ac2925;
          }
          p{
               font-family: 'Baloo Bhaina';font-size:15px;color:white;
          }
          h4,h3{
              font-family: 'Baloo Bhaina';color: #f4911e;
          }
          p,h3{
              display:inline;
              word-wrap: break-word;
          }
        </style>
          <script src="js/wow.min.js"></script>
              <script>
              new WOW().init();
              </script>
  </head>
    <body>
       <%@include file="connection.jsp" %>
<%
    String pname=null,type=null,desc=null,brand=null,owner=null,pid=null;
    int mrp=0,off=0;
    float price=0;
try
{
    pid=request.getParameter("product");
    session.setAttribute("product", pid);
    String query = "select * from products where id="+Integer.parseInt(pid);
    Class.forName( driver );
    // initialize the Connection, with our DB info ...
    Connection con = DriverManager.getConnection( url, name, pass );
    PreparedStatement ps=con.prepareStatement(query);
    ResultSet rs=ps.executeQuery();
    if(rs.next())
    {
        pname=rs.getString(2);
        type=rs.getString(3);
        desc=rs.getString(4);
        mrp=rs.getInt(5);
        off=rs.getInt(6);
        price=(float)mrp-((float)(mrp*off))/100;
        brand=rs.getString(7);
        owner=rs.getString(8);
    }
}
catch(Exception e)
{
    out.print(e.getMessage());
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
                    <a class="navbar-brand" href="index.jsp?id=5"><img src="images/logo.png" class="wow tada infinite" width="100" height="45" hspace="10px" style="margin-top:-10px; "/></a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <div id="nav1">
                        <ul class="nav navbar-nav navbar-right main-nav" >
                            <li> <a href="javascript:;" data-toggle="modal" data-target="#Modal" data-keybord="false" data-backdrop="static"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                            <li> <a href="javascript:;" data-toggle="modal" data-target="#Modal" data-keybord="false" data-backdrop="static"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                        </ul>
                    </div>
                    <div id="nav2">
                        <ul class="nav navbar-nav navbar-right main-nav" >
                            <li><a href="redirect.jsp"><img src="images/user.png" alt="user" width="40" height="40" style="margin-top: -10px;"/></a></li>       
                            <li> <a href="logout.jsp"><span class="glyphicon glyphicon-log-in"></span> Log Out</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>


        <%
            if (session.getAttribute("name") == null) {
        %>
        <script>
            document.getElementById('nav1').style.display = "block";
            document.getElementById('nav2').style.display = "none";
            
        </script>
        <%
        } else {
        %>
        <script>
                ch = "<%=session.getAttribute("name")%>";
                document.getElementById('nav1').style.display = "none";
                document.getElementById('nav2').style.display = "block";
        </script>
        <%
            }
        %>
        
          <%@include file="popupmodal.jsp" %>
           <%
                            
            if(request.getParameter("id")!=null)
            {if(request.getParameter("id").equals("23")||request.getParameter("id").equals("24")||request.getParameter("id").equals("26")||request.getParameter("id").equals("27"))
                            {%> 
                            <script>
            $(document).ready(function() {
                $('#memberModal').modal('show');
            });
        </script>
        <% }  
            }  %>
        <div class="modal fade" id="Modal" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header well">
                        <button type="button" class="close" data-dismiss="modal"><i class="glyphicon glyphicon-remove-circle text-warning"></i></button>
                        <h4 class="modal-title text-center"><b class="text-warning" >USER AUTHENTICATION</b></h4>
                    </div>
                    <div class="row">
                        <div class="col-md-offset-2 col-md-8">
                            <div class="modal-body">
                                <!-- Modal -->

                                <ul class="nav nav-tabs">
                                    <li class="active"><a data-toggle="tab" href="#menu1"><b class="text-success"> SIGN IN </b></a></li>
                                    <li><a data-toggle="tab" href="#menu2"><B class="text-success"> SIGN UP </B></a></li>
                                </ul>

                                <div class="tab-content">
                                    <div id="menu1" class="tab-pane in active">
                                        <div class="text-center">
                                            <form action="login.jsp" method="post" id="form1">
                                                &nbsp;&nbsp;
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <div class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></div>
                                                        <input type="text" class="form-control" id="email1" name="email" placeholder="Email Id" required>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <div class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></div>
                                                        <input type="password" class="form-control" id="pass1" name="password" placeholder="Password" required>
                                                    </div>
                                                </div>
                                                <center><a href="javascript:;" data-toggle="modal" data-target="#Modal1,#Modal" data-keybord="false" data-backdrop="static"><b>Forgot Password</b></a></center><hr>
                                                <button type="submit" class="btn btn-success"> <i class="glyphicon glyphicon-ok" > Login </i></button>
                                                <button type="reset" class="btn btn-warning"><i class="glyphicon glyphicon-refresh"> Reset</i></button>
                                            </form>
                                        </div>
                                    </div>
                                    <div id="menu2" class="tab-pane fade">
                                        <div class="text-center">
                                            <form action="registration.jsp" id="form2" method="post">
                                                &nbsp;&nbsp;
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <div class="input-group-addon"><i class="glyphicon glyphicon-user"></i></div>
                                                        <input type="text" class="form-control" id="user2" name="name" placeholder="Full Name" required>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <div class="input-group-addon"><i class="glyphicon glyphicon-apple"></i></div>
                                                        <select class="form-control" id="select1" name="type" onchange="my(this.value)">
                                                            <option class="form-control" value="customer">Customer</option>
                                                            <option class="form-control" value="admin">Admin</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group" id="key">
                                                    <div class="input-group">
                                                        <div class="input-group-addon"><i class="glyphicon glyphicon-king" aria-hidden="true"></i></div>
                                                        <input type="text" id="serialkey" name="key" class="form-control" placeholder="Serial Key">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <div class="input-group-addon"><i class="glyphicon glyphicon-lock" aria-hidden="true"></i></div>
                                                        <input type="password" id="pass2" name="password" class="form-control" placeholder="Password" required>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <div class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></div>
                                                        <input type="password" id="rpass2" name="rpass" class="form-control" placeholder="Re Enter Password" required>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <div class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></div>
                                                        <input type="number" name="mobile" id="ph" class="form-control" placeholder="Enter Phone No" required >
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <div class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></div>
                                                        <input type="email" name="email" id="email2" class="form-control" placeholder="E-mail" required>
                                                    </div>
                                                </div>
                                                <button type="submit" class="btn btn-warning" name="submit"><i class="glyphicon glyphicon-ok" ></i> Sign Up</button>
                                                <button type="reset" class="btn btn-warning" name="reset"><i class="glyphicon glyphicon-refresh" ></i> Reset</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <!--modal -->
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
                <%@include file="buymodal.jsp" %>
               <%@include file="modalforgot.jsp" %>
        
        <div class="container-fluid col-lg-4" style="">
       
                
                    <center>
                        <img src="images/products/<%=type%>/<%=pid%>.jpg" class="img-rounded wow fadeInDown" alt="Cinque Terre" width="320" height="350" style="margin-top:20px;" vspace="10">
                    </center>
                    <center>
                        <a href="javascript:;" data-toggle="modal" data-target="#Modal2" data-keybord="false" data-backdrop="static">
                    <button type="button" class="button1 btn btn-success col-lg-offset-1 col-lg-10 col-xs-offset-1 col-xs-10" id="buy"><span>Buy Now</span></button>
                        </a>
                    </center>
                    <center>
                        <a href="addcart.jsp?product=<%=pid%>">
                            <button type="button" class="button2 btn btn-primary col-lg-offset-1 col-lg-10 col-xs-offset-1 col-xs-10"   style="margin-top:10px;" id="add"><span>Add in Cart</span></button>
                        </a>
                    </center>
      
        </div>
        <div class="container-fluid col-lg-offset-1 col-lg-6 wow bounceInRight" style="background-color:rgba(24,24,24,1);margin-top:10px;border-radius:10px;">
            <hr style=" height:2px; background-color:white;"><h2 class="" style="color: #ffb11e;"><%= pname%></h2><hr>
            <h3>Brand: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h3><p><%=  brand%>&nbsp;</p>
            <hr>
            <h3>MRP: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h3><p><%=mrp%> Rs.</p>
            <hr>
            <h3>Discount: &nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;</h3><p><%=off%> %</p>  <hr>
            <h3>Price: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h3><p><del><%=mrp%> Rs.</del>&nbsp;&nbsp;<%=price%> Rs.</p>  <hr>
             <h3>Description:&nbsp;&nbsp;</h3><p><%=desc%></p>  <hr style=" height:2px; background-color:white;">
            
       </div>
           
      
        <div class="container col-lg-12 navbar-fixed-bottom" style="background-color:#262626;margin-top: 10px;color:white;border:0px solid black;border-radius:4px;">
            <center><h4 style="color:white;">&COPY;&nbsp;ShopEasy</h4></center>
        </div>
              <br><br>
              <script>
                  function my(x)
                {
                if (x == "admin")
                    document.getElementById("key").style.display = "block";
                else
                    document.getElementById("key").style.display = "none";
                }
            </script>
            
    </body>
</html>