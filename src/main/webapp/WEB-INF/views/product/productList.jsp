<%--
  Created by IntelliJ IDEA.
  User: zhanghang
  Date: 2018/2/25
  Time: 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 屏蔽tomcat 自带的 EL表达式 -->
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="utf-8">
    <title>商品列表</title>
    <link rel="shortcut icon" href="/images/logo.ico">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/common/toastr/toastr.min.js"></script>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/container.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/product.css"/>
    <style>
        .words{font-size: 18px;
            letter-spacing: 10px;
            position: absolute;
            top:2%;
            color: #f2f2f2;
            left: 24%;}
    </style>
</head>
<body>
<%@include file="/common/header-nav.jsp" %>
<!-- 商品搜索start -->
<div id="sousuo" style="width: 70%;margin-left: 30%;margin-bottom: 30px;margin-top: 30px">
    <form:form id="searchForm" role="form" action="${pageContext.request.contextPath}/product" method="get" class="form-horizontal" enctype="multipart/form-data">
        <div class="row">
            <div class="col-lg-6">
                <div class="input-group">
                    <input id="searchQuery" name="searchQuery" type="text" class="form-control">
                    <span class="input-group-btn">
						<%--<button class="btn btn-default" type="button">商品搜索</button>--%>
                        <button type="submit" class="btn btn-primary" style="background-color: #b1291e;border-color: #b1291e">商品搜索</button>
					</span>
                </div>
            </div>
        </div>
    </form:form>
</div>
<!-- 商品搜索end -->
<div class="container-fluid">
    <!-- category start -->
    <div class="hotProductCategory" style="width: 170px;float: left">
        <c:forEach var="c" items="${categories}">
            <dl>
                <dt>
                    <a href="${pageContext.request.contextPath }/product/findByCid/<c:out value="${c.cid}"/>"><c:out
                            value="${c.cname}"/></a>
                </dt>
                <c:forEach var="cs" items="${c.csList}">
                    <dd>
                        <a href="${ pageContext.request.contextPath }/product/findByCsid/<c:out value="${cs.csid}"/>"><c:out
                                value="${cs.csname}"/></a>
                    </dd>
                </c:forEach>
            </dl>
        </c:forEach>
    </div>
    <!-- category end -->
    <!-- 商品展示start -->
    <div class="row" style="width: 900px;float: left;margin-left: 15px">
        <c:forEach items="${page.result}" var="product">
            <div class="col-md-3 col-sm-4 col-xs-6 text-center" style="height: 300px">
                <a href="${pageContext.request.contextPath}/product/${product.pid}">
                    <img class="img-thumbnail" src="${pageContext.request.contextPath}${product.image}" style="width: 140px; height: 140px;">
                    <c:if test="${product.state == 0}">
                        <div style="width:140px; height:30px; text-align:center; line-height:30px; background-color:rgba(79,82,84,0.3);position: absolute;top:0%;left: 19%;">
                             <span class="words">已下架</span>
                        </div>
                    </c:if>
                </a>
                <p>${product.pname}</p>
                <p class="price">售价 ${product.price} RMB</p>
                <c:if test="${product.buyPrice != null}">
                    <p style="color: #b1291e">购买时价格 ${product.buyPrice} RMB</p>
                </c:if>
                <p>
                    <a class="btn btn-info" href="${pageContext.request.contextPath}/product/${product.pid}"
                       role="button">查看</a>
                    <c:choose>
                        <c:when test="${product.state == 0}">
                            <a class="btn btn-primary addCart" disabled="disabled" productid="${product.pid}" role="button">购买</a>
                        </c:when>
                        <c:otherwise>
                            <a class="btn btn-primary addCart" productid="${product.pid}" role="button">购买</a>
                        </c:otherwise>
                    </c:choose>
                </p>
            </div>
        </c:forEach>
    </div>
    <!-- 商品展示end -->
    <!-- page start-->
    <div class="text-center">
        <%@include file="/common/product-pagination.jsp" %>
    </div>
    <!-- page end -->
</div>
</div>
<!-- /container -->
<%@include file="/common/footer.jsp" %>
<script src="${pageContext.request.contextPath}/js/product.js" type="text/javascript"></script>
</body>
</html>
