<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.task.model.Task"%>
<%@page import="com.task.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Task</title>
</head>
<body>
	<%
	User user = (User) session.getAttribute("user");
	if (user == null) {
		response.sendRedirect("/login");		
	}
		Task t = (Task) request.getAttribute("task");
		DateFormat format = new SimpleDateFormat("YYYY-MM-DD");
		String sDate = format.format(t.getStartDate());
		String eDate = format.format(t.getEndDate());
	%>
	<div>
		<div>
			<nav>
				<a href="/logout">Logout</a>
			</nav>
		</div>
		<div>
			<h1>Task Edit Form</h1>
		</div>
		<div>
			<h3>Please Make Changes and Save Task</h3>
		</div>
		<div>
			<form method="post" action="/${user.getName()}/${user.getId()}/edittask/${task.getId()}">
				<label>Task Name</label> <input type="text" name="tname" value="${task.getName()}" required="required" > 
				<label>Description</label> <input type="text" name="description" value="${task.getDescription()}" required="required"> 
				<label>Priority</label>
				<select name="priority">
					<option value="low">Low</option>
					<option value="medium">Medium</option>
					<option value="high">High</option>
				</select>
				<label>Start Date:</label>
				<input type="date" name="startdate"value="<%=sDate%>">
				<label>End Date:</label>
				<input type="date" name="enddate" value="<%=eDate%>">
				<input type="submit" value="Save Task">
				<button>Cancel</button>
			</form>
		</div>
	</div>
</body>
</html>