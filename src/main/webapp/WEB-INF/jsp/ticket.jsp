<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="zh-cn">
<head>
    <title>该订票了</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

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
<%--引入导航栏--%>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/jsp/common/head.jsp"/>
<script>
    function order() {
        
    }
</script>
<div class="container">
    <table class="table table-striped table-hover">
        <caption>航线列表</caption>
        <thead>
            <tr>
                <th>序号</th>
                <th>航线名</th>
                <th>始发</th>
                <th>终点</th>
                <th>起飞时间</th>
                <th>到达时间</th>
                <th>操作</th>
            </tr>
        </thead>
        <c:forEach items="${requestScope.routes}" var="route" varStatus="idx">
            <tr>
                <td>${idx.index+1}</td>
                <td>${route.name}</td>
                <td>${route.startCity.name}</td>
                <td>${route.endCity.name}</td>
                <td>${route.startTime}</td>
                <td>${route.endTime}</td>
                <td>
                    <button type="button" class="btn btn-success btn-sm" onclick="order()">订 票</button>
                </td>
            </tr>
        </c:forEach>

    </table>
</div>
</body>
</html>