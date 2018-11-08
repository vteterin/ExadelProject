<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="title">
    ${article.title} | Breaking News
</c:set>

<c:url value="/articles/new" var="newArticleUrl"/>
<c:url value="/articles/${article.id}/edit" var="editArticleUrl"/>
<c:url value="/articles/${article.id}/remove" var="removeArticleUrl"/>


<t:template title="${title}">
    <jsp:body>
        <div class="box">
            <div class="wrap-vid">
                <img src="<c:url value="${article.articleImage}"/>"/>
            </div>

            <div class="line"></div>

            <h1 class="vid-name">
                <a href="#">
                    <c:out value="${article.title}"/>
                </a>
            </h1>
            <div class="info">
                <h5>By <a href="#">Kelvin</a></h5>
                <span><i class="fa fa-calendar"></i><fmt:formatDate value="${article.dateCreated}"
                                                                    pattern="dd/MM/yyyy"/></span>
                <span><i class="fa fa-heart"></i>1,200</span>
            </div>

            <div class="share">
                <ul class="list-inline">
                    <li><a href="${newArticleUrl}" class="btn btn-admin"><i class="fa fa-plus-square"></i> Add
                        article</a></li>
                    <li><a href="${editArticleUrl}" class="btn btn-admin"><i class="fa fa-pencil-square"></i> Edit
                        article</a></li>
                    <li><a href="${removeArticleUrl}" class="btn btn-admin"><i class="fa fa-times-circle"></i> Remove
                        article</a></li>
                </ul>
            </div>

            <c:out value="${article.info}" escapeXml="false"/>

            <div class="vid-tags">
                <a href="#">Animal</a>
                <a href="#">Aenean</a>
                <a href="#">Feugiat</a>
                <a href="#">Risus</a>
                <a href="#">Magna</a>
            </div>
            <div class="line"></div>
            <div class="comment">
                <h3>Leave A Comment</h3>
                <form name="form1" method="post" action="">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="text" class="form-control input-lg" name="name" id="name"
                                       placeholder="Enter name" required="required">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="email" class="form-control input-lg" name="email" id="email"
                                       placeholder="Enter email" required="required">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <textarea name="message" id="message" class="form-control" rows="4" cols="25"
                                          required="required" placeholder="Message"></textarea>
                            </div>
                            <button type="submit" class="btn btn-4 btn-block" name="btnBooking" id="btnBbooking">Book
                                Now
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <%--<div class="box">--%>
        <%--<div class="box-header header-natural">--%>
        <%--<h2>RELATED VIDEOS</h2>--%>
        <%--</div>--%>
        <%--<div class="box-content">--%>
        <%--<div class="row">--%>
        <%--<div class="col-md-4">--%>
        <%--<div class="wrap-vid">--%>
        <%--<div class="zoom-container">--%>
        <%--<div class="zoom-caption">--%>
        <%--<span>Youtube</span>--%>
        <%--<a href="single.html">--%>
        <%--<i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>--%>
        <%--</a>--%>
        <%--<p>Video's Name</p>--%>
        <%--</div>--%>
        <%--<img src="images/2.jpg">--%>
        <%--</div>--%>
        <%--<h3 class="vid-name"><a href="#">Video's Name</a></h3>--%>
        <%--<div class="info">--%>
        <%--<h5>By <a href="#">Kelvin</a></h5>--%>
        <%--<span><i class="fa fa-calendar"></i>25/3/2015</span>--%>
        <%--<span><i class="fa fa-heart"></i>1,200</span>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--<div class="col-md-4">--%>
        <%--<div class="wrap-vid">--%>
        <%--<div class="zoom-container">--%>
        <%--<div class="zoom-caption">--%>
        <%--<span>Youtube</span>--%>
        <%--<a href="single.html">--%>
        <%--<i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>--%>
        <%--</a>--%>
        <%--<p>Video's Name</p>--%>
        <%--</div>--%>
        <%--<img src="images/2.jpg">--%>
        <%--</div>--%>
        <%--<h3 class="vid-name"><a href="#">Video's Name</a></h3>--%>
        <%--<div class="info">--%>
        <%--<h5>By <a href="#">Kelvin</a></h5>--%>
        <%--<span><i class="fa fa-calendar"></i>25/3/2015</span>--%>
        <%--<span><i class="fa fa-heart"></i>1,200</span>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--<div class="col-md-4">--%>
        <%--<div class="wrap-vid">--%>
        <%--<div class="zoom-container">--%>
        <%--<div class="zoom-caption">--%>
        <%--<span>Youtube</span>--%>
        <%--<a href="single.html">--%>
        <%--<i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>--%>
        <%--</a>--%>
        <%--<p>Video's Name</p>--%>
        <%--</div>--%>
        <%--<img src="images/2.jpg">--%>
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
        <%--</div>--%>
        <%--</div>--%>
    </jsp:body>
</t:template>
