<%@page import="model.POJOS.Post"%>
<%@page import="model.DB.DB"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.criterion.Order"%>
<%@page import="org.hibernate.criterion.Restrictions"%>

<%@page import="org.hibernate.Criteria"%>

<%@page import="org.hibernate.Session"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Spring Web MVC project</title>
        <!--Bootstrap style-->   
        <!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" integrity="sha384-PmY9l28YgO4JwMKbTvgaS7XNZJ30MK9FAZjjzXtlqyZCqBY6X6bXIkM++IkyinN+" crossorigin="anonymous">
        <!--<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>-->
        <!--sweet alert-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
        </script>
    </head>

    <body>
        <div>
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
                            <li><a href="Postview.htm">view add</a></li>
                        </ul>
                        <form class="navbar-form navbar-left" action="postsearch.htm" method="POST">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search By Title" name="search">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit" name="searchBtn">
                                        <i class="glyphicon glyphicon-search"></i>
                                    </button>
                                </div>
                            </div>
                        </form>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href=""><span> </span></a></li>
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

            <div>



                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <a class="btn btn-primary btn-block" href="Postview.htm">View Advertisements &nbsp;<i class="fa fa-eye"></i></a>
                    <br>
                    <c:forEach var="p" items="${post}">
                        <div class="panel panel-success">
                            <div class="panel-heading">
                                <h2><b><c:out value="${p.getTitle()}"></c:out></b></h2>
                                <p><c:out value="${p.getDate()}"></c:out></p>
                                <p>@<c:out value="${p.getUser().getName()}"></c:out></p>
                                </div>
                                <div class="panel-body">
                                    <p><c:out value="${p.getDescription()}"></c:out></p>
                                </div>

                            </div>
                    </c:forEach>

                </div>
                <div class="col-md-2"></div>

            </div>

        </div>

        <!--jQuery 2.2.0-->
        <script src="../js/jquery-2.1.4.min.js" type="text/javascript"></script>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</body>
</html>
