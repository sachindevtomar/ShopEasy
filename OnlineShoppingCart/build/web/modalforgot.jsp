<%-- 
    Document   : modalforgot
    Created on : 12 Feb, 2017, 2:34:50 PM
    Author     : SACHIN DEV TOMAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="modal fade" id="Modal1" role="dialog">
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
                                    <li class="active"><a data-toggle="tab" href="#menu1"><b class="text-success"> FORGOT PASSWORD </b></a></li>
                                </ul>

                                <div class="tab-content">
                                    <div id="menu1" class="tab-pane in active">
                                        <div class="text-center">
                                            <form action="forgotpassword.jsp" method="post" id="form1">
                                                &nbsp;&nbsp;
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <div class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></div>
                                                        <input type="email" class="form-control" id="email1" name="email" placeholder="Email Id" required>
                                                    </div>
                                                </div>
                                               <button type="submit" class="btn btn-success"> <i class="glyphicon glyphicon-send" > Send</i></button>
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
