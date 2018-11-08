<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<c:set var="title">
    Articles | Breaking News
</c:set>

<c:set var="pageNumbersCountToShow" value="4"/>

<c:url value="/articles" var="articlesUrl"/>

<t:template title="${title}">
    <jsp:body>
        <c:choose>
            <c:when test="${articles.size()>0}">
                <c:forEach var="article" items="${articles}">
                    <div class="box">
                        <a href="${articlesUrl}/${article.id}"><h2 class="vid-name">${article.title}</h2></a>
                        <div class="info">
                            <h5>By <a href="#">Author</a></h5>
                            <span><i class="fa fa-calendar"></i><fmt:formatDate value="${article.dateCreated}"
                                                                                pattern="dd/MM/yyyy"/> </span>
                            <span><i class="fa fa-comment"></i> 0 Comments</span>
                            <span><i class="fa fa-heart"></i>1,200</span>
                            <ul class="list-inline">
                                <li><a href="#">Rate</a></li>
                                <li> -</li>
                                <li>
                                            <span class="rating">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star-half-o"></i>
                                            </span>
                                </li>
                            </ul>
                        </div>

                        <div class="wrap-vid">
                            <div class="zoom-container">
                                <div class="zoom-caption">
                                </div>
                                <img src="<c:url value="${article.articleImage}"/>"/>
                            </div>
                            <p>${article.preview}<a href="${articlesUrl}/${article.id}">MORE...</a></p>
                        </div>
                    </div>
                    <hr class="line">
                </c:forEach>

                <!--================Pagination=-->
                <c:if test="${pageCount>1}">
                    <div class="box center">
                        <ul class="pagination">
                            <!--Previous page button-->
                            <c:choose>
                                <c:when test="${currentPage>1}">
                                    <li>
                                        <a href="<c:url value="${baseUrl}/page/${currentPage-1}"/>"
                                           aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="disabled">
                                        <span aria-hidden="true">&laquo;</span>
                                    </li>
                                </c:otherwise>
                            </c:choose>

                            <!--Firts page-->
                            <c:if test="${currentPage-pageNumbersCountToShow>=2}">
                                <li><a href="<c:url value="${baseUrl}/page/1/"/>">1</a></li>
                                <c:if test="${currentPage-pageNumbersCountToShow>2}">
                                    <li class="disabled"><span aria-hidden="true">...</span></li>
                                </c:if>
                            </c:if>

                            <!--Numbers of pages-->
                            <c:set var="paginationBegin" value="${currentPage-pageNumbersCountToShow}"/>
                            <c:if test="${paginationBegin<1}">
                                <c:set var="paginationBegin" value="1"/>
                            </c:if>

                            <c:forEach var="inc" begin="${paginationBegin}" end="${currentPage+pageNumbersCountToShow}"
                                       step="1">
                                <c:if test="${inc<=pageCount}">
                                    <c:choose>
                                        <c:when test="${currentPage ne inc}">
                                            <li>
                                                <a href="<c:url value="${baseUrl}/page/${inc}"/>">
                                                    <c:out value="${inc}"/>
                                                </a>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="disabled">
                                                <span><c:out value="${inc}"/></span>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>
                            </c:forEach>

                            <!--Last page-->
                            <c:if test="${(currentPage+pageNumbersCountToShow)<pageCount}">
                                <c:if test="${(currentPage+pageNumbersCountToShow)<pageCount-1}">
                                    <li class="disabled"><span aria-hidden="true">...</span></li>
                                </c:if>
                                <li>
                                    <a href="<c:url value="${baseUrl}/page/${pageCount}"/>">
                                        <c:out value="${pageCount}"/>
                                    </a>
                                </li>
                            </c:if>

                            <!--Next page button-->
                            <c:choose>
                                <c:when test="${currentPage<pageCount}">
                                    <li>
                                        <a href="<c:url value="${baseUrl}/page/${currentPage+1}"/>" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="disabled">
                                        <span aria-hidden="true">&raquo;</span>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>
                </c:if>
            </c:when>
            <c:otherwise>
                <div class="box">
                    <h5><c:out value="There is no articles yet..."/></h5>
                    <hr class="line">
                </div>
            </c:otherwise>
        </c:choose>
    </jsp:body>
</t:template>