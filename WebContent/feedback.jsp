<%@page import="entities.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:useBean id="pDAO" class="database.add_delCourse" scope="page"/>  
    
    <jsp:useBean id="pDAO1" class="database.adduser" scope="page"/>    


<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  
<title>Insert title here</title>
<style>
.stars1 {
    width: 50%;
    margin:auto;
    margin-top:60px;
  border:1px solid black;
  text-align: center;
  padding:70px;
  box-shadow: 10px 10px 5px grey;
}

input.star { display: none; }

label.star {
  float: right;
  padding: 10px;
  font-size: 36px;
  color: #444;
  transition: all .2s;
}

input.star:checked ~ label.star:before {
  content: '\f005';
  color: #FD4;
  transition: all .25s;
}

input.star-1:checked ~ label.star:before {
  color: #FE7;
  text-shadow: 0 0 20px #952;
}

input.star-5:checked ~ label.star:before { color: #F62; }

label.star:hover { transform: rotate(-15deg) scale(1.3); }

label.star:before {
  content: '\f006';
  font-family: FontAwesome;
}
.h1 {
  font-size: 65	px;
  background: -webkit-linear-gradient(#eee, #333);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}
</style>
</head>
<body>
  <div class="container-fluid p-0">
    <h1 class="h1" style="box-shadow: 10px 10px 5px grey;"><img src="images/logo.jpg"height=100px>Online Examination System</h1>
    
  </div>

<%
           User user=pDAO1.getUserDetails(session.getAttribute("userId").toString());
 %>
<div class="stars1">
    <h2>Hi!! <%= user.getFirstName()+" "+user.getLastName() %></h2><br><br>
    <div class="stars col-md-9">
        <input class="star star-1" id="star-1" type="radio" name="star"/>
        <label class="star star-1" for="star-1"></label>
        <input class="star star-2" id="star-2" type="radio" name="star"/>
        <label class="star star-2" for="star-2"></label>
        <input class="star star-3" id="star-3" type="radio" name="star"/>
        <label class="star star-3" for="star-3"></label>
        <input class="star star-4" id="star-4" type="radio" name="star"/>
        <label class="star star-4" for="star-4"></label>
        <input class="star star-5" id="star-5" type="radio" name="star"/>
        <label class="star star-5" for="star-5"></label>   
    </div>
    <br><br>
    <textarea class="textarea form-control" rows="8" cols="60" placeholder="Any Suggestions?"></textarea> <br>
    <a href="controller.jsp?page=logout" class="btn btn-success" style="color:white">Submit</a>
</div>
</body>
</html>