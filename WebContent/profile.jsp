<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.util.ArrayList"%>
     <%@page import="entities.User" %>
      <jsp:useBean id="pDAO" class="database.adduser" scope="page"/>
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
 %>
       <div class="container-fluid ">
       		<div class="row">
<%
           if(user.getType().endsWith("admin"))
           {
 %>
				
					 <div class="col-sm-3 padding-0"style="background: rgba(213,0,0,.85);padding: 18px;">
						<center><h2 style="font-family: sans-serif;">Online Examination System</h2></center>
						<center>
							<div class=" btn-group btn-group-vertical" style="margin-top: 110px;margin-bottom: 210px;">
								<a class="btn btn-outline-warning active btn-block btn-sm" href="adminPanel.jsp?pagepart=0"><h4>Profile</h4></a><br>
								<a class="btn btn-outline-warning btn-block btn-sm" href="adminPanel.jsp?pagepart=2"><h4>Courses</h4></a><br>
								<a class="btn btn-outline-warning btn-block btn-sm" href="adminPanel.jsp?pagepart=3"><h4>Questions</h4></a><br>
								<a class="btn btn-outline-warning  btn-block btn-sm" href="adminPanel.jsp?pagepart=1"><h4>Accounts</h4></a>
							</div>
						</center>
					</div>
						
					
<% }
           else
           {
%>
				 <div class="col-sm-3 padding-0"style="background: rgba(213,0,0,.85);padding: 18px;">
					<center><h2 style="font-family: sans-serif;">Online Examination System</h2></center>
					<center>
						<div class=" btn-group btn-group-vertical" style="margin-top: 110px;margin-bottom: 210px;">
							<a class="btn btn-outline-warning active btn-block btn-sm" href="student.jsp?pagepart=0"><h4>Profile</h4></a><br>
							<a class="btn btn-outline-warning btn-block btn-sm" href="student.jsp?pagepart=2"><h4>Exam</h4></a><br>
							<a class="btn btn-outline-warning btn-block btn-sm" href="student.jsp?pagepart=3"><h4>Result</h4></a><br>
						</div>
					</center>
				</div>
			
<%
      }
     if(request.getParameter("pedt")==null){
%>	
		<div class="card" style="width: 70%;margin-left:20px;height:50%;">
              <div class="title card-header"><center>Profile</center></div>
           	  <div class="card-body">
           	  		<table class="table table-striped table-hover"> <tr><td>Your Name</td><td><%=user.getFirstName()+" " %><%=user.getLastName() %></td></tr>
           	  		<tr><td>Email</td><td><%=user.getEmail() %></td></tr>
           	  		<tr><td>Contact No</td><td><%=user.getContact() %></td></tr>
           	  		<tr><td>City</td><td><%=user.getCity() %></td></tr>
           	  		<tr><td>Address</td><td><%=user.getAddress() %></td></tr>
           	  		</table>
           	  	<%
               if(user.getType().equals("admin")){
               %><a class="btn btn-primary" href="adm-page.jsp?pgprt=0&pedt=1">Edit profile</a>
                <% 
               }else{
               %><a class="btn btn-primary" href="student.jsp?pgprt=0&pedt=1">Edit profile</a>
               <% 
               			}
     				}
               %>
           </div>
			</div>
					
	</div>          
</div>    
           
				
</body>
</html>