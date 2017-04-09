<%-- 
    Document   : index
    Created on : 6 Feb, 2017, 11:45:37 PM
    Author     : SACHIN DEV TOMAR
--%>
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
        <link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700' rel='stylesheet' type='text/css'>
      
        <link rel="stylesheet" href="css/animate.css"/>

        <style>
            .carousel-inner > .item > img,
            .carousel-inner > .item > a > img {
                width: 70%;
                margin: auto;
            }
            #nav1{
                display:block;
            }
            #nav2,#popup{
                display:none;
            }
            #key{
                display:none;
            }
            #content{
                border-radius: 10px;
            }
            body{
                background-image: url("images/hiiii.jpg");
                background-size: 1360px 700px;
                background-attachment: fixed;
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
 </style>

        <script>
            var ch;
            $(function() {
                $(".accordion").accordion({
                    heightStyle: "content"
                });
            });
        </script>
   
    </head>
    <body>

           <script src="js/wow.min.js"></script>
              <script>
              new WOW().init();
              </script>
        <!-- Modal -->
        <%@include file="popupmodal.jsp" %>

        <nav class="navbar navbar-inverse wow fadeInDown">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                        
                    </button>
                    <a class="navbar-brand" href="#"><img src="images/logo.png" class="wow tada infinite" width="100" height="45" hspace="10px" style="margin-top:-10px; "/></a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <form class="navbar-form navbar-left">
                        <div class="input-group">
                            <input type="text" class="form-control" id="search" placeholder="Search">
                            <div class="input-group-btn">
                                <button class="btn btn-default" type="submit">
                                    <i class="glyphicon glyphicon-search"></i>
                                </button>
                            </div>
                        </div>
                    </form>
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
            $(document).ready(function() {
                $('#memberModal').modal('hide');
            });
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
            }
        %>

        
           <%
                            
            if(request.getParameter("id")!=null)
            {if(request.getParameter("id").equals("7")||request.getParameter("id").equals("16")||request.getParameter("id").equals("15")||request.getParameter("id").equals("21")||request.getParameter("id").equals("22")||request.getParameter("id").equals("25"))
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
                                                <center><p><a href="javascript:;" data-toggle="modal" data-target="#Modal1,#Modal" data-keybord="false" data-backdrop="static"><b>Forgot Password</b></a></p></center><hr>
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
                                                        <div class="input-group-addon"><i class="glyphicon glyphicon-king text-primary" aria-hidden="true" title="get serial key from Sachin"></i></div>
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

            <%@include file="modalforgot.jsp" %>

        <div class="container-fluid">

            <div id="first" class="col-lg-3 animated fadeInDown" style="">
                <h4 style="color:white;">TOP CATEGORIES</h4>
                <div class="accordion">
                    <h3><img src="images/all.png" class="img-thumbnail" alt="Cinque Terre" width="50" height="50"/>&nbsp;&nbsp;&nbsp;ShopEasy</h3>
                    <div> <a href="index.jsp?product=all&id=1"><b>All Items</b></a></div>
                    <h3><img src="images/fashion.png" class="img-thumbnail" alt="Cinque Terre" width="50" height="40"/>&nbsp;&nbsp;&nbsp;Fashion</h3>
                    <div>
                        <div class="accordion">
                            <h3>Men</h3>
                            <div>
                                <div class="accordion">
                                    <h3>Clothing</h3>
                                    <div>
                                        <b>    <a href="index.jsp?product=mwinter&id=1"> Winter wears</a>
                                            <br>    <a href="index.jsp?product=mtopwear"> Top wears</a>
                                            <br> <a href="index.jsp?product=mbottomwear"> Bottom wears</a>
                                            <br> <a href="index.jsp?product=minnerwear"> Inner wears</a>
                                        </b> 
                                    </div>

                                    <h3>Footwear</h3>
                                    <div>
                                        <b>            <a href="index.jsp?product=msport"> Sports Shoes</a>
                                            <br> <a href="index.jsp?product=mformal">Formal Shoes</a>
                                            <br>     <a href="index.jsp?product=mslipper">Slipper</a>
                                            <br>    <a href="index.jsp?product=mboot">Boots</a>
                                            <br>  <a href="index.jsp?product=mcasual">Casuals Shoes</a>
                                        </b>  </div>
                                    <h3> Watches</h3>
                                    <div>
                                        <b> <a href="index.jsp?product=mwatch">Men's Watches</a></b> 
                                    </div>
                                </div>
                            </div>
                            <h3>Women</h3>
                            <div>
                                <div class="accordion">
                                    <h3>Clothing</h3>
                                    <div>
                                        <b> <a href="index.jsp?product=wwinter"> Winter wears</a>
                                            <br> <a href="index.jsp?product=wtopwear"> Top wears</a>
                                            <br>  <a href="index.jsp?product=wbottomwear"> Bottom wears</a>
                                            <br> <a href="index.jsp?product=winnerwear"> Inner wears</a>
                                        </b>
                                    </div>

                                    <h3>Footwear</h3>
                                    <div>
                                        <b>   <a href="index.jsp?product=wsport"> Sports Shoes</a>
                                            <br><a href="index.jsp?product=wheel">Heels</a>
                                            <br><a href="index.jsp?product=wslipper">Slipper</a>
                                            <br> <a href="index.jsp?product=wboot">Boots</a>
                                            <br> <a href="index.jsp?product=wcasual">Casuals</a>
                                        </b> </div>
                                      <h3> Watches</h3>
                                    <div>
                                        <b> <a href="index.jsp?product=wwatch">Women's Watches</a></b> 
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <h3><img src="images/electronics.png" class="img-thumbnail" alt="Cinque Terre" width="50" height="40"/>&nbsp;&nbsp;&nbsp;Electronics</h3>

                    <div>
                        <b>  <a href="index.jsp?product=computer">Computers & Laptops</a><br>
                             <a href="index.jsp?product=mobile"> Mobiles</a><br>
                             <a href="index.jsp?product=appliance"> Appliances</a><br>
                        </b> 
                    </div>

                    <h3><img src="images/kitchen.png" class="img-thumbnail" alt="Cinque Terre" width="50" height="40"/>&nbsp;&nbsp;&nbsp;Home & Living</h3>
                    <div>
                        <b>  <a href="index.jsp?product=kitchen">Kitchenwares</a><br>
                              <a href="index.jsp?product=home">Home Appliances</a><br>
                              <a href="index.jsp?product=furniture">Furnitures</a><br>
                        </b> 
                    </div>
                    <h3><img src="images/dailyneeds.png" class="img-thumbnail" alt="Cinque Terre" width="50" height="40"/>&nbsp;&nbsp;&nbsp;Daily Needs</h3>
                    <div>
                        <b>  <a href="index.jsp?product=beauty">Beauty & Personal Care</a><br>
                             <a href="index.jsp?product=food">Foods</a><br>
                            <a href="index.jsp?product=other"> Others</a><br>
                        </b> 
                    </div>
                </div>

            </div>

            <div id="second" class="col-lg-offset-0 col-lg-9" style="margin-top: 10px;">
                <div class="container-fluid">
                    <br>
                    <div id="myCarousel" class="carousel slide wow bounceInRight" data-ride="carousel">
                        <!-- Indicators -->


                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">
                            <div class="item active">
                                <img src="images/raymond.jpg" alt="Chania">
                            </div>

                            <div class="item">
                                <img src="images/nike.jpg" alt="Chania" width="460" height="35">
                            </div>

                            <div class="item">
                                <img src="images/jewellory.jpg" alt="Flower" width="460" height="345">
                            </div>

                            <div class="item">
                                <img src="images/galexys7.jpg" alt="Flower" width="460" height="345">
                            </div>

                            <div class="item">
                                <img src="images/sonyvaio.jpg" alt="Flower" width="460" height="345">
                            </div>
                        </div>

                        <!-- Left and right controls -->
                        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
                <div class="container-fluid" style="margin-top: 10px;background-color:rgba(188,232,241,.5);" id="content">
                   <%@include file="content.jsp" %>
                </div>
            </div>
        </div>

        <div class="container col-lg-12 navbar-fixed-bottom" style="background-color:#262626;margin-top: 10px;color:white;border:0px solid black;border-radius:4px;">
            <center><h4>&COPY;&nbsp;ShopEasy</h4></center>
        </div>
  <script src="js/validation.js"></script>
        <script>
            function my(x)
            {
                if (x == "admin")
                    document.getElementById("key").style.display = "block";
                else
                    document.getElementById("key").style.display = "none";
            }
        </script>
        <br><br>
    </body>
</html>