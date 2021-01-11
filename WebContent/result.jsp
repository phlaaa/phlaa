<%@page import="entities.Answers"%>
<%@page import="entities.Exams"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.util.ArrayList"%>
<jsp:useBean id="pDAO" class="database.result" scope="page"/>
<!DOCTYPE html>
<html>
<head>
<%@include file="bootstrap/bootstrap.jsp"%>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-3 padding-0"style="background: rgba(213,0,0,.85);padding: 18px;">
			<center><h2 style="font-family: sans-serif;">Online Examination System</h2></center>
			<center>
				<div class=" btn-group btn-group-vertical" style="margin-top: 110px;margin-bottom: 210px;">
					<a class="btn btn-outline-warning btn-block btn-sm"  href="studentPanel.jsp?pagepart=0"><h4>Profile</h4></a><br>
					<a class="btn btn-outline-warning  btn-block btn-sm" href="studentPanel.jsp?pagepart=2"><h4>Exam</h4></a><br>
					<a class="btn btn-outline-warning active btn-block btn-sm" href="studentPanel.jsp?pagepart=3"><h4>Result</h4></a><br>
				</div>
			</center>
		</div>
		
		<div class="col-sm-9">
		
    <table class="table table-hover table-striped" >
    <thead>
    	<tr>
        	<th scope="col" class="rounded-company">Date</th>
            <th scope="col" class="rounded-q1">Course</th>
            <th scope="col" class="rounded-q2">Time</th>
            <th scope="col" class="rounded-q3">Status</th>
            <th scope="col" class="rounded-q4">Action</th>
        </tr>
    </thead>
        
    <tbody>
        
        <%
            ArrayList list=pDAO.getAllResultsFromExams(Integer.parseInt(session.getAttribute("userId").toString()));
            for(int i=0;i<list.size();i++){
                Exams e=(Exams)list.get(i);
            %>
    	<tr>
            <td><%=e.getDate() %></td>
            <td><%=e.getcName() %></td>
            <td><%=e.getStartTime()+" - "+e.getEndTime()%></td>
            <% if(e.getStatus()!=null){
                if(e.getStatus().equals("Pass")){%>
                <td style="background:green;color:white"><%=e.getStatus()%></td>
            <% }else{%>
            <td style="background: #ff3333;color:white"><%=e.getStatus()%></td>
            <% }
            }else{%>
            <td style="background: bisque ;">Terminated</td>
            <% } %>
			<td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">Details</button>
			
						<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						  <div class="modal-dialog modal-dialog-centered" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLongTitle"><%=e.getcName() %></h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      <div class="modal-body">
						      
						       <table class="table table-striped">
			                
			                <%
			                ArrayList list1=pDAO.getAllAnswersByExamId(e.getExamId());
			                for(int j=0;j<list1.size();j++){
			                    Answers a=(Answers)list1.get(j);
			                
			          	  %>
			
			            
			                <tr>
			                    <td rowspan="2"><%=j+1 %>)</td>
			                    <td colspan="2"><%=a.getQuestion()%></td>
			                    <td rowspan="2"><%=a.getStatus() %></td>
			                </tr>
			                <tr >
			                    <td><%="Your Ans: "+a.getAnswer()%></td>
			                    <td><%="Correct Ans: "+a.getCorrectAns() %></td>
			                </tr>
			                <tr>
			                    <td colspan="3" style="background: white"></td>
			                <%
			                }
			                %>
			            </table>
                
			      </div>
			    </div>
			  </div>
			</div>
			</td>
        </tr>
       
       <% }
       %>
    </tbody>
</table>                            </div>
		
		</div>
   
</body>
</html>