<%@page import="com.task.model.Task" %>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="com.task.model.User" %>
<!DOCTYPE html>
<html>

<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>Tasks</title>
</head>

<body>
    <% 
    User user=(User) session.getAttribute("user"); 
    if (user==null) { 
    	response.sendRedirect("/login");
        }     
    %>
        <div class="container">

            <div>
                <nav class="navbar navbar-dark bg-dark">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="/logout">Logout</a>
                    </div>
                </nav>
            </div>

            <div>
                <h1>Activities</h1>
            </div>
            <div style="height: 50px;"></div>
            <div>
                <h1>
                    Welcome <span style="text-transform: capitalize;">${user.getName()}</span>
                </h1>
            </div>

            <div>
                <div style=" height: 10px;"></div>
                
                <div class="clearfix">
                    <a class="btn btn-primary btn-large float-end"
                        href="/${user.getName()}/${user.getId()}/addtask">Add Task</a>
                </div>

                <div style="height: 15px;"></div>
            </div>

            <div>
                <table class="table table-light table-striped table-bordered table-sm" style="text-align: center;">
                    <tr class="table-dark">
                        <th>Task Name</th>
                        <th>Description</th>
                        <th>Priority</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th colspan="2">Update Task</th>
                    </tr>

                    <% @SuppressWarnings("unchecked") List<Task> tasks = (List<Task>)
                            session.getAttribute("tasks");

                            for (Task t : tasks) {
                            %>
                            <tr class="table align-middle" style="text-align: center">
                                <td> <%=t.getName()%></td>
                                <td><%=t.getDescription()%></td>
                                <td><%=t.getPriority()%></td>
                                <td><%=t.getStartDate().toString().substring(0,10)%></td>
                                <td><%=t.getEndDate().toString().substring(0,10) %></td>
                                <td> <a class="btn btn-success" href="/${user.getName()}/${user.getId()}/edittask/<%= t.getId()%>">Edit</a></td>
                                <td><a class="btn btn-danger" href="/${user.getName()}/${user.getId()}/deletetask/<%= t.getId()%>">Delete</a></td>
                            </tr>
                            <% } %>
                </table>
            </div>
        </div>
</body>
</html>