<%@page import="com.task.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Task</title>
</head>
<body>
	<%
	User user = (User) session.getAttribute("user");
	if (user == null) {
		response.sendRedirect("/login");
	}
	%>
	<div>
		<div>
			<nav>
				<a href="/logout">Logout</a>
			</nav>
		</div>
		<div>
			<h1>Task Form</h1>
		</div>
		<div>
			<h3>Please Add a New Task</h3>
		</div>
		<div>
			<form method="post" action="/${user.getName()}/${user.getId()}/task">
				<label>Task Name</label> <input type="text" name="tname" required="required" > 
				<label>Description</label> <input type="text" name="description" required="required"> 
				<label>Priority</label>
				<select name="priority">
					<option value="high">High</option>
					<option value="medium">Medium</option>
					<option value="low">Low</option>
				</select>
				<label>Start Date:</label>
				<input type="date" name="startdate" pattern="yyyy-mm-dd">
				<label>End Date:</label>
				<input type="date" name="enddate" pattern="yyyy-mm-dd">
				<input type="submit" value="Create Task">
			</form>
		</div>
	</div>
</body>
</html>