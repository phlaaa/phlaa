<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.util.ArrayList"%>
     <%@page import="myPackage.classes.user" --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>
<%@include file="bootstrap/bootstrap.jsp"%>
</head>
<style>
	h2,h4 {color: white;
	
	}
	.title
	{
		background: linear-gradient(60deg, #ffa726, #fb8c00);
		box-shadow: 0 4px 20px 0px rgba(0, 0, 0, 0.14), 0 7px 10px -5px rgba(233, 0, 0, 0.4);
		padding-top:17px;
		padding-left: 15px;
        font-size: 21px;
		border-radius: 4px;
		margin-left:15px;
		width:40%;
	}
	.card {

  box-shadow: 10px 10px 5px grey;
}
</style>
<body>

 <%
           User user=pDAO.getUserDetails(session.getAttribute("userId").toString());
           if(user.getType().endsWith("admin"))
           {
 %>
        <div class="container-fluid h-100">
		<div class="row">
			 <div class="col-sm-3 padding-0"style="background: rgba(213,0,0,.85);padding: 18px;">
					<center><h2 style="font-family: sans-serif;">Online Examination System</h2></center>
					<center><div class=" btn-group btn-group-vertical" style="margin-top: 110px;margin-bottom: 210px;">
						<a class="btn btn-outline-warning active btn-block btn-sm" href="adminPanel.jsp?pagepart=0"><h4>Profile</h4></a><br>
						<a class="btn btn-outline-warning btn-block btn-sm" href="adminPanel.jsp?pagepart=2"><h4>Courses</h4></a><br>
						<a class="btn btn-outline-warning btn-block btn-sm" href="adminPanel.jsp?pagepart=3"><h4>Questions</h4></a><br>
						<a class="btn btn-outline-warning  btn-block btn-sm" href="adminPanel.jsp?pagepart=1"><h4>Accounts</h4></a>
					</div>
				</center>
				</div>
				<div class="col-sm-9 padding-0">
					<div style="box-shadow:0 4px 20px 0px rgba(0, 0, 0, 0.14);">
		<center><h1 style="color: #CCCCCC;font-family: sans-serif;font-weight: bold;padding-left: 200px;">Admin Panel</h1></center>
		<a href="controller.jsp?page=logout" class="btn btn-danger" style="float:right;color:white">Logout</a>
	</div>
					
<% } else{ %>
				<div class="container-fluid h-100">
		<div class="row">
			 <div class="col-sm-3 padding-0"style="background: rgba(213,0,0,.85);padding: 18px;">
					<center><h2 style="font-family: sans-serif;">Online Examination System</h2></center>
					<center><div class=" btn-group btn-group-vertical" style="margin-top: 110px;margin-bottom: 210px;">
						<a class="btn btn-outline-warning active btn-block btn-sm" href="student.jsp?pagepart=0"><h4>Profile</h4></a><br>
						<a class="btn btn-outline-warning btn-block btn-sm" href="student.jsp?pagepart=2"><h4>Exam</h4></a><br>
						<a class="btn btn-outline-warning btn-block btn-sm" href="student.jsp?pagepart=3"><h4>Result</h4></a><br>
					</div>
				</center>
				</div>
				<div class="col-sm-9 padding-0">
					<div style="box-shadow:0 4px 20px 0px rgba(0, 0, 0, 0.14);">
		<center><h1 style="color: #CCCCCC;font-family: sans-serif;font-weight: bold;padding-left: 200px;">Student Panel</h1></center>
		<a href="controller.jsp?page=logout" class="btn btn-danger" style="float:right;color:white">Logout</a>
	</div>
	<div class="card" style="width: 40rem;">
           	
           	  	
					<%
           }
           if(request.getParameter("pedt")==null){
           %>
              <div class="title"><center>Profile</center></div>
           	  <div class="card-body">
           	  		<table class="table"> <tr><td>Your Name</td><td><%=user.getFirstName()+" " %><%=user.getLastName() %></td></tr>
           	  		<tr><td>Email</td><td><%=user.getEmail() %></td></tr>
           	  		<tr><td>Contact No</td><td><%=user.getContact() %></td></tr>
           	  		<tr><td>City</td><td><%=user.getCity() %></td></tr>
           	  		<tr><td>Address</td><td><%=user.getAddress() %></td></tr>
           	  		<tr><td> <%
               if(user.getType().equals("admin")){
               %><a class="btn btn-primary" href="adm-page.jsp?pgprt=0&pedt=1">Edit profile</a></td></tr></table>
                <% 
               }else{
               %><a class="btn btn-primary" href="student.jsp?pgprt=0&pedt=1">Edit profile</a></td></tr></table>
               <% 
               }
               %>
           
           <%
           }else{
               %>  <div class="title"><center>Edit Profile</center></div>
           	  <div class="card-body">
				
</body>
</html>