<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="title">
    Article Edit | Breaking news
</c:set>


<t:template>
    <jsp:body>
        <div class="box">
            <div id="ff">
                <form:form modelAttribute="article" method="post">
                    <label>
                        <span>Title:</span>
                        <form:input path="title"/>
                    </label>
                    <label>
                        <span>Preview:</span>
                        <form:textarea path="preview"/>
                    </label>
                    <label>
                        <span>Article image:</span>
                        <c:choose>
                            <c:when test="${empty article.articleImage}">
                                <img id="articleImagePreview" src="<c:url value="/resources/images/no-image.jpg"/>"/>
                            </c:when>
                            <c:otherwise>
                                <img id="articleImagePreview" src="<c:url value="${article.articleImage}"/>"/>
                            </c:otherwise>
                        </c:choose>
                        <form:hidden path="articleImage"/>
                        <input type="file" accept="image/*" id="uploadImageFilePicker" style="display: none"/>
                    </label>


                    <label>
                            <%--Out categories--%>
                        <span>Category:</span>
                        <select required="required" id="categoryName" name="categoryName">
                            <c:forEach var="category" items="${categories}">
                                <c:choose>
                                    <c:when test="${article.category!=null && article.category.id == category.id}">
                                        <option id="${category.id}" selected="selected">${category.name}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option id="${category.id}">${category.name}</option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
                    </label>

                    <label>
                        <span>Article content:</span>
                        <form:textarea path="info"/>
                    </label>
                    <div style="text-align: center;"><input class="sendButton" type="submit" name="Submit"
                                                            value="Submit"></div>
                </form:form>
            </div>
        </div>
    </jsp:body>
</t:template>
