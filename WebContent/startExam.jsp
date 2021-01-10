<%@page import="entities.Questions"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:useBean id="pDAO" class="database.Exam" scope="page"/>
    <jsp:useBean id="pDAO1" class="database.questions" scope="page"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="bootstrap/bootstrap.jsp"%>
<style>
.show,.show-correct
{
	margin-left: 15px;
	border-radius: 5px;
	border:1px solid green;
	padding:5px;
	float: left;
	margin-top:20px;
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
</head>
<body>
<div class="container-fluid">
	<%
           if(session.getAttribute("examStarted")!=null){
               if(session.getAttribute("examStarted").equals("1")){
      %>
      <div class="row">
      <div class="col-md-3">
      		<span id="remainingTime" style="position: fixed;top:10px;float:right;font-size: 23px;background: rgba(255,0,77,0.38);border-radius: 5px;padding: 10px;box-shadow: 2px -2px 6px 0px;">
        </span>
        </div>
        </div>
        <div class="row" style="margin-top:80px;">
        <div class="col-md-12">
        <form action="controller.jsp">
                       
                       <%
                       ArrayList list=pDAO1.getQuestions(request.getParameter("coursename"),10);
                       	Questions question;
                       %>
                       <input type="hidden" name="size" value="<%=list.size()%>">
                       <input type="hidden" name="totalmarks" value="<%=pDAO.getTotalMarksByName(request.getParameter("coursename"))%>">
                       
                       <%
                       for(int i=0;i<list.size();i++){
                           question=(Questions)list.get(i);
                       %>
           
						<div class="card">
							<div class="card-header">
                             	<label style="font-size: 30px;font-weight: bolder;"><%=i+1 %>.</label>
								 <label style="font-size: 25px;font-weight: bolder;margin-left: 15px;font-style: italic;"><%=question.getQuestion() %></label>		
							</div>
						<div class="card-body">
							<input type="radio" id="c1<%=i%>" name="ans<%=i%>" value="<%=question.getOpt1()%>"/>
							<label for="c1<%=i%>"class="show"><%=question.getOpt1()%></label>
							<input type="radio" id="c2<%=i%>" name="ans<%=i%>" value="<%=question.getOpt2()%>" />
							<label for="c2<%=i%>"class="show"><%=question.getOpt2()%></label>
							<input type="radio" id="c3<%=i%>" name="ans<%=i%>" value="<%=question.getOpt3()%>" />
							<label for="c3<%=i%>"class="show"><%=question.getOpt3()%></label>
							<input type="radio"  id="c4<%=i%>" name="ans<%=i%>" value="<%=question.getOpt4()%>"/>
							<label for="c4<%=i%>"class="show" ><%=question.getOpt4()%></label>
							
						</div>
					</div>
                       <input type="hidden" name="question<%=i%>" value="<%=question.getQuestion()%>">
                       <input type="hidden" name="qid<%=i%>" value="<%=question.getQuestionId()%>">
                       
                       <br>
                       
                       <%
                       }
                       
                       %>
                   <input type="hidden" name="page" value="exams">
                   <input type="hidden" name="operation" value="submitted"> 
                   <input type="submit" class="btn btn-primary" value="Done">
               </form>
               
               
                
        
        
        
        
      <%
               }
           }
      %>
      </div>
      </div>
        </div>      
</body>

<script>
 var time = <%=pDAO.getRemainingTime(Integer.parseInt(session.getAttribute("examId").toString())) %>;
    time--;
    var sec=60;                    
    document.getElementById("remainingTime").innerHTML =  time+" : "+sec;
       //it calls fuction after specific time again and again                  
   var x= window.setInterval(timerFunction, 1000);
function timerFunction(){
        sec--;
  // Display the result in the element with id="demo"
  
 
  if (time < 0) {
    clearInterval(x);
    document.getElementById("remainingTime").innerHTML = "00 : 00";
    document.getElementById("myform").submit();
  }
  document.getElementById("remainingTime").innerHTML =  time+" : "+sec;
if(sec==0){
    sec=60;
    time--;
    
}
}
</script>

</html>