<%-- 
    Document   : signup
    Created on : Dec 24, 2018, 1:29:35 PM
    Author     : IroshaNa Ranasinghe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--Bootstrap style-->       
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!--sweet alert-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    </head>

    <body>
        <div >
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
            </nav>

            <form action="Signup.htm" method="POST">
                <div class="col-xs-3"></div>
                <div class="op col-xs-6">
                    <div class="panel panel-success">
                        <div class="panel-heading"><h2>Sign Up</h2></div>

                        <div class="panel-body">
                            <div class="form-group">
                                Name<input type="text" class="form-control" name="name" placeholder="Enter Name" required autofocus value="">
                                <div class="alert alert-danger" role="alert"><b>Note:</b> This email will be your <b>loging username </b>!</div>
                            </div>

                            <div class="form-group">
                                Email<input type="email" class="form-control" name="email" placeholder="Enter Email" value="" required/>
                            </div>

                            <div class="form-group">
                                Contact No<input id = "contact" type="text" class="form-control" name="contact" placeholder="Enter Contact" required>
                            </div>

                            <div class="form-group">
                                Password<input id="pw1" type="password" class="form-control" name="pw1" placeholder="Enter Password"  required/>
                            </div>
                            <div class="form-group">
                                Conform Password<input id="pw2" type="password" class="form-control" name="pw2" placeholder="Enter Conform Password" required/>

                            </div>


                            <div class="col-md-3"></div>
                            <div class="col-md-3"></div>
                            <div class="col-md-3"></div>
                            <div class="col-md-3"><input type="submit" name="reg" value="Register" class="btn btn-danger btn-xm" style="float: right"/></div>


                            <br>
                            <br>
                            <br>

                        </div>
                    </div>
                </div>
                <div class="col-xs-3"></div>
            </form>
        </div>
        <script src="../js/jquery-2.1.4.min.js" type="text/javascript"></script>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
