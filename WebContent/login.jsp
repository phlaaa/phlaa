<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login </title>
<%@include file="bootstrap/bootstrap.jsp"%>
<style>
.card {

  box-shadow: 10px 10px 5px grey;
}
</style>
</head>
<body>
	<div class="container mt-5">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header bg-success">
						<h1>Login </h1>
					</div>
					<div class="card-body">
<form action="kamal" method="post">
	<div class="form-group">
		<label for="username"><i class="fa fa-user" aria-hidden="true"></i>  Username</label>
 <input type="text" class="form-control" name="username" placeholder="Enter username"required>
 </div>
 <div class="form-group">
 <label for="password"><i class="fa fa-key" aria-hidden="true"></i> Password</label>
 <input type="password" class="form-control" name="password"  placeholder="Enter password" required>
 </div>
 <div class="text-center">
<input class="btn btn-danger"type="submit" Value="Login" name="click">
<a  class="btn btn-primary" href="signup.jsp"><i class="fa fa-user-plus" aria-hidden="true"></i> signup</a>
</div>



</form>
</div>
</div>
</div>
</div>
</div>
</body>
</html>