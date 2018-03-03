<%--
  Created by IntelliJ IDEA.
  User: zhanghang
  Date: 2018/3/3
  Time: 17:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 屏蔽tomcat 自带的 EL表达式 -->
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <title>下单成功</title>
    <link rel="shortcut icon" href="/images/logo.ico">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script type="text/javascript" src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/container.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css"/>
</head>
<body>
<%@include file="/common/header-nav.jsp" %>
<div class="container-fluid">
    <div class="row">
        <div id="delSuccess" class="alert alert-success">下单成功</div>
    </div>
    <div class="row text-center">
        <a class="btn btn-info" href="${pageContext.request.contextPath}/product/">继续购买</a>
        <a class="btn btn-info" href="${pageContext.request.contextPath}/user/order/">查看订单</a>
    </div>
</div>
<!-- /container -->
<!-- footer -->
<%@include file="/common/footer.jsp" %>
</body>
</html>
