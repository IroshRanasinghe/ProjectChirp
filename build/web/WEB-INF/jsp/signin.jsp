<%-- 
    Document   : signin
    Created on : Dec 24, 2018, 5:11:22 PM
    Author     : IroshaNa Ranasinghe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--Bootstrap style-->       
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!--sweet alert-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <!--Anjular JS-->
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js">"></script>
        <title>Sign In</title>
    </head>
    <body>
        <!--NAVIGATION BAR-->
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.htm">CHiRP</a>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li ><a href="index.htm">Home</a></li>
                        <li><a href="postadd.htm">Post Ad</a></li>
                    </ul>

                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="Home.jsp"><span> </span></a></li>
                        <li><a href="signup.htm"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                            <%
                                if (request.getSession().getAttribute("user") == null) {
                            %>
                        <li><a href="signin.htm"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                            <%} else {%>
                        <li><a href="Logout.htm"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                            <%
                                }
                            %>

                    </ul>
                </div>
            </div>
        </nav>

        <div class="container">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h2>Sign In</h2>
                    </div>
                    <div class="panel-body">
                        <form action="Signin.htm" method="POST">
                            <center>
                                <img src="../img/user.png" alt="User Image" style="width: 50%;" class="img-responsive" />
                            </center>
                            <br>
                            <div class="form-group">
                                <input type="email" placeholder="Email here" name="email" ng-model="email" class="form-control" required/>
                                <span style="color: red;" ng-show="signinForm.email.$dirty && signinForm.email.$invalid">
                                    <span ng-show="signinForm.email.$error.required">Email is required.</span>
                                    <span ng-show="signinForm.email.$error.email">Invalid Email address.</span>
                                </span>
                            </div>
                            <div class="form-group">
                                <input type="password" placeholder="Password here" name="password" class="form-control" required/>
                                <span style="color: red;" ng-show="signinForm.password.$dirty && signinForm.password.$invalid">
                                    <span ng-show="signinForm.password.$error.required">Password is required</span>
                                </span>
                            </div>
                            <div class="form-group">
                                <input type="submit" value="Sign In" class="btn btn-danger btn-block" />
                            </div>

                        </form>
                    </div>
                </div>
                <div class="alert alert-danger fade in alert-dismissable">
                    <a href="#"  class="close" data-dismiss="alert" aria-label="close" style="text-decoration:none;">&times;</a>
                    <center>
                        <strong>Error!</strong><br>${error}
                    </center>
                </div>
                <h2></h2>
            </div>
            <div class="col-md-4"></div>
        </div>
        <!--jQuery 2.2.0-->
        <script src="../js/jquery-2.1.4.min.js" type="text/javascript"></script>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>

    </body>
</html>
