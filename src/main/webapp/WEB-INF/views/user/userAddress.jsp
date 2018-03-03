<%--
  Created by IntelliJ IDEA.
  User: zhanghang
  Date: 2018/3/2
  Time: 16:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 屏蔽tomcat 自带的 EL表达式 -->
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <meta charset="utf-8">
    <title>用户地址管理</title>
    <link rel="shortcut icon" href="/images/logo.ico">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/container.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css"/>
</head>
<body>
<%@include file="/common/header-nav.jsp" %>
<div class="container-fluid">
    <div class="row br">
        <ul class="nav nav-tabs">
            <li><a href="${pageContext.request.contextPath}/user/profile">个人信息</a></li>
            <li><a href="${pageContext.request.contextPath}/user/order">订单管理</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/user/userAddress">地址管理</a></li>
        </ul>
    </div>
    <div class="row2">
        <table class="table table-responsive table-striped">
            <thead>
            <tr>
                <td>收件人</td>
                <td>邮编</td>
                <td>电话</td>
                <td>地址</td>
                <td>操作</td>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${userAddressList}" var="userAddress">
                <tr addressId="${userAddress.id}">
                    <td>${userAddress.name}</td>
                    <td>${userAddress.zipcode}</td>
                    <td>${userAddress.phone}</td>
                    <td>${userAddress.address}</td>
                    <td>
                        <a class="btn btn-info btn-xs" href="${pageContext.request.contextPath}/user/userAddress/delete/${userAddress.id}">删除</a>
                        <a class="btn btn-info btn-xs" href="${pageContext.request.contextPath}/user/userAddress/edit/${userAddress.id}">修改</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <a class="btn btn-primary" href="${pageContext.request.contextPath}/user/userAddress/add">新增地址</a>
</div>
<%@include file="/common/footer.jsp"%>
</body>
</html>
