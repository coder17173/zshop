<%--
  Created by IntelliJ IDEA.
  User: zhanghang
  Date: 2018/2/10
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 屏蔽tomcat 自带的 EL表达式 -->
<%@ page isELIgnored="false" %>
<html>
<head>
    <head>
        <meta charset="utf-8">
        <title>管理员登陆</title>
        <link rel="shortcut icon" href="/images/logo.ico">
        <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
        <script type="text/javascript" src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/container.css"/>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css"/>
    </head>
</head>
<body>
<%@include file="/common/header-nav.jsp"%>
<div class="container">
    <form:form role="form" action="/admin/login" method="post" id="loginForm" class="form-signin">
        <!-- 自动隐藏提示信息 -->
        <c:if test="${not empty param.errorPwd}">
            <div id="errorPwd" class="alert alert-success">密码错误</div>
        </c:if>
        <h2 class="form-signin-heading">管理员登陆</h2>
        <div class="form-group">
            <input type="text" class="form-control" name="userName" placeholder="账号" required autofocus>
        </div>
        <div class="form-group">
            <input type="password" class="form-control" name="password" placeholder="密码" required>
        </div>
        <div class="form-group">
            <button class="btn btn-lg btn-primary btn-block" type="submit">登陆</button>
        </div>
    </form:form>
</div>
<%@include file="/common/footer.jsp"%>
<!-- 自动隐藏提示信息 -->
<script type="text/javascript">
    setTimeout(function () {
        $('#errorPwd').hide('slow');
    }, 5000);
</script>
</body>
</html>
