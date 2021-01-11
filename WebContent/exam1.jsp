<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:useBean id="pDAO" class="database.add_delCourse" scope="page"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="bootstrap/bootstrap.jsp"%>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-3 padding-0"style="background: rgba(213,0,0,.85);padding: 18px;">
			<center><h2 style="font-family: sans-serif;">Online Examination System</h2></center>
			<center>
				<div class=" btn-group btn-group-vertical" style="margin-top: 110px;margin-bottom: 210px;">
					<a class="btn btn-outline-warning btn-block btn-sm"  href="studentPanel.jsp?pagepart=0"><h4>Profile</h4></a><br>
					<a class="btn btn-outline-warning active btn-block btn-sm" href="studentPanel.jsp?pagepart=1"><h4>Exam</h4></a><br>
					<a class="btn btn-outline-warning btn-block btn-sm" href="studentPanel.jsp?pagepart=2"><h4>Result</h4></a><br>
				</div>
			</center>
		</div>
		
		<div class="col-sm-9">
				<div class="row">
					<div class="col-sm-5"style="top: 100px;height:auto;">
						<div class="card">
						 <form action="controller.jsp">
							<div class="title card-header">Select Course</div>
						<div class="card-body">
						           <input type="hidden" name="page" value="exams">
              					  <input type="hidden" name="operation" value="startexam">
                	<select name="coursename" class="form-control">
        <% 
            ArrayList list1=pDAO.getAllCourses();
            
            for(int i=0;i<list1.size();i=i+2){
        %>
        <option value="<%=list1.get(i)%>"><%=list1.get(i)%></option>
            <%
            }
            %>
            </select>
            <br>
            <input type="password" class="form-control"name="testkey" placeholder="Enter TestKey"/>
            </div>
            <div class="card-footer">
            <input type="submit" value="Take Exam" class="btn btn-outline-success btn-block">
            </div>
            </form>
         
        </div>
    			<% 
    				if(request.getSession().getAttribute("key").equals("-1")){
                %>
                            <script>alert("username or password is incorrect");</script>
               <%
               			request.getSession().setAttribute("key", "1");
    				}
               %>
	</div>
</div>

</body>
</html>