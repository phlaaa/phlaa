<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
</style>
</head>
<body>
	<div class="container mt-4">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header bg-success">
						<h1>Create Account</h1>
					</div>
					<div class="card-body">
					<div class="form group">
<form action="kamal1" method="post">
	<label for="username"><i class="fa fa-user" aria-hidden="true"></i> Username</label>
 <input type="text" class=" form-control"name="username" placeholder="Enter username" required>
<label><i class="fa fa-key" aria-hidden="true"></i> Password </label><input type="password" class=" form-control" name="password" placeholder="Enter Password" required>
<label><i class="fa fa-envelope" aria-hidden="true"></i> Email </label> <input type="text" class=" form-control" name="email" placeholder="Enter Email" required>
<label><i class="fa fa-calendar" aria-hidden="true"></i> Age</label><input type="number" class=" form-control" name="age" placeholder="Enter age" required>
<label><i class="fa fa-male" aria-hidden="true"></i> Male</label> <input type="radio" value="male"name="gender" required>  
  <label><i class="fa fa-female" aria-hidden="true"></i>Female</label> <input type="radio" value="female" name="gender" required><br>
<label><i class="fa fa-briefcase" aria-hidden="true"></i> Occupation </label> <input type="text"class=" form-control" name="occupation" placeholder="Enter Occupation" required>
<label><i class="fa fa-home" aria-hidden="true"></i> Address </label><input type="number" class=" form-control"name="salary" placeholder="Enter Address" required> <br>
 Admin <input type="radio"name="type"  value="admin"required>
                                    Teacher <input type="radio"name="type" value="teacher"required>
                                    Student<input type="radio"name="type" value="student"required>
                                    <br> <br>
<div class="text-center">
<input  class="btn btn-primary" type="submit" Value="Create" name="create">
<a class="btn btn-success" href="login.jsp"><i class="fa fa-sign-in" aria-hidden="true"></i> login</a>
</div>
</form>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>