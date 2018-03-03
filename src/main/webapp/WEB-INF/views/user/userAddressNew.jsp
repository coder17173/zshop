<%--
  Created by IntelliJ IDEA.
  User: zhanghang
  Date: 2018/3/2
  Time: 17:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 屏蔽tomcat 自带的 EL表达式 -->
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <title>新增地址</title>
    <link rel="shortcut icon" href="/images/logo.ico">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/container.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/row.css"/>
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
        <div class="col-md-6 col-md-offset-3">
            <form:form id="inputForm" role="form" action="${pageContext.request.contextPath}/user/userAddress/doAdd"
                       method="post" class="form-horizontal" enctype="multipart/form-data">
                <div class="form-group">
                    <label class="col-sm-2 control-label">收件人</label>
                    <div class="col-sm-10">
                        <input required class="form-control" type="text" id="name" name="name"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">邮编</label>
                    <div class="col-sm-10">
                        <input required class="form-control" type="text" id="zipcode" name="zipcode"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">电话</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" id="phone" name="phone"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">地址</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" id="address" name="address"/>
                    </div>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">保存</button>
                </div>
            </form:form>
        </div>
    </div>
</div>
<%@include file="/common/footer.jsp" %>
</body>
</html>
