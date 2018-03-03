<%--
  Created by IntelliJ IDEA.
  User: zhanghang
  Date: 2018/2/27
  Time: 15:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 屏蔽tomcat 自带的 EL表达式 -->
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <title>个人信息</title>
    <link rel="shortcut icon" href="/images/logo.ico">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script type="text/javascript" src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/container.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/row.css"/>
</head>
<body>
<%@include file="/common/header-nav.jsp"%>
<div class="container-fluid">
    <div class="row br">
        <ul class="nav nav-tabs">
            <li class="active"><a href="${pageContext.request.contextPath}/user/profile">个人信息</a></li>
            <li><a href="${pageContext.request.contextPath}/user/order">订单管理</a></li>
            <li><a href="${pageContext.request.contextPath}/user/userAddress">地址管理</a></li>
        </ul>
    </div>
    <div class="form-horizontal">
        <div class="row2" style="margin-left: 20%">
            <div class="form-group">
                <label class="col-sm-2 control-label">用户名</label>
                <div class="col-sm-5">
                    <input id="nickName" class="form-control" type="text" name="nickName" value="${user.nickName}" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">电话号码</label>
                <div class="col-sm-5">
                    <input id="phone" class="form-control" type="text" name="phone" value="${user.phone}" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">地址</label>
                <div class="col-sm-5">
                    <input id="addr" class="form-control" type="text" name="addr" value="${user.addr}" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">邮箱</label>
                <div class="col-sm-5">
                    <input id="email" class="form-control" type="text" name="email" value="${user.email}" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">邮编</label>
                <div class="col-sm-5">
                    <input id="zipCode" class="form-control" type="text" name="zipCode" value="${user.zipCode}" />
                </div>
            </div>
        </div>
    </div>
</div>
<%--<div class="container-fluid">
    <div class="row2">
        <div class="form-group">
            <label class="col-sm-2 control-label">用户名</label>
            <div class="col-sm-3">
                <p class="form-control-static">${user.nickName}</p>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">电话号码</label>
            <div class="col-sm-3">
                <p class="form-control-static">${user.phone}</p>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">地址</label>
            <div class="col-sm-3">
                <p class="form-control-static">${user.addr}</p>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">邮箱</label>
            <div class="col-sm-3">
                <p class="form-control-static">${user.email}</p>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">邮编</label>
            <div class="col-sm-3">
                <p class="form-control-static">${user.zipCode}</p>
            </div>
        </div>
    </div>
</div>--%>
<%@include file="/common/footer.jsp"%>
</body>
</html>
