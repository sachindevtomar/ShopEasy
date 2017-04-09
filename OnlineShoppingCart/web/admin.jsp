<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            }
            #em,#fg{
                display:inline;
            }
            #discount,#mrp{
                display:inline;
            }
            #fashion,#men,#women,#mcloth,#wcloth,#mfoot,#wfoot,#electronics,#dailyneeds,#living,#sel2{
                display:none;
            }
            label{
                margin-top: 5px;
                color:white;
            }
             #fg{
                    margin-left:20px;
                }
               #mrp{
                    margin-left:10px;
                }
            @media only screen and (max-width: 500px) {
                #fg,#mrp{
                    margin-left:0px;
                }
            }
            #file-input{
                display:none;
            }
            body{
                background-image: url("images/hi.jpg");
                background-attachment: fixed;
            }
            #changeok{
                display:none;
            }
            
        </style>
          <script src="js/wow.min.js"></script>
              <script>
              new WOW().init();
              </script>
  </head>
    <body>
        <%@include file="validation1.jsp" %>
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
      <li><img src="images/user.png" width="40" height="40"/></li>          
      <li> <a href="logout.jsp"><span class="glyphicon glyphicon-log-in"></span> Log Out</a></li>
        </ul>
        </div>
    </div>
  </div>
</nav>
    
      <div class="container-fluid">
      <div class="container-fluid col-lg-3" id="first">
          <center>
              <form class="form" action="changedp.jsp" enctype="multipart/form-data" method="post">
              
                  <%@include file="connection.jsp" %>
<%
try
{
    String password=request.getParameter("password");
    String email=request.getParameter("email");
    String query = "select flag from registration where id="+Integer.parseInt((String)session.getAttribute("id"));
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
              </form>
          </center>
       </div>
      <div class="container-fluid col-lg-offset-1 col-lg-6 wow bounceInRight" id="second">
      
          <form class="form" action="save.jsp" enctype="multipart/form-data" method="post" id="adminform2">
                <div class="form-group row">
                <label for="inputKey" class="col-md-2 control-label">Name:</label>
                <div class="col-md-4">
                    <input type="text" class="form-control" id="inputKey" placeholder="Enter Name" name="pname" required>
                </div>
                <label for="inputValue" class="col-md-2 control-label">Brand:</label>
                <div class="col-md-4">
                    <input type="text" class="form-control" id="inputValue" placeholder="Enter Brand" name="brand" required>
                </div>
            </div>
                <div class="form-group">
                <label for="sel1">Product Type:</label>
                <select class="form-control" id="sel1">
                    <option value="enter" >Enter Type</option>
                <option value="fashion">Fashion</option>
                <option value="electronics">Electronics</option>
                <option value="living">Home & Living</option>
                <option value="dailyneeds">Daily Needs</option>
                </select>
                
                <select class="form-control" id="fashion">
                    <option value="enter" >Enter Fashion Type</option>
                <option value="men">Men</option>
                <option value="women">Women</option>
                </select>
                <select class="form-control" id="men">
                    <option value="enter" >Enter Men's Fashion Type</option>
                <option value="mcloth">Men's Clothes</option>
                <option value="mfoot">Men's Footwear</option>
                <option value="mwatch">Men's Watches</option>
                </select>
                <select class="form-control" id="mcloth">
                    <option value="enter" >Enter Men's Cloth Type</option>
                <option value="mwinter">Winter Wears</option>
                <option value="mtopwear">Top Wears</option>
                <option value="mbottomwear">Bottom Wears</option>
                <option value="minnerwear">Inner Wears</option>
                </select>
                <select class="form-control" id="mfoot">
                    <option value="enter" >Enter Men's Footwear Type</option>
                <option value="msport">Sport's Shoes</option>
                <option value="mformal">Formal Shoes</option>
                <option value="mslipper">Slippers</option>
                <option value="mboot">Boots</option>
                <option value="mcasual">Casuals</option>
                </select>
               
                <select class="form-control" id="women">
                    <option value="enter" >Enter Women's Fashion Type</option>
                <option value="wcloth">Women's Clothes</option>
                <option value="wfoot">Women's Footwear</option>
                <option value="wwatch">Women's Watches</option>
                </select>
                <select class="form-control" id="wcloth">
                    <option value="enter" >Enter Women's Cloth Type</option>
                <option value="wwinter">Winter Wears</option>
                <option value="wtopwear">Top Wears</option>
                <option value="wbottomwear">Bottom Wears</option>
                <option value="winnerwear">Inner Wears</option>
                </select>
                <select class="form-control" id="wfoot">
                    <option value="enter" >Enter Women's Footwear Type</option>
                <option value="wheel">Heels</option>
                <option value="wsport">Sports Shoes</option>
                <option value="wcasual">Casuals Shoes</option>
                <option value="wboot">Boots</option>
                <option value="wslipper">Slippers</option>
                </select>
                
                <select class="form-control" id="electronics">
                    <option value="enter" >Enter Electronics Type</option>
                <option value="computer">Computers & Laptops</option>
                <option value="mobile">Mobiles</option>
                <option value="appliance">Appliances</option>
                </select>
                
                <select class="form-control" id="living">
                    <option value="enter" >Enter Home & Living Type</option>
                <option value="kitchen">Kitchenware</option>
                <option value="home">Home Appliances</option>
                <option value="furniture">Furnitures</option>
                </select>
                
                <select class="form-control" id="dailyneeds">
                <option value="enter" >Enter Dailyneeds Type</option>
                <option value="beauty">Beauty & Personal Care</option>
                <option value="food">Foods</option>
                <option value="other">Others</option>
                </select>
                
                <!-- it is main select whose value is received on the other page-->
                <select class="form-control" id="sel2" name="type">
                <option value="temp" id="temp1">Temp</option>
                </select>
                </div>
              
                <div class="form-group row">
                <label for="inputKey" class="col-md-2 control-label">MRP:</label>
                <div class="col-md-4">
                    <input type="number" class="form-control" id="inputKey" placeholder="(In Rs.)" name="mrp" required>
                </div>
                <label for="inputValue" class="col-md-2 control-label">Discount:</label>
                <div class="col-md-4">
                    <input type="number" class="form-control" id="inputValue" placeholder="(In %)" name="off" required>
                </div>
            </div>
              
                 <div class="form-group" id="discoun">
                <label for="off">Upload Picture:</label>
                <input type="file" class="form-control" id="off" name="imgname" required>
                </div>
                <div class="form-group" id="desc">
                <label for="desctext">Description:</label>
                <textarea class="form-control" rows="5" id="desctext" name="description" required></textarea>
                </div>
              <center><button type="submit" class="btn btn-default">Submit</button></center>
          </form>
      </div>   
      </div>
              <div class="container col-lg-12 navbar-fixed-bottom" style="background-color:#262626;margin-top: 10px;color:white;border:0px solid black;border-radius:4px;">
            <center><h4>&COPY;&nbsp;ShopEasy</h4></center>
        </div>
              <br><br>
              <script>
                  $("#changedp").click(function(e){
	$("#changeok").show();
             $("#changedp").hide();
                });

              </script>
    </body>
</html>