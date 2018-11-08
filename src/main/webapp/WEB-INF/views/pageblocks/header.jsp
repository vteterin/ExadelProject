<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url value="/" var="homeUrl"/>
<c:url value="/contact" var="contactUrl"/>
<c:url value="/articles" var="articlesUrl"/>

<header>
    <!--Top-->
    <nav id="top">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <strong>Welcome to Breaking News!</strong>
                </div>
                <div class="col-md-6">
                    <ul class="list-inline top-link link">
                        <li><a href="${homeUrl}"><i class="fa fa-home"></i> Home</a></li>
                        <li><a href="${contactUrl}"><i class="fa fa-comments"></i> Contact</a></li>
                        <%--<li><a href="#"><i class="fa fa-question-circle"></i> FAQ</a></li>--%>
                    </ul>
                </div>
            </div>
        </div>
    </nav>

    <!--Navigation-->
    <nav id="menu" class="navbar container">
        <div class="navbar-header">
            <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse"
                    data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
            <a class="navbar-brand" href="${homeUrl}">
                <div class="logo"><span>Breaking News</span></div>
            </a>
        </div>
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav">
                <li><a href="${homeUrl}">Home</a></li>
                <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Account <i
                        class="fa fa-arrow-circle-o-down"></i></a>
                    <div class="dropdown-menu">
                        <div class="dropdown-inner">
                            <ul class="list-unstyled">
                                <li><a href="#">Login</a></li>
                                <li><a href="#">Register</a></li>
                            </ul>
                        </div>
                    </div>
                </li>

                <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Category <i
                        class="fa fa-arrow-circle-o-down"></i></a>
                    <div class="dropdown-menu">
                        <div class="dropdown-inner">
                            <%--Output categories--%>
                            <ul class="list-unstyled">
                                <c:forEach var="category" items="${categories}">
                                    <li><a href="/category/${category.name}">${category.name}</a></li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </li>
                <li><a href="${articlesUrl}"><i class="fa fa-cubes"></i> Articles</a></li>
                <li><a href="${contactUrl}"><i class="fa fa-envelope"></i> Contact</a></li>
            </ul>
            <ul class="list-inline navbar-right top-social">
                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                <li><a href="#"><i class="fa fa-google-plus-square"></i></a></li>
                <li><a href="#"><i class="fa fa-youtube"></i></a></li>
            </ul>
        </div>
    </nav>
</header>