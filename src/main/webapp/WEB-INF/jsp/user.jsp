<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="zh-cn">
<head>
    <title>${sessionScope.user.name}的主页</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="<c:url value="/css/bootstrap-select.min.css"/>" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        body {
            padding-top: 70px;
        }
    </style>
</head>
<body>
<script src="${pageContext.request.contextPath}/js/jquery-3.1.1.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="<c:url value="/js/bootstrap-select.min.js"/>"></script>
<%--引入导航栏--%>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/common/head.jsp"/>
<script>
    String.format = function () {
        if (arguments.length == 0)
            return null;
        var str = arguments[0];
        for (var i = 1; i < arguments.length; i++) {
            var re = new RegExp('\\{' + (i - 1) + '\\}', 'gm');
            str = str.replace(re, arguments[i]);
        }
        return str;
    };

</script>
<div class="container">
    <table class="table table-striped table-hover">
        <caption>订单详情</caption>
        <thead>
        <tr>
            <th>序号</th>
            <th>航线名</th>
            <th>始发</th>
            <th>终点</th>
            <th>起飞时间</th>
            <th>到达时间</th>
            <th>座位</th>
            <th>价格</th>
            <th>下单时间</th>
        </tr>
        </thead>
        <c:forEach items="${requestScope.orders}" var="order" varStatus="idx">
            <tr>
                <td>${idx.index+1}</td>
                <td>${order.ticket.route.name}</td>
                <td>${order.ticket.route.startCity.name}</td>
                <td>${order.ticket.route.endCity.name}</td>
                <td>${order.ticket.route.startTime}</td>
                <td>${order.ticket.route.endTime}</td>
                <td>${order.ticket.seat}</td>
                <td>${order.ticket.price}</td>
                <td>${order.time}</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>