<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    function submit() {
        if ($('#username').val() == "") {
            alert('朋友，用户名不能为空的');
            return;
        }
        if ($('#password').val() == "") {
            alert('朋友，密码不能为空的');
            return;
        }
        $('#login_from').submit();
    }
    function register() {
        if ($('#username1').val() == "") {
            alert('朋友，用户名不能为空的');
            return;
        }
        if ($('#password1').val() == "") {
            alert('朋友，密码不能为空的');
            return;
        }
        $('#register_from').submit();
    }
</script>
<nav class="navbar navbar-default navbar-fixed-top navbar-inverse" role="navigation">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="<c:url value="/"/>">nTrip</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="<c:url value="/"/>">首页</a></li>
                <c:if test="${sessionScope.user==null||sessionScope.user.userId==-1}">
                    <li><a href="#" onclick="alert('大兄弟，先登录啊！')">买票</a></li>
                </c:if>
                <c:if test="${sessionScope.user!=null&&sessionScope.user.userId!=-1}">
                    <li><a href="<c:url value="/ticket/main"/>">买票</a></li>
                </c:if>

            </ul>
            <c:if test="${sessionScope.user==null||sessionScope.user.userId==-1}">
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">游客<span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#" data-toggle="modal" data-target="#LoginModal">登录</a></li>
                            <li role="presentation" class="divider"></li>
                            <li><a href="#" data-toggle="modal" data-target="#RegisterModal">注册</a></li>
                        </ul>
                    </li>
                </ul>
            </c:if>
            <c:if test="${sessionScope.user!=null&&sessionScope.user.userId!=-1}">
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">用户：${sessionScope.user.name}<span
                                class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="<c:url value="/user/home"/>">用户主页</a></li>
                            <li role="presentation" class="divider"></li>
                            <li><a href="<c:url value="/user/logout"/>">注销</a></li>
                        </ul>
                    </li>
                </ul>
            </c:if>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="container">
    <c:if test="${sessionScope.user==null}">
        <div class="alert alert-info top" role="alert">嘿嘿嘿，醒一醒，你还没登录呢</div>
    </c:if>
    <c:if test="${sessionScope.user.userId==-1}">
        <div class="alert alert-warning top" role="alert">嘿嘿嘿，大兄弟请重新登录</div>
    </c:if>
</div>
<!-- Login Modal -->
<div class="modal fade" id="LoginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">用户登录</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="login_from" action="<c:url value="/user/login"/>" method="post">
                    <div class="form-group">
                        <label for="username" class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="username" name="username" placeholder="用户名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="password" name="password" placeholder="密码">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="login_btn" onclick="submit()">Open the gay</button>
            </div>
        </div>
    </div>
</div>
<!-- Register Modal -->
<div class="modal fade" id="RegisterModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel1">用户注册</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="register_from" action="<c:url value="/user/register"/>" method="post">
                    <div class="form-group">
                        <label for="username" class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="username1" name="username" placeholder="用户名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="password1" name="password" placeholder="密码">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="register_btn" onclick="register()">Open the gay
                </button>
            </div>
        </div>
    </div>
</div>
