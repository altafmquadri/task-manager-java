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
<title>Add Task</title>
</head>
<body>
	<%
	User user = (User) session.getAttribute("user");
	if (user == null) {
		response.sendRedirect("/login");
	}
	%>
	<div class="container">
        <div>
            <nav class="navbar navbar-dark bg-dark">
                <div class="container-fluid">
                    <div>
                        <a class="navbar-brand" href="/<%=user.getName()%>/<%=user.getId()%>/tasks">Home</a>
                        <a class="navbar-brand" href="/logout">Logout</a>
                    </div>
                </div>
            </nav>
        </div>
        <div>
            <h1>Task Form</h1>
        </div>
        <div style="height: 25px;"></div>
        <div class="form-control">
            <h3 class="card text-center card-header">Please Add a New Task</h3>
            <div style="height: 15px;"></div>
            <div class="card-body">
                <form class="form-control" method="post" action="/${user.getName()}/${user.getId()}/task">
                    <div class="clearfix"> 
                        <input class="btn btn-primary btn-lg float-end" type="submit" value="Create Task">
                    </div>
            
                    <div class="mb-4">
                        <label class="form-label">Task Name</label> 
                        <input class="form-control" type="text" name="tname" required="required" > 
                    </div>

                    <div class="mb-4">
                        <label class="form-label">Description</label> 
                        <input class="form-control" type="text" name="description" required="required"> 
                    </div>

                    <div class="mb-4">
                        <label class="form-label">Priority</label>
                        <select class="form-select" name="priority">
                            <option value="high">High</option>
                            <option value="medium">Medium</option>
                            <option value="low">Low</option>
                        </select>
                    </div>

                    <div class="mb-4">
                        <label class="form-label">Start Date:</label>
                        <input class="form-control" type="date" name="startdate" pattern="yyyy-mm-dd" required="required">
                    </div>
                    <div class="mb-4">
                        <label class="form-label">End Date:</label>
                        <input class="form-control" type="date" name="enddate" pattern="yyyy-mm-dd" required="required">
                    </div>
                    
                </form>
            </div>
        </div>
    </div>
</body>
</html>