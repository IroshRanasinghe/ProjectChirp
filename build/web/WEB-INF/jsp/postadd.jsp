<%-- 
    Document   : postadd
    Created on : Dec 24, 2018, 7:09:52 PM
    Author     : IroshaNa Ranasinghe
--%>
<%@page import="DB.DB"%>
<%@page import="org.hibernate.Session"%>
<%
    if (request.getSession().getAttribute("user") != null) {
        Session ses = DB.getSession();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--Bootstrap style-->       
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!--sweet alert-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <title>Post Add</title>
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
                        <li><a><span class="glyphicon glyphicon-user"></span>&nbsp; <%=session.getAttribute("logedUser")%></a></li>
                        <li><a href="Logout.htm"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                            <%
                                }
                            %>

                    </ul>
                </div>
            </div>
        </nav>

        <div class="container">
            <div class="col-xs-3"></div>
            <div class="col-xs-6">
                <form action="Postadd.htm" method="POST">
                    <div class="panel panel-success">
                        <div class="panel-heading"><h2>Post your Advertisements</h2></div>
                        <div class="panel-body">
                            <div class="form-group">
                                <label>Title</label>
                                <input type="text" class="form-control" name="title" placeholder="Title here" required/>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea rows="3" type="text" name="description" placeholder="Description here" maxlength="200" class="form-control" required></textarea>
                            </div>
                            <div class="form-group-sm">
                                <input type="submit" class="btn btn-danger" value="Post"/>
                            </div>

                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!--jQuery 2.2.0-->
        <script src="../js/jquery-2.1.4.min.js" type="text/javascript"></script>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
<%
    } else {
        response.sendRedirect("signin.htm");
    }
%>
