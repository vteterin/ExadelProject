<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:url value="/category" var="categoryUrl"/>
<c:url value="/articles" var="articlesUrl"/>

<div id="sidebar" class="col-md-4">
    <!---- Start Widget ---->
    <div class="widget wid-follow">
        <div class="heading"><h4>Follow Us</h4></div>
        <div class="content">
            <ul class="list-inline">
                <li>
                    <a href="facebook.com/">
                        <div class="box-facebook">
                            <span class="fa fa-facebook fa-2x icon"></span>
                            <span>1250</span>
                            <span>Fans</span>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="facebook.com/">
                        <div class="box-twitter">
                            <span class="fa fa-twitter fa-2x icon"></span>
                            <span>1250</span>
                            <span>Fans</span>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="facebook.com/">
                        <div class="box-google">
                            <span class="fa fa-google-plus fa-2x icon"></span>
                            <span>1250</span>
                            <span>Fans</span>
                        </div>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <!---- Start Widget ---->
    <c:if test="${recentByCategory.size()>0}">
        <div class="widget wid-post">
            <div class="heading">
                <h4>
                    <a href="<c:url value="${categoryUrl}/${recentByCategory[0].category.name}"/>">
                        <c:out value="${recentByCategory[0].category.name}"/>
                    </a>
                </h4>
            </div>
            <div class="content">
                <c:forEach var="article" items="${recentByCategory}">
                    <div class="post wrap-vid">
                        <div class="zoom-container">
                            <div class="zoom-caption">
                                <a href="<c:url value="${articlesUrl}/${article.id}"/>">
                                    <p><c:out value="${article.title}"/></p>
                                </a>
                            </div>
                            <img src="<c:url value="${article.articleImage}"/>"/>
                        </div>
                        <div class="wrapper">
                            <h5 class="vid-name">
                                <a href="<c:url value="${articlesUrl}/${article.id}"/>"><c:out
                                        value="${article.title}"/></a>
                            </h5>
                            <div class="info">
                                <h6>By <a href="#">Author</a></h6>
                        <span><i class="fa fa-calendar"></i>
                            <fmt:formatDate value="${article.dateCreated}" pattern="dd/MM/yyyy"/>
                        </span>
                                <span><i class="fa fa-heart"></i>1,200</span>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </c:if>
    <!---- Start Widget ---->
    <%--<div class="widget ">--%>
    <%--<div class="heading"><h4>Top News</h4></div>--%>
    <%--<div class="content">--%>
    <%--<div class="wrap-vid">--%>
    <%--<div class="zoom-container">--%>
    <%--<div class="zoom-caption">--%>
    <%--<span>Youtube</span>--%>
    <%--<a href="single.html">--%>
    <%--<i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>--%>
    <%--</a>--%>
    <%--<p>Video's Name</p>--%>
    <%--</div>--%>
    <%--<img src="images/1.jpg" />--%>
    <%--</div>--%>
    <%--<h3 class="vid-name"><a href="#">Video's Name</a></h3>--%>
    <%--<div class="info">--%>
    <%--<h5>By <a href="#">Kelvin</a></h5>--%>
    <%--<span><i class="fa fa-calendar"></i>25/3/2015</span>--%>
    <%--<span><i class="fa fa-heart"></i>1,200</span>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div class="wrap-vid">--%>
    <%--<div class="zoom-container">--%>
    <%--<div class="zoom-caption">--%>
    <%--<span>Youtube</span>--%>
    <%--<a href="single.html">--%>
    <%--<i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>--%>
    <%--</a>--%>
    <%--<p>Video's Name</p>--%>
    <%--</div>--%>
    <%--<img src="images/2.jpg" />--%>
    <%--</div>--%>
    <%--<h3 class="vid-name"><a href="#">Video's Name</a></h3>--%>
    <%--<div class="info">--%>
    <%--<h5>By <a href="#">Kelvin</a></h5>--%>
    <%--<span><i class="fa fa-calendar"></i>25/3/2015</span>--%>
    <%--<span><i class="fa fa-heart"></i>1,200</span>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div class="wrap-vid">--%>
    <%--<div class="zoom-container">--%>
    <%--<div class="zoom-caption">--%>
    <%--<span>Youtube</span>--%>
    <%--<a href="single.html">--%>
    <%--<i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>--%>
    <%--</a>--%>
    <%--<p>Video's Name</p>--%>
    <%--</div>--%>
    <%--<img src="images/3.jpg" />--%>
    <%--</div>--%>
    <%--<h3 class="vid-name"><a href="#">Video's Name</a></h3>--%>
    <%--<div class="info">--%>
    <%--<h5>By <a href="#">Kelvin</a></h5>--%>
    <%--<span><i class="fa fa-calendar"></i>25/3/2015</span>--%>
    <%--<span><i class="fa fa-heart"></i>1,200</span>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--</div>--%>
</div>
