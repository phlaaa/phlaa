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
         					<div class="col-md-2">
         						<img src="images/logo.jpg"height=100px>
         					</div>
         					<div class="col-md-1 mt-3">
         						<h1><% String str =  request.getParameter("coursename"); str = str.toUpperCase(); %><%= str %></h1>
         					</div>
         					<div class="col-md-7 p-3">
         						<span id="remainingTime" style="float:right;margin-top:15px;font-size: 23px;background: rgba(255,0,77,0.38);border-radius: 5px;padding: 10px;box-shadow: 2px -2px 6px 0px;">
        						</span>
         					</div>
         					<div class="col-md-2">
      					 		<video id="video" style="width:130px; height:115px;float:right;" autoplay></video>
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
                   				<a class="btn btn-primary" value="Submit"data-toggle="modal" data-target="#exampleModalCenter">Finish Test</a>
                  						<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
										  <div class="modal-dialog modal-dialog-centered" role="document">
										    <div class="modal-content">
										      <div class="modal-header">
										        <h5 class="modal-title" id="exampleModalCenterTitle">Are You Sure To Finish Test???</h5>
										        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
										          <span aria-hidden="true">&times;</span>
										        </button>
										      </div>
										      <div class="modal-footer">
										        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
										        <button type="submit" class="btn btn-primary">Finish</button>
										      </div>
										    </div>
										  </div>
										</div>
								    
               			</form>
               			
      <%
               }
           }
      %>
      </div>  
      </div> 
		    
	
    
      <span class="alert alert-danger"id="alert" style="float: right;margin-top:30px;">
    		<strong>Warning!</strong> Dont't Switch Tab!!!!   
  	</span>
  	
  	
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

var count = 0;
document.getElementById("alert").style.display="none";
document.addEventListener("visibilitychange", event => {
	  if (document.visibilityState == "visible") {
	    console.log("tab is active")
	    if(count>0)
	    {
	    	document.getElementById("alert").style.display="block";
	    	setTimeout(() => {
				document.getElementById("alert").style.display="none";
			}, 5000);
	    }
	    
	  } else {
		  count++;
	    console.log("tab is inactive");
	  }
	  //if(count==5){
		//  document.getElementById("myform").submit();
	  //}
		  
	})
	
	
	
	var video = document.getElementById('video');

// Get access to the camera!
if(navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
    navigator.mediaDevices.getUserMedia({ video: true }).then(function(stream) {
        video.srcObject = stream;
        video.play();
    });
}
//var canvas = document.getElementById('canvas');
//var context = canvas.getContext('2d');
//var video = document.getElementById('video');

// Trigger photo take
//document.getElementById("snap").addEventListener("click", function() {
	//context.drawImage(video, 0, 0, 640, 480);
//});
window.history.forward(); 
  function noBack() {
	  window.history.forward(); 
} 
</script>

</html>