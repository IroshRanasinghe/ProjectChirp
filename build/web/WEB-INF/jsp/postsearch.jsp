<%-- 
    Document   : postsearch
    Created on : Dec 25, 2018, 11:54:11 PM
    Author     : IroshaNa Ranasinghe
--%>
<%@page import="model.POJOS.Post"%>
<%@page import="model.DB.DB"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.criterion.Projections"%>
<%@page import="org.hibernate.criterion.Projection"%>
<%@page import="org.hibernate.criterion.Order"%>
<%@page import="org.hibernate.criterion.MatchMode"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--Bootstrap style-->       
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
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
        <div class="container">
            <%
                Session ses = DB.getSession();

                String keyWord = request.getParameter("search");
                Criteria searchCriteria = ses.createCriteria(Post.class);
                searchCriteria.add(Restrictions.like("title", keyWord, MatchMode.START));
                searchCriteria.addOrder(Order.desc("date"));

                Criteria countCriteria = ses.createCriteria(Post.class);
                countCriteria.setProjection(Projections.rowCount());
                countCriteria.add(Restrictions.like("title", keyWord, MatchMode.START));
                Long countSearch = (Long) countCriteria.uniqueResult();
                if (countSearch > 0) {
            %>
            <center>
                <div class="alert alert-success" role="alert" style="width: 80%;font-size: 30px;">
                    Search Result for <b style="color: red;"><%=request.getParameter("search")%></b>
                    <br> Found <b><% out.print(countSearch + " "); %></b> Result(s) 
                </div>
            </center>
            <%
            } else {
            %>
            <center>
                <div class="alert alert-danger" role="alert" style="width: 80%;font-size: 30px;">
                    Sorry ! 
                    <br>
                    No Match Found for <b style="color: red;"><%=request.getParameter("search")%></b>
                </div>
            </center>
            <%
                }

//                search code

            %>





            <div class="col-md-2"></div>
            <div class="col-md-8">
                <%                    List<Post> searchList = searchCriteria.list();
                    for (Post post : searchList) {

                %>
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h2><b><%=post.getTitle()%></b></h2>
                        <h5><%=post.getDate()%></h5>
                    </div>
                    <div class="panel-body">
                        <p><%=post.getDescription()%></p>
                    </div>

                </div>
                <%
                    }
                %>
            </div>
            <div class="col-md-2"></div>
        </div>

        <!--jQuery 2.2.0-->
        <script src="../js/jquery-2.1.4.min.js" type="text/javascript"></script>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
