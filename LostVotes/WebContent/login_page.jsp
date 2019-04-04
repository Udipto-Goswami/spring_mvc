<!DOCTYPE html>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/typicons/2.0.9/typicons.min.css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<title>Login Form</title>
<!------ Include the above in your HEAD tag ---------->

</head>
<style>
<%@include file="/resources/css/loginstyle.css"%>
</style>
<body>
<div style="position:relative;width:100%;text-align:right; margin-top:40px;margin-left:-40px;">
<a href="index.jsp" name="register" class="btn btn-secondary" style="background-color:#31373a;border-radius:250px;height:40px;width:40px;">
<i class="typcn typcn-arrow-back"></i>
</a>
</div>

<div class="sidenav">
         <div class="login-main-text">
            <h2>Welcome<br>You have to Login.</h2>
            <p>Please Login in to continue.</p>
            <% 
            
            response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
            int status=-2;
            if(request.getParameter("login") == null){
            	
            }
            else{
            	
            	 status =Integer.parseInt(request.getParameter("login"));
            	//loginsuccessfull
            if(status ==1){
            	out.print("<p class='bg-success'>Login Successfull.</p>");
            	response.sendRedirect("dashboard.jsp");
            }
          //invaliddetails
            else if(status == 2){
            	out.print("<p class='bg-danger'>Invalid Credentials</p>");
            	status=-2;	
            	response.setHeader("Refresh"," 5;url=login_page.jsp");
            	
            }
          //loginrequired
            else if(status == 3){
            	out.print("<p class='bg-warning'>Login in Required!</p>");
            	status=-2;	
            	response.setHeader("Refresh"," 5;url=login_page.jsp");
            }
          //loggedout
            else if(status == 4){
            	out.print("<p class='bg-info'>Successfully Logged Out</p>");
            	status=-2;	
            	response.setHeader("Refresh"," 5;url=login_page.jsp");
            }
            //filldetails
            else if(status ==0){
            	out.print("<p class='bg-danger'>Fill the Details</p>");
            	status=-2;	
            	response.setHeader("Refresh"," 5;url=login_page.jsp");

            }
			}	
            
            %>
            
         </div>
      </div>
      <div class="main">
         <div class="col-md-6 col-sm-12">
            <div class="login-form">
               <form action="login" method="POST">
            
                  <div class="form-group">
                     <label>User Name</label>
                     <input type="text" class="form-control" placeholder="User Name" name="username">
                  </div>
                  <div class="form-group">
                     <label>Password</label>
                     <input type="password" class="form-control" placeholder="Password" name="password">
                  </div>
                  <button type="submit" name="login" class="btn btn-black">Login</button>
                  <a href="register_page.jsp" name="register" class="btn btn-secondary">Sign Up</a>
               </form>
            </div>
         </div>
      </div>
      
   </body>
   </html>   
      