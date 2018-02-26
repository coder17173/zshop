<%--
  Created by IntelliJ IDEA.
  User: zhanghang
  Date: 2018/2/26
  Time: 19:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 屏蔽tomcat 自带的 EL表达式 -->
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>商品信息</title>
    <link rel="shortcut icon" href="/images/logo.ico">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/container.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css"/>
</head>
<body>
<%@include file="/common/header-nav.jsp" %>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-5 text-center" style="margin-top: 40px;padding-left: 40px">
            <img class="img-responsive img-rounded" src="${pageContext.request.contextPath}${product.image}">
        </div>
        <div class="col-md-7">
            <div class="form-group">
                <label>商品名称：</label>${product.pname}
            </div>
            <div class="form-group">
                <label>商品编码：</label>${product.code}
            </div>
            <div class="form-group">
                <label>商品类型：</label>${product.categorySecond.category.cname}/${product.categorySecond.csname}
            </div>
            <div class="form-group">
                <label>商品价格：</label>${product.price}&nbsp;RMB
            </div>
            <div class="form-group">
                <label>商品简介：</label>${product.comment}
            </div>
            <p>
                <a class="btn btn-primary" productid="${product.pid}" role="button"
                   style="width:200px;height:40px;background-color: #b65957;border-style: none;font-size: large">加入购物车</a>
            </p>

            <a class="reduce" onClick="setAmount.reduce('#pamount')" href="javascript:void(0)" style="float: left">
                <button style="font-size: 18px;margin-top: 2px">-</button>&nbsp;</a>
            <input id="pamount" value="1" type="text" class="form-control" onkeyup="setAmount.modify('#pamount')"
                   style="width: 50px;float: left">
            <a class="reduce" onclick="setAmount.add('#pamount')" href="javascript:void(0)" style="float: left">&nbsp;<button
                    style="font-size: 18px;margin-top: 2px">+
            </button>
            </a>
        </div>
    </div>
</div>
<!-- /container -->
<%@include file="/common/footer.jsp" %>
<script type=text/javascript src="/js/cartNum.js">
</script>
</body>
</html>
