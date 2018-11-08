<%@ tag language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="title" %>
<html>
<head>

    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <title>${title}</title>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>" type="text/css">

    <!-- Owl Carousel Assets -->
    <link href="<c:url value="/resources/owl-carousel/assets/owl.carousel.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/owl-carousel/assets/owl.theme.default.min.css"/>" rel="stylesheet">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
    <link href="<c:url value="/resources/css/bootstrap-datetimepicker.min.css"/>" rel="stylesheet" media="screen">

    <!-- Custom Fonts -->
    <link rel="stylesheet" href="<c:url value="/resources/font-awesome-4.4.0/css/font-awesome.min.css"/>"
          type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="<c:url value="/resources/js/respond.min.js"/>"></script>
    <![endif]-->
    <%--Idea bug--%>
    <!--[if lt IE 9]>
    <script src="<c:url value="/resources/js/html5shiv.js"/>" ></script>
    <![endif]-->

</head>

<body>

<c:import url="/WEB-INF/views/pageblocks/header.jsp"/>

<jsp:doBody/>

<c:import url="/WEB-INF/views/pageblocks/footer.jsp"/>


<!-- jQuery-->
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.1.1.min.js"/>"></script>
<!-- Core JavaScript Files -->
<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/bootstrap-datetimepicker.js"/>"
        charset="UTF-8"></script>

<script type="text/javascript" src="<c:url value="/resources/owl-carousel/owl.carousel.min.js"/>"
        charset="UTF-8"></script>

<script type="text/javascript" src="<c:url value="/resources/js/app/article-edit.js"/>" charset="UTF-8"></script>

<script>
    $(function () {
        $("#owl-demo-2").owlCarousel({
            autoPlay: 3000,
            items: 3
        });

        $('#moveToCategorySelect').change(function () {
            if (this.options[this.selectedIndex].value)
                window.location = this.options[this.selectedIndex].value;
        });
    });
</script>

<script type="text/javascript">
    $('.form_datetime').datetimepicker({
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        forceParse: 0,
        showMeridian: 1
    });
    $('.form_date').datetimepicker({
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });
    $('.form_time').datetimepicker({
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 1,
        minView: 0,
        maxView: 1,
        forceParse: 0
    });
</script>
</body>
</html>
