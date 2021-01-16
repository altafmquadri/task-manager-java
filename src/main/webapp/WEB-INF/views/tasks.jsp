<%@page import="com.task.model.Task"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.task.model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tasks</title>
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
				<a href="/register">Registration</a> <a href="/logout">Logout</a>
			</nav>
		</div>
		<div>
			<h1>Activities</h1>
		</div>
		<div>
			<h1>
				Welcome <span>${user.getName()}</span>
			</h1>
		</div>
		<div>
			<a href="/${user.getName()}/${user.getId()}/addtask">Add Task</a>
		</div>
		<div>
			<table border='1' style="width: 40%">
				<tr>
					<th>Task Name</th>
					<th>Description</th>
					<th>Priority</th>
					<th>Start Date</th>
					<th>End Date</th>
					<th colspan="2">Update Task</th>
				</tr>

				<%
				@SuppressWarnings("unchecked")
				List<Task> tasks = (List<Task>) session.getAttribute("tasks");

				for (Task t : tasks) {
				%>
				<tr style="text-align: center">
					<td><%=t.getName()%></td>
					<td><%=t.getDescription()%></td>
					<td><%=t.getPriority()%></td>
					<td><%=t.getStartDate().toString().substring(0,10)%></td>
					<td><%=t.getEndDate().toString().substring(0,10) %></td>
					<td><button> <a href="/${user.getName()}/${user.getId()}/edittask/<%= t.getId()%>">Edit</a></button></td>
					<td><button>Delete</button></td>
				</tr>
				<%
				}
				%>
			</table>
		</div>
	</div>
</body>
</html>