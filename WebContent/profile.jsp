<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.util.ArrayList"%>
     <%--@page import="myPackage.classes.user" --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>
<%@include file="bootstrap/bootstrap.jsp"%>
</head>
<body>

 <%-- checking admin student
           User user=pDAO.getUserDetails(session.getAttribute("userId").toString());
           if(user.getType().endsWith("admin")){
        --%>
        <div class="container-fluid">
			<div class="row" style="height:100%;">
       <div class="col-sm-3"style="background: rgba(213,0,0,.85);padding: 18px;">
					<center><h2 style="font-family: sans-serif;">Online Examination System</h2></center>
					<center><div class=" btn-group btn-group-vertical" style="margin-top: 110px;">
						<a class="btn btn-outline-warning active btn-block btn-sm" href="adminPanel.jsp?pagepart=0"><h4>Profile</h4></a><br>
						<a class="btn btn-outline-warning btn-block btn-sm" href="adminPanel.jsp?pagepart=2"><h4>Courses</h4></a><br>
						<a class="btn btn-outline-warning btn-block btn-sm" href="adminPanel.jsp?pagepart=3"><h4>Questions</h4></a><br>
						<a class="btn btn-outline-warning  btn-block btn-sm" href="adminPanel.jsp?pagepart=1"><h4>Accounts</h4></a>
					</div></center>
				</div>
				</div>
				</div>
				
</body>
</html>