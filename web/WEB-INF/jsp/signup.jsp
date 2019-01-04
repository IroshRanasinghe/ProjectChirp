<%-- 
    Document   : signup
    Created on : Dec 24, 2018, 1:29:35 PM
    Author     : IroshaNa Ranasinghe
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--Bootstrap style-->       
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body ng-app="">
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

        <div class="col-xs-3"></div>
        <div class="op col-xs-6">
            <c:choose>
                <c:when test="${not empty error}">
                    <div class="alert alert-danger alert-dismissible" role="alert">
                        <a class="close" data-dismiss="alert" aria-label="close" style="text-decoration:none;">&times;</a>
                        <center>
                            <strong>Error!</strong><br>${error}
                        </center>
                    </div>
                </c:when>
            </c:choose>
            <div class="panel panel-success">
                <div class="panel-heading"><h2>Sign Up</h2></div>

                <form action="Signup.htm" method="POST" name="signupForm">
                    <div class="panel-body" >
                        <div class="form-group">
                            <!--<span ng-show="myForm.myName.$touched && myForm.myName.$invalid">The name is required.</span>-->
                            Full Name*<input type="text" class="form-control" name="name" placeholder="Enter your Full Name" required autofocus ng-model="name">
                            <span style="color: red;" ng-show="signupForm.name.$dirty && signupForm.name.$invalid">
                                <span ng-show="signupForm.name.$error.required">Name is required.</span>
                            </span>
                        </div>

                        <div class="form-group">
                            <label>Email*</label>
                            <input type="email" class="form-control" name="email" placeholder="Enter Email" ng-model="email" required/>
                            <span style="color: red;" ng-show="signupForm.email.$dirty && signupForm.email.$invalid">
                                <span ng-show="signupForm.email.$error.required">Email is required.</span>
                                <span ng-show="signupForm.email.$error.email">Invalid Email address.</span>
                            </span>
                            <div class="alert alert-danger" role="alert"><b>Note:</b> This email will be your <b>loging Email </b>!</div>
                        </div>

                        <div class="form-group">
                            <label>Contact No</label>
                            <input type="text" class="form-control validate" name="contact" placeholder="Enter Contact">
                        </div>

                        <div class="form-group">
                            <label>Password*</label>
                            <input id="pw1" type="password" class="form-control validate" ng-model="pw1" name="pw1" placeholder="Enter Password"  required/>
                            <span style="color: red;" ng-show="signupForm.pw1.$dirty && signupForm.pw1.$invalid">
                                <span ng-show="signupForm.pw1.$error.required">Password is required</span>
                            </span>

                        </div>
                        <div class="form-group">
                            <label>Conform Password*</label>
                            <input id="pw2" type="password"  onblur="checkPW();" ng-model="pw2" class="form-control validate" name="pw2" placeholder="Enter Conform Password" required/>
                            <span style="color: red;" ng-show="signupForm.pw2.$dirty && signupForm.pw2.$invalid">
                                <span ng-show="signupForm.pw2.$error.required">Password is required</span>
                            </span>
                            <p style="color: orange;" id="cp"></p>
                        </div>


                        <div class="col-md-3"></div>
                        <div class="col-md-3"></div>
                        <div class="col-md-3"></div>
                        <div class="col-md-3"><input type="submit" name="reg" ng-disabled="signupForm.name.$dirty && signupForm.name.$invalid || signupForm.email.$dirty && signupForm.email.$invalid" value="Register" class="btn btn-danger btn-xm" style="float: right"/></div>


                        <br>
                        <br>
                        <br>

                    </div>
                </form>
            </div>
        </div>
        <div class="col-xs-3"></div>

        <script type="text/javascript">
            function checkPW() {
            var pw1 = document.getElementById('pw1').value;
            var pw2 = document.getElementById('pw2').value;
            if (pw1 !== pw2) {
                document.getElementById('cp').innerHTML = "Password does not match";
                }
            }
        </script>
        <script src="../js/jquery-2.1.4.min.js" type="text/javascript"></script>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
        <!--Anjular JS-->
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
    </body>
</html>
