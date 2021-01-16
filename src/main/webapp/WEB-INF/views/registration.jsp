<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
</head>
<body>
	<div>
	<div>
		<nav>
			<a href="login">Login</a>
		</nav>
	</div>
		<div>
			<h1>Welcome to the Registration Page</h1>
		</div>
		<div><h3>${message}</h3></div>
		<div>
			<form method="post">
				<label>Name</label>
				<input type="text" name="name" required="required">
				<label>Password</label>
				<input type="password" name="password" required="required">
				<label>Confirm Password</label>
				<input type="password" name="confirmation" required="required">
				<input type="submit" value="Register">
			</form>
		</div>
	</div>
</body>
</html>