<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<c:set var="title">
    Contacts | Breaking News
</c:set>

<t:template title="${title}">
    <jsp:body>
        <div class="box">
            <div style="text-align: center;">
                <div class="box-header">
                    <h1 class="center">Contact</h1>
                </div>
            </div>
            <div class="box-content">
                <div id="contact_form">
                    <form name="form1" id="ff" method="post" action="/contact">
                        <label>
                            <span>Enter your name:</span>
                            <input type="text" name="name" id="name" required="">
                        </label>
                        <label>
                            <span>Enter your email:</span>
                            <input type="email" name="email" id="email" required="">
                        </label>
                        <label>
                            <span>Your message here:</span>
                            <textarea name="message" id="message"></textarea>
                        </label>
                        <div style="align: center;"><input class="sendButton" type="submit" name="Submit"
                                                           value="Submit"></div>
                    </form>
                </div>
            </div>
        </div>
    </jsp:body>
</t:template>