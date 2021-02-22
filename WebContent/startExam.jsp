<%@page import="java.io.IOException"%>
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

.card {
  box-shadow: 10px 10px 5px grey;
}
.box{
		postion:fixed;
        display:none;
}
ul{list-style-type: none;}
</style>
</head>
<body class="container-fluid">
<%
	if(session.getAttribute("examStarted")!=null)
	{
		if(session.getAttribute("examStarted").equals("1"))
		{
%>
<%
                       			ArrayList list=pDAO1.getQuestions(request.getParameter("coursename"),10);
                       			Questions question;
%>
		<div class="row">
      		<div class="container-fluid p-0"style="z-index:1000;">
     			<div class="row">
     				<div class="col-md-12" >
         				<h1 class="h1 row" style="box-shadow: 10px 10px 5px grey;position: fixed;width:101%;">
         					<div class="col-1">
         						<img src="images/logo.jpg"height=100px>
         					</div>
         					<div class="col-1 mt-3">
         						<h1><% String str =  request.getParameter("coursename"); str = str.toUpperCase(); %><%= str %></h1>
         					</div>
         					<div  class="col-2 mt-3">
         						<h4>
         							<p>Max. Marks :- <%= pDAO.getTotalMarksByName(request.getParameter("coursename")) %></p>
         							<p>Total Questions :- <%= list.size() %></p></h4>
         					</div>
         					<div class="col-2">
         					               				
                   				<input type="submit" class="btn btn-primary" value="Submit">
         					</div>
         					<div class="col-6 p-3">
      					 		<span id="remainingTime" style="margin-left:80%;margin-top:15px;font-size: 23px;background: rgba(255,0,77,0.38);border-radius: 5px;padding: 10px;box-shadow: 2px -2px 6px 0px;">
        						</span>
        					</div>
        				</h1>
        			</div>
        		</div>
    		</div>
    		</div>
    		<br><br><br><br><br><br>
    		<div class="row">
    		<div class="container-fluid">
        			<form action="controller.jsp"id="myform">
                       		
                       		<input type="hidden" name="size" value="<%=list.size()%>"id="size">
                       		<input type="hidden" name="totalmarks" value="<%=pDAO.getTotalMarksByName(request.getParameter("coursename"))%>">
                       		<%
                       			for(int i=0;i<list.size();i++)
                       			{
                    	   			question=(Questions)list.get(i);
                       		%>
                       		<div class="row box" id="card<%=i%>"style="height:330px;">
           						<div class="col-6"style="border-right:3px solid grey;padding:20px;">
										<div>
			                             	<h2><%=i+1 %>. <%=question.getQuestion() %></h2>		
										</div>
								</div>
								<div class="col-6" style="padding:30px;">
									<ul>
										<li><input type="radio" id="c1<%=i%>" name="ans<%=i%>" value="<%=question.getOpt1()%>"/>
										<label for="c1<%=i%>"class="show"><%=question.getOpt1()%></label></li><br>
										<li><input type="radio" id="c2<%=i%>" name="ans<%=i%>" value="<%=question.getOpt2()%>" />
										<label for="c2<%=i%>"class="show"><%=question.getOpt2()%></label></li><br>
										<li><input type="radio" id="c3<%=i%>" name="ans<%=i%>" value="<%=question.getOpt3()%>" />
										<label for="c3<%=i%>"class="show"><%=question.getOpt3()%></label></li><br>
										<li><input type="radio"  id="c4<%=i%>" name="ans<%=i%>" value="<%=question.getOpt4()%>"/>
										<label for="c4<%=i%>"class="show" ><%=question.getOpt4()%></label></li>
							
									</ul>
					
								</div>
							</div>
							
		                       <input type="hidden" name="question<%=i%>" value="<%=question.getQuestion()%>">
        		               <input type="hidden" name="qid<%=i%>" value="<%=question.getQuestionId()%>">       
                       		<%
                      			 }
                       		%>
                       				
               				<div style="float:right;">
                 				<a class="btn btn-primary" id="next">Next</a>
        		 				<a class="btn btn-danger" id="prev">Prev</a>
        					</div>
                   				<input type="hidden" name="page" value="exams">
                   				<input type="hidden" name="operation" value="submitted">                   				
                   				<input type="submit" class="btn btn-primary" value="Submit">
                  
               			</form>
               			
      <%
               }
           }
      %>
      </div>  
      </div> 
</body>


<script>
 document.getElementById("card0").style.display = "flex";
 var i=1;
 var size=document.getElementById("size").value;
 var next = document.getElementById("next");
 next.addEventListener("click",function(){
	 if(i<size){
	 document.getElementById("card"+i).style.display = "flex";
	 if(i!=0) document.getElementById("card"+(i-1)).style.display = "none";
		i=i+1;
	 }
 });
 var prev = document.getElementById("prev");
 prev.addEventListener("click",function(){
	 if(i>0){
		 if(i==size)i=i-1;
		 else{
	 document.getElementById("card"+i).style.display = "none";
	 document.getElementById("card"+(i-1)).style.display = "flex";
		i=i-1;
		 }
	 }
 });
  

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