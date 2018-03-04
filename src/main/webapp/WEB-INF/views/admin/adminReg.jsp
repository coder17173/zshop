<%--
  Created by IntelliJ IDEA.
  User: zhanghang
  Date: 2018/2/9
  Time: 20:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 屏蔽tomcat 自带的 EL表达式 -->
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <title>管理员注册</title>
    <link rel="shortcut icon" href="/images/logo.ico">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jQuery.md5.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/container.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css"/>
</head>
<body>
<%@include file="/common/header-nav.jsp" %>
<div class="container">
    <form:form role="form" action="/admin/doReg"
               method="post" id="regForm" class="form-signin">
        <h2 class="form-signin-heading">管理员注册</h2>
        <div class="form-group">
            <input type="text" class="form-control" name="userName" placeholder="账号" required autofocus>
        </div>
        <div class="form-group">
            <input type="password" class="form-control" id="password" name="password" placeholder="密码" required>
            <input type="hidden" id="PWD" name="PWD">
        </div>
        <div class="form-group">
            <button class="btn btn-lg btn-primary btn-block" id="submit" type="submit" onclick="md5()">注册</button>
        </div>
    </form:form>
</div>
<%@include file="/common/footer.jsp"%>
<script type="text/javascript">
    function md5() {
        var md5PWD = $("#password").val();
        console.log(md5PWD);
        $("#PWD").val($.md5(md5PWD));
    };
</script>
</body>
</html>
