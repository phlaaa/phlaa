<%@page import="entities.Questions"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList"%>
<jsp:useBean id="pDAO" class="database.questions" scope="page"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="bootstrap/bootstrap.jsp"%>
</head>
<style>
.show,.show-correct
{
	margin-left: 15px;
	border-radius: 5px;
	border:1px solid green;
	padding:5px;
	float: left;
}

.show-correct
{
 	background: linear-gradient(60deg, #66bb6a, #43a047);
    color: white;
    box-shadow: 1.5px 1.5px 1.5px green;
}
.card {
  box-shadow: 10px 10px 5px grey;
}
</style>
<body>
<div class="container-fluid">
			<div class="row" style="height:100%;">
				<div class="col-sm-3 "style="background: rgba(213,0,0,.85);padding: 18px;">
					<center><h2 style="font-family: sans-serif;">Online Examination System</h2></center>
					<center><div class=" btn-group btn-group-vertical" style="margin-top: 110px; margin-bottom: 210px;">
						<a class="btn btn-outline-warning btn-block btn-sm" href="adminPanel.jsp?pagepart=0"><h4>Profile</h4></a><br>
						<a class="btn btn-outline-warning btn-block btn-sm" href="adminPanel.jsp?pagepart=2"><h4>Courses</h4></a><br>
						<a class="btn btn-outline-warning active btn-block btn-sm" href="adminPanel.jsp?pagepart=3"><h4>Questions</h4></a><br>
						<a class="btn btn-outline-warning  btn-block btn-sm" href="adminPanel.jsp?pagepart=1"><h4>Accounts</h4></a>
					</div></center>
				</div>
				<div class="col-sm-9 scrollit">
					<%
           					if(request.getParameter("coursename")!=null){
               					ArrayList list=pDAO.getAllQuestions(request.getParameter("coursename"));
               					for(int i=0;i<list.size();i++){
                  					 Questions question=(Questions)list.get(i); 
                   %>
                   <div class="card">
						<div class="card-header" >
                             <label style="font-size: 30px;font-weight: bolder;"><%=i+1 %>.</label>
							 <label style="font-size: 25px;font-weight: bolder;margin-left: 15px;font-style: italic;"><%=question.getQuestion() %></label>		
							<a href="controller.jsp?page=questions&operation=delQuestion&qid=<%=question.getQuestionId() %>" class="btn btn-danger"style="float:right;">Delete</a>
                  		</div>
						<div class="card-body">
                            <label class="show"><%=question.getOpt1() %></label>
							<label class="show"><%=question.getOpt2() %></label>
							<label class="show"><%=question.getOpt3() %></label>
							<label class="show"><%=question.getOpt4() %></label>
						</div>
						<div class="card-footer">
							<label class="show-correct"><%=question.getCorrect() %></label>
						</div>
					</div>
                   
                   <%
               }
          } %>
				</div>	
</div>
</div>
</body>
</html>