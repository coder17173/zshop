<%--
  Created by IntelliJ IDEA.
  User: zhanghang
  Date: 2018/3/3
  Time: 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 屏蔽tomcat 自带的 EL表达式 -->
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <title>购物车</title>
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
        <table class="table table-responsive table-striped">
            <c:choose>
                <c:when test="${empty sessionScope.cart}">
                    <tbody class="text-center">
                    <tr>
                        <td>购物车为空，请继续选购商品</td>
                    </tr>
                    </tbody>
                </c:when>
                <c:otherwise>
                    <thead>
                    <tr>
                        <td>名称</td>
                        <td>类型</td>
                        <td>编码</td>
                        <td>价格</td>
                        <td>数量</td>
                        <td>操作</td>
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
                            <td><a class="btn btn-default btn-xs delTotal">-</a> <label
                                productid="${ci.product.pid}">${ci.number}</label>
                                <a class="btn btn-default btn-xs addTotal">+</a></td>
                            <td><a class="btn btn-info delBtn btn-xs" productid="${ci.product.pid}">删除</a></td>
                            <%--<td><a class="btn btn-info" href="${pageContext.request.contextPath}/cart/delete/${ci.product.pid}">删除</a></td>--%>
                        </tr>
                    </c:forEach>
                    </tbody>
                </c:otherwise>
            </c:choose>
        </table>
        <div id="delSuccess" class="alert alert-success" style="display: none;">删除成功</div>
        <div id="delAllSuccess" class="alert alert-success" style="display: none;">购物车清空成功</div>
    </div>
    <div class="row">
        <div class="col-md-6 col-xs-9">
            <a class="btn btn-info" href="${pageContext.request.contextPath}/product/">继续购买</a>
            <a class="btn btn-info" id="cleanCart">清空购物车</a>
        </div>
        <div class="col-md-6 col-xs-3 text-right">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/order/purchase/">结账</a>
        </div>
    </div>
</div>
<!-- footer -->
<%@include file="/common/footer.jsp" %>
<script src="${pageContext.request.contextPath}/js/cart.js" type="text/javascript"></script>
</body>
</html>
