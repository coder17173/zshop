<%--
  Created by IntelliJ IDEA.
  User: zhanghang
  Date: 2018/2/27
  Time: 11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 屏蔽tomcat 自带的 EL表达式 -->
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <title>用户注册</title>
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
    <form:form role="form" action="/user/doReg"
               method="post" id="regForm" class="form-signin">
        <h2 class="form-signin-heading">用户注册</h2>
        <div class="form-group">
            <input type="text" class="form-control" name="nickName" placeholder="账号" required autofocus>
        </div>
        <div class="form-group">
            <input type="password" class="form-control" id="password" name="password" placeholder="密码" required>
            <input type="hidden" id="PWD" name="PWD">
        </div>
 <%--       <div class="form-group">
            <input type="text" class="form-control" name="realName" placeholder="真实姓名">
        </div>--%>
        <div class="form-group">
            <input type="text" class="form-control" name="email" placeholder="邮箱">
        </div>
        <div class="form-group">
            <input type="text" class="form-control" name="phone" placeholder="手机号码">
        </div>
       <%-- <div class="form-group">
            <input type="text" class="form-control" name="age" placeholder="年龄">
        </div>--%>
       <%-- <div class="form-group">
            <input type="text" class="form-control" name="addr" placeholder="地址">
        </div>--%>
       <%-- <div class="form-group">
            <input type="text" class="form-control" name="zipCode" placeholder="邮编">
        </div>--%>
        <div class="form-group">
            <button class="btn btn-lg btn-primary btn-block" id="submit" type="submit" onclick="md5()">注册</button>
        </div>
    </form:form>
</div>
<%@include file="/common/footer.jsp" %>
<script type="text/javascript">
    function md5() {
        var md5PWD = $("#password").val();
        console.log(md5PWD);
        $("#PWD").val($.md5(md5PWD));
    };
</script>
</body>
</html>
