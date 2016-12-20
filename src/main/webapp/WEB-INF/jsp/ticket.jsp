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
    String.format = function() {
        if (arguments.length == 0)
            return null;
        var str = arguments[0];
        for ( var i = 1; i < arguments.length; i++) {
            var re = new RegExp('\\{' + (i - 1) + '\\}', 'gm');
            str = str.replace(re, arguments[i]);
        }
        return str;
    };
    function order(routeId) {
        $('option').remove();
        $('#tickets-select').append('<option value="def">请选择座位号</option>');
        $('#tickets-select').selectpicker('refresh');
        $.getJSON("/ticket/" + routeId + "/list", function (data) {
            for (var i in data){
                //alert(data[i].route.name);
                if (data[i].status != 1){
                    //$('#tickets-select').selectpicker('var',data[i].ticketId,data[i].seat);
                    $('#tickets-select').append(String.format("<option value='{0}'>座位号：{1}  价格：{2}</option>",data[i].ticketId,data[i].seat,data[i].price));
                    $('#tickets-select').selectpicker('refresh');
                }
            }
        });
        $('#myModal').modal();
    }
    function buy() {
        if ($('#tickets-select').val()=='def'){
            alert('选啊，pong友');
        }
        $.getJSON("/ticket/"+$('#tickets-select').val()+"/buy","userId="+${sessionScope.user.userId},function (res) {
            if(res==true){
                alert('购买成功！');
            }else {
                alert('失败，请重试！');
            }
            location.assign("<c:url value="/ticket/main"/>")
        });
        //alert($('#tickets-select').val())
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
                    <button type="button" class="btn btn-success btn-sm" onclick="order(${route.routeId})">订 票</button>
                </td>
            </tr>
        </c:forEach>

    </table>
</div>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">座位信息</h4>
            </div>
            <div class="modal-body" id="modal-body">
                <form action="" method="post">
                    <div style="text-align: center;">
                        <select id="tickets-select" class="selectpicker center-block" data-width="500px" title="">

                        </select>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" onclick="buy()">购买</button>
            </div>
        </div>
    </div>
</div>

</body>
</html>