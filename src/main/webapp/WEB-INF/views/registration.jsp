<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html>

    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU"
            crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
        <meta charset="ISO-8859-1">
        <title>Register</title>
    </head>

    <body>
        <div class="container">
            <div>
                <nav class="navbar navbar-dark bg-dark">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="login">Login</a>
                    </div>
                </nav>
            </div>

            <div class="form-control">
                <h1 class="card text-center card-header">
                    <em>Welcome to the Registration Page</em>
                </h1>
                
                <div class="card-body">    
                    <form class="form-control" method="post">

                        <div class="mb-4">
                            <label class="form-label">Name</label>
                            <input class="form-control" type="text" name="name" required="required">
                        </div>

                        <div class="mb-4">
                            <label class="form-label">Password</label> 
                            <input class="form-control" type="password" name="password" required="required">
                        </div>

                        <div class="mb-4">
                            <label class="form-label">Confirm Password</label> 
                            <input class="form-control" type="password" name="confirmation" required="required">
                        </div>

                        <input class="btn-primary" type="submit" value="Register">
                        
                    </form>
                </div>
            </div>

            <div style="height: 25px"></div>
            <div class="form-text">
                <h3>${message}</h3>
            </div>
        </div>
    </body>
    </html>