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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
<title>Edit Task</title>
</head>
<body>
	<%
	User user = (User) session.getAttribute("user");
	if (user == null) {
		response.sendRedirect("/login");		
	}
		Task t = (Task) request.getAttribute("task");
		DateFormat format = new SimpleDateFormat("YYYY-MM-d");
		String sDate = format.format(t.getStartDate());
		String eDate = format.format(t.getEndDate());
	%>
	<div class="container">
		<div class="navbar navbar-dark bg-dark">
            <div class="container-fluid">
                <nav>
                    <a class="navbar-brand" href="/<%=user.getName()%>/<%=user.getId()%>/tasks">Home</a>
                    <a class="navbar-brand" href="/logout">Logout</a>
                </nav>
            </div>
        </div>
        <div style="height: 25px;"></div>
		<div class="form-control">
            <h1>Edit Task Form</h1>
            <div style="height: 25px;"></div>
            
            <div class="form-control">
                <form class="form-control" method="post" action="/${user.getName()}/${user.getId()}/edittask/${task.getId()}">
                    <div class="card-body">
                        
                        <div class="clearfix"> 
                            <div class="clearfix" >
                                <button style="margin-left:10px;" class="btn btn-warning btn-lg float-end">Cancel</button>
                                <input class="btn btn-primary btn-lg float-end" type="submit" value="Save">
                            </div>
                        </div>
                        <div class="mb-4">
                            <label class="form-label">Task Name</label> 
                            <input class="form-control" type="text" name="tname" value="${task.getName()}" required="required" > 
                        </div>

                        <div class="mb-4">
                            <label class="form-label">Description</label> 
                            <input class="form-control" type="text" name="description" value="${task.getDescription()}" required="required"> 
                        </div>

                        <div class="mb-4">
                            <label class="form-label">Priority</label>
                            <select class="form-select" name="priority">
                                <option value="low">Low</option>
                                <option value="medium">Medium</option>
                                <option value="high">High</option>
                            </select>
                        </div>

                        <div class="mb-4">
                            <label class="form-label">Start Date:</label>
                            <input class="form-control" type="date" name="startdate"value="<%=sDate%>" required="required">
                        </div>

                        <div class="mb-4">
                            <label class="form-label">End Date:</label>
                            <input class="form-control" type="date" name="enddate" value="<%=eDate%>" required="required">
                        </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
</body>
</html>