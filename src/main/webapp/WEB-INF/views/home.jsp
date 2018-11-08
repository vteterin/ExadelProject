<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%--
TODO: Make Internationalization properties file
--%>

<c:url value="/articles" var="articlesUrl"/>

<c:set var="title">
    Home | Breaking News
</c:set>

<t:homepage_template title="${title}">
    <jsp:body>
        <c:if test="${slides.size()>0}">
            <div class="featured container">
                <div class="row">
                    <div class="col-sm-12">
                        <!-- Carousel -->
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <!-- Indicators -->
                            <ol class="carousel-indicators">
                                <c:forEach begin="0" end="${slides.size()-1}" var="i">
                                    <li data-target="#carousel-example-generic" data-slide-to="<c:out value="${i}"/>"
                                            <c:if test="${i==0}"> class="active"</c:if>></li>
                                </c:forEach>
                            </ol>
                            <!-- Wrapper for slides -->
                            <div class="carousel-inner">
                                <c:forEach items="${slides}" var="slide">
                                    <div class="item <c:if test="${slides.get(0)==slide}">active</c:if>">
                                        <a href="
                                        <c:if test="${empty slide.link}">#</c:if>
                                        <c:url value="${slide.link}"/>
                                        ">
                                            <img src="<c:url value="${slide.slideimage}"/>" alt="${slide.id}"/>
                                            <!-- Static Header -->
                                            <div class="header-text hidden-xs">
                                                <div class="col-md-12 text-center">
                                                    <h2><c:out value="${slide.mainTitle}"/></h2>
                                                    <br>
                                                    <h3><c:out value="${slide.subTitle}"/></h3>
                                                    <br>
                                                </div>
                                            </div><!-- /header-text -->
                                        </a>
                                    </div>

                                </c:forEach>
                            </div>

                            <!-- Controls -->
                            <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                            </a>
                        </div><!-- /carousel -->
                    </div>
                </div>
            </div>
        </c:if>

        <!-- /////////////////////////////////////////Content -->
        <div id="page-content" class="index-page container">
            <div class="row">
                <div id="main-content"><!-- background not working -->

                    <div class="col-md-6">
                        <c:if test="${recentArticles.size()>0}">
                            <div class="box wrap-vid">
                                <div class="zoom-container">
                                    <div class="zoom-caption">
                                        <a href="<c:url value="${articlesUrl}/${recentArticles[0].id}"/>">
                                            <p><c:out value="${recentArticles[0].title}"/></p>
                                        </a>
                                    </div>
                                    <img src="<c:url value="${recentArticles[0].articleImage}"/>"/>
                                </div>
                                <h3 class="vid-name"><a
                                        href="<c:url value="${articlesUrl}/${recentArticles[0].id}"/>"><c:out
                                        value="${recentArticles[0].title}"/></a></h3>
                                <div class="info">
                                    <h5>By <a href="#">Author</a></h5>
                                    <span><i class="fa fa-calendar"></i>
                                        <fmt:formatDate value="${recentArticles[0].dateCreated}" pattern="dd/MM/yyyy"/>
                                    </span>
                                    <span><i class="fa fa-heart"></i>1,200</span>
                                </div>
                                <p class="more"><c:out escapeXml="false" value="${recentArticles[0].preview}"/></p>
                            </div>
                        </c:if>
                            <%--<div class="box">--%>
                            <%--<div class="box-header header-vimeo">--%>
                            <%--<h2>Vimeo</h2>--%>
                            <%--</div>--%>
                            <%--<div class="box-content">--%>
                            <%--<div class="row">--%>
                            <%--<div class="col-md-6">--%>
                            <%--<div class="wrap-vid">--%>
                            <%--<div class="zoom-container">--%>
                            <%--<div class="zoom-caption">--%>
                            <%--<span class="vimeo">Vimeo</span>--%>
                            <%--<a href="single.html">--%>
                            <%--<i class="fa fa-play-circle-o fa-5x" style="color: #fff"></i>--%>
                            <%--</a>--%>
                            <%--<p>Video's Name</p>--%>
                            <%--</div>--%>
                            <%--<img src="images/2.jpg"/>--%>
                            <%--</div>--%>
                            <%--<h3 class="vid-name"><a href="#">Video's Name</a></h3>--%>
                            <%--<div class="info">--%>
                            <%--<h5>By <a href="#">Kelvin</a></h5>--%>
                            <%--<span><i class="fa fa-calendar"></i>25/3/2015</span>--%>
                            <%--<span><i class="fa fa-heart"></i>1,200</span>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--<p class="more">Aenean feugiat in ante et blandit. Vestibulum posuere molestie--%>
                            <%--risus, ac interdum magna porta non. Pellentesque rutrum fringilla elementum.--%>
                            <%--Curabitur tincidunt porta lorem vitae accumsan.</p>--%>
                            <%--</div>--%>
                            <%--<div class="col-md-6">--%>
                            <%--<div class="post wrap-vid">--%>
                            <%--<div class="zoom-container">--%>
                            <%--<div class="zoom-caption">--%>
                            <%--<span class="vimeo">Vimeo</span>--%>
                            <%--<a href="single.html">--%>
                            <%--<i class="fa fa-play-circle-o fa-3x" style="color: #fff"></i>--%>
                            <%--</a>--%>
                            <%--<p>Video's Name</p>--%>
                            <%--</div>--%>
                            <%--<img src="images/1.jpg"/>--%>
                            <%--</div>--%>
                            <%--<div class="wrapper">--%>
                            <%--<h5 class="vid-name"><a href="#">Video's Name</a></h5>--%>
                            <%--<div class="info">--%>
                            <%--<h6>By <a href="#">Kelvin</a></h6>--%>
                            <%--<span><i class="fa fa-heart"></i>1,200 / <i--%>
                            <%--class="fa fa-calendar"></i>25/3/2015</span>--%>
                            <%--<span class="rating">--%>
                            <%--<i class="fa fa-star"></i>--%>
                            <%--<i class="fa fa-star"></i>--%>
                            <%--<i class="fa fa-star"></i>--%>
                            <%--<i class="fa fa-star"></i>--%>
                            <%--<i class="fa fa-star-half"></i>--%>
                            <%--</span>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="post wrap-vid">--%>
                            <%--<div class="zoom-container">--%>
                            <%--<div class="zoom-caption">--%>
                            <%--<span class="vimeo">Vimeo</span>--%>
                            <%--<a href="single.html">--%>
                            <%--<i class="fa fa-play-circle-o fa-3x" style="color: #fff"></i>--%>
                            <%--</a>--%>
                            <%--<p>Video's Name</p>--%>
                            <%--</div>--%>
                            <%--<img src="images/2.jpg"/>--%>
                            <%--</div>--%>
                            <%--<div class="wrapper">--%>
                            <%--<h5 class="vid-name"><a href="#">Video's Name</a></h5>--%>
                            <%--<div class="info">--%>
                            <%--<h6>By <a href="#">Kelvin</a></h6>--%>
                            <%--<span><i class="fa fa-heart"></i>1,200 / <i--%>
                            <%--class="fa fa-calendar"></i>25/3/2015</span>--%>
                            <%--<span class="rating">--%>
                            <%--<i class="fa fa-star"></i>--%>
                            <%--<i class="fa fa-star"></i>--%>
                            <%--<i class="fa fa-star"></i>--%>
                            <%--<i class="fa fa-star"></i>--%>
                            <%--<i class="fa fa-star"></i>--%>
                            <%--</span>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="post wrap-vid">--%>
                            <%--<div class="zoom-container">--%>
                            <%--<div class="zoom-caption">--%>
                            <%--<span class="vimeo">Vimeo</span>--%>
                            <%--<a href="single.html">--%>
                            <%--<i class="fa fa-play-circle-o fa-3x" style="color: #fff"></i>--%>
                            <%--</a>--%>
                            <%--<p>Video's Name</p>--%>
                            <%--</div>--%>
                            <%--<img src="images/3.jpg"/>--%>
                            <%--</div>--%>
                            <%--<div class="wrapper">--%>
                            <%--<h5 class="vid-name"><a href="#">Video's Name</a></h5>--%>
                            <%--<div class="info">--%>
                            <%--<h6>By <a href="#">Kelvin</a></h6>--%>
                            <%--<span><i class="fa fa-heart"></i>1,200 / <i--%>
                            <%--class="fa fa-calendar"></i>25/3/2015</span>--%>
                            <%--<span class="rating">--%>
                            <%--<i class="fa fa-star"></i>--%>
                            <%--<i class="fa fa-star"></i>--%>
                            <%--<i class="fa fa-star"></i>--%>
                            <%--<i class="fa fa-star"></i>--%>
                            <%--<i class="fa fa-star-half"></i>--%>
                            <%--</span>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="post wrap-vid">--%>
                            <%--<div class="zoom-container">--%>
                            <%--<div class="zoom-caption">--%>
                            <%--<span class="vimeo">Vimeo</span>--%>
                            <%--<a href="single.html">--%>
                            <%--<i class="fa fa-play-circle-o fa-3x" style="color: #fff"></i>--%>
                            <%--</a>--%>
                            <%--<p>Video's Name</p>--%>
                            <%--</div>--%>
                            <%--<img src="images/1.jpg"/>--%>
                            <%--</div>--%>
                            <%--<div class="wrapper">--%>
                            <%--<h5 class="vid-name"><a href="#">Video's Name</a></h5>--%>
                            <%--<div class="info">--%>
                            <%--<h6>By <a href="#">Kelvin</a></h6>--%>
                            <%--<span><i class="fa fa-heart"></i>1,200 / <i--%>
                            <%--class="fa fa-calendar"></i>25/3/2015</span>--%>
                            <%--<span class="rating">--%>
                            <%--<i class="fa fa-star"></i>--%>
                            <%--<i class="fa fa-star"></i>--%>
                            <%--<i class="fa fa-star"></i>--%>
                            <%--<i class="fa fa-star"></i>--%>
                            <%--<i class="fa fa-star-half"></i>--%>
                            <%--</span>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</div>--%>

                            <%--HERE--%>
                        <div class="box">
                            <div class="box-header header-photo">
                                <h2>Photos</h2>
                            </div>
                            <div class="box-content">
                                <div id="owl-demo-2" class="owl-carousel">
                                    <c:forEach var="i" begin="0" end="12" step="2">
                                        <c:if test="${recentArticles.size()>=i+2}">
                                            <div class="item">
                                                <img src="<c:url value="${recentArticles[i].articleImage}"/>"
                                                     alt="<c:out value="${recentArticles[i].title}"/>"/>
                                                <img src="<c:url value="${recentArticles[i+1].articleImage}"/>"
                                                     alt="<c:out value="${recentArticles[i].title}"/>"/>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>

                        <c:if test="${recentByCategory.size()>=1}">
                            <div class="box">
                                <div class="box-header header-natural">
                                    <h2><c:out value="${recentByCategory[0].category.name}"/></h2>
                                </div>
                                <div class="box-content">
                                    <div class="row">
                                        <c:forEach var="i" begin="0" end="1">
                                            <c:if test="${recentByCategory.size()>=i+1}">
                                                <div class="col-md-6">
                                                    <img src="<c:url value="${recentByCategory[i].articleImage}"/>"/>
                                                    <h3>
                                                        <a href="<c:url value="${articlesUrl}/${recentByCategory[i].id}"/>"><c:out
                                                                value="${recentByCategory[i].title}"/></a></h3>
                                                <span>
                                                    <i class="fa fa-heart"></i> 1,200 /
                                                    <i class="fa fa-calendar"></i> 25/3/2015 /
                                                    <i class="fa fa-comment-o"> / </i> 10
                                                    <i class="fa fa-eye"></i> 945
                                                </span>
                                                <span class="rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-half"></i>
                                                </span>
                                                    <p><c:out value="${recentByCategory[i].preview}"/></p>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>
                <div id="sidebar">
                    <!---- Column #1 ---->
                    <div class="col-md-3">
                        <!---- Start Widget ---->
                        <c:if test="${mostViewedArticles.size>0 || popularArticles.size>0 || randomArticles.size>0}">
                            <div class="widget wid-vid">
                                <div class="heading">
                                    <h4>Videos</h4>
                                </div>
                                <div class="content">
                                    <ul class="nav nav-tabs">
                                        <c:if test="${mostViewedArticles.size>0}">
                                            <li class="active"><a data-toggle="tab" href="#most">Most Plays</a></li>
                                        </c:if>
                                        <c:if test="${popularArticles.size>0}">
                                            <li><a data-toggle="tab" href="#popular">Popular</a></li>
                                        </c:if>
                                        <c:if test="${randomArticles.size>0}">
                                            <li><a data-toggle="tab" href="#random">Random</a></li>
                                        </c:if>
                                    </ul>
                                    <div class="tab-content">
                                        <c:if test="${mostViewed.size>0}">
                                            <div id="most" class="tab-pane fade in active">
                                                <div class="post wrap-vid">
                                                    <div class="zoom-container">
                                                        <div class="zoom-caption">
                                                            <span class="youtube">Youtube</span>
                                                            <a href="single.html">
                                                                <i class="fa fa-play-circle-o fa-3x"
                                                                   style="color: #fff"></i>
                                                            </a>
                                                            <p>Video's Name</p>
                                                        </div>
                                                        <img src="images/4.jpg"/>
                                                    </div>
                                                    <div class="wrapper">
                                                        <h5 class="vid-name"><a href="#">Video's Name</a></h5>
                                                        <div class="info">
                                                            <h6>By <a href="#">Kelvin</a></h6>
                                                            <span><i class="fa fa-heart"></i>1,200 / <i
                                                                    class="fa fa-calendar"></i>25/3/2015</span>
												<span class="rating">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-half"></i>
												</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="post wrap-vid">
                                                    <div class="zoom-container">
                                                        <div class="zoom-caption">
                                                            <span class="vimeo">Vimeo</span>
                                                            <a href="single.html">
                                                                <i class="fa fa-play-circle-o fa-3x"
                                                                   style="color: #fff"></i>
                                                            </a>
                                                            <p>Video's Name</p>
                                                        </div>
                                                        <img src="images/4.jpg"/>
                                                    </div>
                                                    <div class="wrapper">
                                                        <h5 class="vid-name"><a href="#">Video's Name</a></h5>
                                                        <div class="info">
                                                            <h6>By <a href="#">Kelvin</a></h6>
                                                            <span><i class="fa fa-heart"></i>1,200 / <i
                                                                    class="fa fa-calendar"></i>25/3/2015</span>
												<span class="rating">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-half"></i>
												</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="post wrap-vid">
                                                    <div class="zoom-container">
                                                        <div class="zoom-caption">
                                                            <span class="youtube">Youtube</span>
                                                            <a href="single.html">
                                                                <i class="fa fa-play-circle-o fa-3x"
                                                                   style="color: #fff"></i>
                                                            </a>
                                                            <p>Video's Name</p>
                                                        </div>
                                                        <img src="images/4.jpg"/>
                                                    </div>
                                                    <div class="wrapper">
                                                        <h5 class="vid-name"><a href="#">Video's Name</a></h5>
                                                        <div class="info">
                                                            <h6>By <a href="#">Kelvin</a></h6>
                                                            <span><i class="fa fa-heart"></i>1,200 / <i
                                                                    class="fa fa-calendar"></i>25/3/2015</span>
												<span class="rating">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-half"></i>
												</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:if test="${popularArticles.size>0}">
                                            <div id="popular" class="tab-pane fade">
                                                <div class="post wrap-vid">
                                                    <div class="zoom-container">
                                                        <div class="zoom-caption">
                                                            <span class="youtube">Youtube</span>
                                                            <a href="single.html">
                                                                <i class="fa fa-play-circle-o fa-3x"
                                                                   style="color: #fff"></i>
                                                            </a>
                                                            <p>Video's Name</p>
                                                        </div>
                                                        <img src="images/4.jpg"/>
                                                    </div>
                                                    <div class="wrapper">
                                                        <h5 class="vid-name"><a href="#">Video's Name</a></h5>
                                                        <div class="info">
                                                            <h6>By <a href="#">Kelvin</a></h6>
                                                            <span><i class="fa fa-heart"></i>1,200 / <i
                                                                    class="fa fa-calendar"></i>25/3/2015</span>
												<span class="rating">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-half"></i>
												</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="post wrap-vid">
                                                    <div class="zoom-container">
                                                        <div class="zoom-caption">
                                                            <span class="youtube">Youtube</span>
                                                            <a href="single.html">
                                                                <i class="fa fa-play-circle-o fa-3x"
                                                                   style="color: #fff"></i>
                                                            </a>
                                                            <p>Video's Name</p>
                                                        </div>
                                                        <img src="images/4.jpg"/>
                                                    </div>
                                                    <div class="wrapper">
                                                        <h5 class="vid-name"><a href="#">Video's Name</a></h5>
                                                        <div class="info">
                                                            <h6>By <a href="#">Kelvin</a></h6>
                                                            <span><i class="fa fa-heart"></i>1,200 / <i
                                                                    class="fa fa-calendar"></i>25/3/2015</span>
												<span class="rating">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-half"></i>
												</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="post wrap-vid">
                                                    <div class="zoom-container">
                                                        <div class="zoom-caption">
                                                            <span class="vimeo">Vimeo</span>
                                                            <a href="single.html">
                                                                <i class="fa fa-play-circle-o fa-3x"
                                                                   style="color: #fff"></i>
                                                            </a>
                                                            <p>Video's Name</p>
                                                        </div>
                                                        <img src="images/4.jpg"/>
                                                    </div>
                                                    <div class="wrapper">
                                                        <h5 class="vid-name"><a href="#">Video's Name</a></h5>
                                                        <div class="info">
                                                            <h6>By <a href="#">Kelvin</a></h6>
                                                            <span><i class="fa fa-heart"></i>1,200 / <i
                                                                    class="fa fa-calendar"></i>25/3/2015</span>
												<span class="rating">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-half"></i>
												</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:if test="${randomArticles.size>0}">
                                            <div id="random" class="tab-pane fade">
                                                <div class="post wrap-vid">
                                                    <div class="zoom-container">
                                                        <div class="zoom-caption">
                                                            <span class="vimeo">Vimeo</span>
                                                            <a href="single.html">
                                                                <i class="fa fa-play-circle-o fa-3x"
                                                                   style="color: #fff"></i>
                                                            </a>
                                                            <p>Video's Name</p>
                                                        </div>
                                                        <img src="images/4.jpg"/>
                                                    </div>
                                                    <div class="wrapper">
                                                        <h5 class="vid-name"><a href="#">Video's Name</a></h5>
                                                        <div class="info">
                                                            <h6>By <a href="#">Kelvin</a></h6>
                                                            <span><i class="fa fa-heart"></i>1,200 / <i
                                                                    class="fa fa-calendar"></i>25/3/2015</span>
												<span class="rating">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-half"></i>
												</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="post wrap-vid">
                                                    <div class="zoom-container">
                                                        <div class="zoom-caption">
                                                            <span class="vimeo">Vimeo</span>
                                                            <a href="single.html">
                                                                <i class="fa fa-play-circle-o fa-3x"
                                                                   style="color: #fff"></i>
                                                            </a>
                                                            <p>Video's Name</p>
                                                        </div>
                                                        <img src="images/4.jpg"/>
                                                    </div>
                                                    <div class="wrapper">
                                                        <h5 class="vid-name"><a href="#">Video's Name</a></h5>
                                                        <div class="info">
                                                            <h6>By <a href="#">Kelvin</a></h6>
                                                            <span><i class="fa fa-heart"></i>1,200 / <i
                                                                    class="fa fa-calendar"></i>25/3/2015</span>
												<span class="rating">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-half"></i>
												</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="post wrap-vid">
                                                    <div class="zoom-container">
                                                        <div class="zoom-caption">
                                                            <span class="vimeo">Vimeo</span>
                                                            <a href="single.html">
                                                                <i class="fa fa-play-circle-o fa-3x"
                                                                   style="color: #fff"></i>
                                                            </a>
                                                            <p>Video's Name</p>
                                                        </div>
                                                        <img src="images/4.jpg"/>
                                                    </div>
                                                    <div class="wrapper">
                                                        <h5 class="vid-name"><a href="#">Video's Name</a></h5>
                                                        <div class="info">
                                                            <h6>By <a href="#">Kelvin</a></h6>
                                                            <span><i class="fa fa-heart"></i>1,200 / <i
                                                                    class="fa fa-calendar"></i>25/3/2015</span>
												<span class="rating">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-half"></i>
												</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>

                                    </div>
                                </div>
                            </div>
                        </c:if>

                        <!---- Start Widget ---->
                            <%--<div class="widget wid-gallery">--%>
                            <%--<div class="heading"><h4>Gallery</h4></div>--%>
                            <%--<div class="content">--%>
                            <%--<div class="col-md-4">--%>
                            <%--<div class="row">--%>
                            <%--<a href="#"><img src="images/14.jpg" /></a>--%>
                            <%--<a href="#"><img src="images/15.jpg" /></a>--%>
                            <%--<a href="#"><img src="images/20.jpg" /></a>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="col-md-4">--%>
                            <%--<div class="row">--%>
                            <%--<a href="#"><img src="images/16.jpg" /></a>--%>
                            <%--<a href="#"><img src="images/17.jpg" /></a>--%>
                            <%--<a href="#"><img src="images/21.jpg" /></a>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="col-md-4">--%>
                            <%--<div class="row">--%>
                            <%--<a href="#"><img src="images/18.jpg" /></a>--%>
                            <%--<a href="#"><img src="images/19.jpg" /></a>--%>
                            <%--<a href="#"><img src="images/14.jpg" /></a>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</div>--%>

                        <!---- Start Widget ---->
                        <c:if test="${recentArticles.size()>1}">
                            <div class="widget wid-new-post">
                                <div class="heading"><h4>New Posts</h4></div>
                                <c:forEach var="i" begin="1" end="3">
                                    <c:if test="${recentArticles.size()>=(i+1)}">
                                        <div class="content">
                                            <h6>
                                                <a href="<c:url value="${articlesUrl}/${recentArticles[i].id}"/>">
                                                    <c:out value="${recentArticles[i].title}"/>
                                                </a>
                                            </h6>
                                            <img src="<c:url value="${recentArticles[i].articleImage}"/>"/>
                                            <ul class="list-inline">
                                                <li><i class="fa fa-calendar"></i><fmt:formatDate
                                                        value="${recentArticles[i].dateCreated}" pattern="dd/MM/yyyy"/>
                                                </li>
                                                <li><i class="fa fa-comments"></i>1,200</li>
                                            </ul>
                                            <p><c:out value="${recentArticles[i].preview}"/></p>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </c:if>
                        <!---- Start Widget ---->
                        <c:if test="${recentArticles.size()>4}">
                            <div class="widget wid-recent-post">
                                <div class="heading"><h4>Recent Posts</h4></div>
                                <div class="content">
                                    <c:forEach var="i" begin="4" end="9">
                                        <c:if test="${recentArticles.size()>=(i+1)}">
                            <span><c:out value="${recentArticles[i].title}"/>
                                <a href="<c:url value="${articlesUrl}/${recentArticles[i].id}"/>">
                                    MORE...
                                </a>
                            </span>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </c:if>
                    </div>
                    <!---- Column #2 ---->
                    <div class="col-md-3">
                        <!---- Start Widget ---->
                        <div class="widget wid-tags">
                            <div class="heading"><h4>Search</h4></div>
                            <div class="content">
                                <form role="form" class="form-horizontal" method="post" action="">
                                    <input type="text" placeholder="Enter Search Keywords" value="" name="v_search"
                                           id="v_search" class="form-control">
                                </form>
                            </div>
                        </div>
                        <!---- Start Widget ---->
                        <div class="widget wid-tags">
                            <div class="heading"><h4>Tags</h4></div>
                            <div class="content">
                                <a href="#">animals</a>
                                <a href="#">cooking</a>
                                <a href="#">countries</a>
                                <a href="#">home</a>
                                <a href="#">likes</a>
                                <a href="#">photo</a>
                                <a href="#">link</a>
                                <a href="#">video</a>
                                <a href="#">travel</a>
                                <a href="#">images</a>
                                <a href="#">love</a>
                                <a href="#">lists</a>
                                <a href="#">makeup</a>
                                <a href="#">media</a>
                                <a href="#">password</a>
                                <a href="#">pagination</a>
                                <a href="#">pictures</a>
                            </div>
                        </div>
                        <!---- Start Widget ---->
                            <%--<div class="widget wid-comment">--%>
                            <%--<div class="heading"><h4>Top Comments</h4></div>--%>
                            <%--<div class="content">--%>
                            <%--<div class="post">--%>
                            <%--<a href="single.html">--%>
                            <%--<img src="images/ava-1.jpg" class="img-circle"/>--%>
                            <%--</a>--%>
                            <%--<div class="wrapper">--%>
                            <%--<a href="#"><h5>Curabitur tincidunt porta lorem.</h5></a>--%>
                            <%--<ul class="list-inline">--%>
                            <%--<li><i class="fa fa-calendar"></i>25/3/2015</li>--%>
                            <%--<li><i class="fa fa-thumbs-up"></i>1,200</li>--%>
                            <%--</ul>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="post">--%>
                            <%--<a href="single.html">--%>
                            <%--<img src="images/ava-2.png" class="img-circle"/>--%>
                            <%--</a>--%>
                            <%--<div class="wrapper">--%>
                            <%--<a href="#"><h5>Curabitur tincidunt porta lorem.</h5></a>--%>
                            <%--<ul class="list-inline">--%>
                            <%--<li><i class="fa fa-calendar"></i>25/3/2015</li>--%>
                            <%--<li><i class="fa fa-thumbs-up"></i>1,200</li>--%>
                            <%--</ul>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="post">--%>
                            <%--<a href="single.html">--%>
                            <%--<img src="images/ava-3.jpeg" class="img-circle"/>--%>
                            <%--</a>--%>
                            <%--<div class="wrapper">--%>
                            <%--<a href="#"><h5>Curabitur tincidunt porta lorem.</h5></a>--%>
                            <%--<ul class="list-inline">--%>
                            <%--<li><i class="fa fa-calendar"></i>25/3/2015</li>--%>
                            <%--<li><i class="fa fa-thumbs-up"></i>1,200</li>--%>
                            <%--</ul>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="post">--%>
                            <%--<a href="single.html">--%>
                            <%--<img src="images/ava-4.jpg" class="img-circle"/>--%>
                            <%--</a>--%>
                            <%--<div class="wrapper">--%>
                            <%--<a href="#"><h5>Curabitur tincidunt porta lorem.</h5></a>--%>
                            <%--<ul class="list-inline">--%>
                            <%--<li><i class="fa fa-calendar"></i>25/3/2015</li>--%>
                            <%--<li><i class="fa fa-thumbs-up"></i>1,200</li>--%>
                            <%--</ul>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                        <!---- Start Widget ---->
                            <%--<div class="widget wid-banner">--%>
                            <%--<div class="content">--%>
                            <%--<img src="images/banner-2.jpg" class="img-responsive"/>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                        <!---- Start Widget ---->
                        <div class="widget wid-categoty">
                            <div class="heading"><h4>Category</h4></div>
                            <div class="content">
                                <select id="moveToCategorySelect" class="col-md-12">
                                    <c:forEach var="category" items="${categories}">
                                        <option value="<c:url value="/category/${category.name}"/>">${category.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <!---- Start Widget ---->
                        <div class="widget wid-calendar">
                            <div class="heading"><h4>Calendar</h4></div>
                            <div class="content">
                                <div class=center>
                                    <form action="" role="form">
                                        <div class="input-group date form_date" data-date=""
                                             data-date-format="dd MM yyyy" data-link-field="dtp_input2"
                                             data-link-format="yyyy-mm-dd">
                                        </div>
                                        <input type="hidden" id="dtp_input2" value=""/><br/>
                                    </form>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:homepage_template>
