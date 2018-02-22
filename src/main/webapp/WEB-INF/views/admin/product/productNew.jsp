<%--
  Created by IntelliJ IDEA.
  User: zhanghang
  Date: 2018/2/18
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 屏蔽tomcat 自带的 EL表达式 -->
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <title>商品增加</title>
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
            <li class="active"><a href="${pageContext.request.contextPath}/admin/product">商品管理</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/order">订单管理</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/coupon">优惠管理</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/news">公告管理</a></li>
        </ul>
    </div>
    <div class="row2">
        <div class="col-md-6 col-md-offset-3">
            <form:form id="inputForm" role="form" action="${pageContext.request.contextPath}/admin/product/doNew"
                       method="post" class="form-horizontal" enctype="multipart/form-data">
                <div class="form-group">
                    <label class="col-sm-2 control-label">商品名称</label>
                    <div class="col-sm-10">
                        <input minlength="6" required class="form-control" type="text" id="pname" name="pname"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">商品价格</label>
                    <div class="col-sm-10">
                        <input required class="form-control" type="text" id="price" name="price"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">商品编码</label>

                    <div class="col-sm-10">
                        <input class="form-control" type="text" id="code" name="code"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">商品类型</label>
                    <div class="col-lg-2" style="width: 150px">
                        <select id="csid" name="csid" class="form-control">
                            <c:forEach items="${csList}" var="cs">
                                <option value="${cs.csid}">${cs.csname}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">商品库存</label>
                    <div class="col-sm-10">
                        <input class="form-control" required type="number" id="inventory" name="inventory"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="imgFile">封面图片</label>
                    <div class="col-sm-10">
                        <input type="file" id="imgFile" name="imgFile">
                        <p class="help-block">图片不能超过1MB.</p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">商品简介</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" name="comment"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">商品状态</label>
                    <div class="col-lg-2" style="width: 120px">
                        <select id="state" name="state" class="form-control">
                            <option value="1">在售</option>
                            <option value="0">已下架</option>
                        </select>
                    </div>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">保存</button>
                </div>
            </form:form>
        </div>
    </div>
</div>
<%@include file="/common/footer.jsp"%>
</body>
</html>
