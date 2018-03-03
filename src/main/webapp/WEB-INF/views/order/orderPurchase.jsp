<%--
  Created by IntelliJ IDEA.
  User: zhanghang
  Date: 2018/3/3
  Time: 15:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 屏蔽tomcat 自带的 EL表达式 -->
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="utf-8">
    <title>确认订单</title>
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
    <form:form cssClass="form-horizontal" action="${pageContext.request.contextPath}/order/ordering" method="post">
    <div class="row" style="margin-top: -15px">
        <div class="col-sm-6 list-group">
            <div class="page-header">
                <h2>请选择收货地址</h2>
            </div>
            <c:forEach items="${addressList}" var="address">
                <label>
                    <input type="radio" name="optionsRadios" id="optionsRadios" value="${address.id}">
                        ${address.address}&nbsp;&nbsp;&nbsp;${address.name}&nbsp;&nbsp;&nbsp;${address.phone}&nbsp;&nbsp;&nbsp;${address.zipcode}
                </label>
            </c:forEach>
        </div>
        <div class="row" style="margin-top: 20%;margin-left: 2px;">
            <div class="page-header" >
                <h2>商品详情</h2>
            </div>
            <table class="table table-striped">
                <thead>
                <tr>
                    <td>名称</td>
                    <td>类型</td>
                    <td>编码</td>
                    <td>价格</td>
                    <td>数量</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${sessionScope.cart}" var="cartItem">
                    <c:set var="ci" value="${cartItem.value}"></c:set>
                    <tr pid="${ci.product.pid}">
                        <td>${ci.product.pname}</td>
                        <td>${ci.product.categorySecond.category.cname}/${ci.product.categorySecond.csname}</td>
                        <td>${ci.product.code}</td>
                        <td>${ci.product.price}</td>
                        <td>${ci.number}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="row text-right">
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/cart/">回购物车修改</a>
                <button class="btn btn-primary" type="submit" href="${pageContext.request.contextPath}/order/ordering/">
                    确认
                </button>
            </div>
            <div id="delSuccess" class="alert alert-success" style="display: none;">删除成功</div>
            <div id="delAllSuccess" class="alert alert-success" style="display: none;">购物车清空成功</div>
        </div>
        </form:form>
    </div>
</div>
<!-- /container -->
<!-- footer -->
<%@include file="/common/footer.jsp" %>
<script src="${pageContext.request.contextPath}/js/cart.js" type="text/javascript"></script>
</body>
</html>
