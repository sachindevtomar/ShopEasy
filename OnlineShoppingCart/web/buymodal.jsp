<%-- 
    Document   : buymodal
    Created on : 20 Feb, 2017, 9:16:39 PM
    Author     : SACHIN DEV TOMAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <div class="modal fade" id="Modal2" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header well">
                        <button type="button" class="close" data-dismiss="modal"><i class="glyphicon glyphicon-remove-circle text-warning"></i></button>
                        <h4 class="modal-title text-center"><b class="text-warning" >Buy Product</b></h4>
                    </div>
                    <div class="row">
                        <div class="col-md-offset-2 col-md-8">
                            <div class="modal-body">
                                <!-- Modal -->

                                <ul class="nav nav-tabs">
                                    <li class="active"><a data-toggle="tab" href="#menu1"><b class="text-success"> Order </b></a></li>
                                    
                                </ul>

                                <div class="tab-content">
                                    <div id="menu1" class="tab-pane in active">
                                        <div class="text-center">
                                            <form action="buy.jsp" method="post" id="form3">
                                                &nbsp;&nbsp;
                                                 <div class="form-group">
                                                    <div class="input-group">
                                                        <div class="input-group-addon"><i class="glyphicon glyphicon-credit-card"></i></div>
                                                        <select class="form-control" id="select3" name="type">
                                                            <option class="form-control" value="ebalance">e-Balance</option>
                                                            <option class="form-control" value="cod">Cash On Delivery (COD)</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group" style="display:none;">
                                                    <div class="input-group">
                                                        <div class="input-group-addon"><i class="glyphicon glyphicon-home"></i></div>
                                                        <input type="text" class="form-control" id="address3" name="product3" value="<%=request.getParameter("product")%>" required>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <div class="input-group-addon"><i class="glyphicon glyphicon-home"></i></div>
                                                        <input type="text" class="form-control" id="address3" name="address3" placeholder="Enter Address" required>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="input-group">
                                                        <div class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></div>
                                                        <input type="number" class="form-control" id="pin3" name="pin3" placeholder="Enter Pin Code" required>
                                                    </div>
                                                </div>
                                                <button type="submit" class="btn btn-success"> <i class="glyphicon glyphicon-ok" > Buy</i></button>
                                                <button type="reset" class="btn btn-warning"><i class="glyphicon glyphicon-refresh"> Reset</i></button>
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