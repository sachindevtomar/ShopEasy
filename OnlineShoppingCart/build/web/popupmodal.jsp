<%-- 
    Document   : popupmodal
    Created on : 11 Feb, 2017, 12:57:12 PM
    Author     : SACHIN DEV TOMAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="modal fade" id="memberModal" tabindex="-1" role="dialog" aria-labelledby="memberModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h3 class="modal-title" id="memberModalLabel"> 
                        <%
                            if(request.getParameter("id")!=null)
                            {
                                if(request.getParameter("id").equals("7"))
                                {
                                %>Successfully Logged Out !!!<%
                                }
                                else if(request.getParameter("id").equals("15"))
                                {
                                %>You are not an admin !!!<%
                                }
                                else if(request.getParameter("id").equals("16"))
                                {
                                %>Please login first !!!<%
                                }
                                else if(request.getParameter("id").equals("21"))
                                {
                                %>You are not registered. Please login first !!!<%
                                }
                                else if(request.getParameter("id").equals("22"))
                                {
                                %>Invalid Serial Key !!!<%
                                } 
                                else if(request.getParameter("id").equals("23"))
                                {
                                %>Insufficient Balance !!!<%
                                } 
                                else if(request.getParameter("id").equals("24"))
                                {
                                %>Item will be delivered to your registered address !!!<%
                                } 
                                else if(request.getParameter("id").equals("25"))
                                {
                                %>Password is Sent !!!<%
                                }
                                else if(request.getParameter("id").equals("26"))
                                {
                                %>Item is already available in your Cart !!!<%
                                }
                                else if(request.getParameter("id").equals("27"))
                                {
                                %>Item is added in your Cart !!!<%
                                }
                                else
                                {
                               %>Thank you for signing in !!!<%
                                }
                            }
                            else
                            {
                              
                            }
                        %>
                        </h3>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
 </div>
