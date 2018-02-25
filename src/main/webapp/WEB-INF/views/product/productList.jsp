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
<html>
<head>
    <meta charset="utf-8">
    <title>商品列表</title>
    <link rel="shortcut icon" href="/images/logo.ico">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/container.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/product.css"/>
</head>
<body>
<%@include file="/common/header-nav.jsp" %>
<!-- category end -->
<div class="container-fluid">
    <div class="row-fluid">
        <!-- category start -->
        <div class="hotProductCategory" style="width: 150px;float: left">
            <c:forEach var="c" items="${categories}">
                <dl>
                    <dt>
                        <a href="${pageContext.request.contextPath }/product/findByCid/<c:out value="${c.cid}"/>"><c:out value="${c.cname}"/></a>
                    </dt>
                    <c:forEach var="cs" items="${c.csList}">
                        <dd>
                            <a href="${ pageContext.request.contextPath }/product/findByCsid/<c:out value="${cs.csid}"/>"><c:out value="${cs.csname}"/></a>
                        </dd>
                    </c:forEach>
                </dl>
            </c:forEach>
        </div>
        <div class="row" style="width: 900px;float: left">
            <c:forEach items="${page.result}" var="product">
                <div class="col-md-3 col-sm-4 col-xs-6 text-center">
                    <a href="${pageContext.request.contextPath}/product/${product.pid}"><img class="img-thumbnail"
                                                                                             src="${pageContext.request.contextPath}${product.image}"
                                                                                             style="width: 140px; height: 140px;"></a>
                    <p>${product.pname}</p>
                    <p class="price">售价 ${product.price} RMB</p>
                    <p>
                        <a class="btn btn-info" href="${pageContext.request.contextPath}/product/${product.pid}"
                           role="button">查看</a>
                        <a class="btn btn-primary addCart" productid="${product.pid}" role="button">购买</a>
                    </p>
                </div>
            </c:forEach>
            <!-- page start-->
            <div class="text-center">
                <div class="pagination pagination-centered">
                    <ul class="pagination">
                        <li class="disabled"><a>共${page.totalCount }条数据</a></li>
                        <c:choose>
                            <c:when test="${page.hasPre}">
                                <li><a href="?p=1&ps=${page.pageSize}">&lt;&lt;</a></li>
                                <li><a href="?p=${page.pageNo-1}&ps=${page.pageSize}">&lt;</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="disabled"><a href="#">&lt;&lt;</a></li>
                                <li class="disabled"><a href="#">&lt;</a></li>
                            </c:otherwise>
                        </c:choose>
                        <c:forEach var="i" begin="1" end="${page.totalPages}">
                            <c:choose>
                                <c:when test="${i == page.pageNo}">
                                    <li class="active"><a href="?p=${i}&ps=${page.pageSize}">${i}</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li><a href="?p=${i}&ps=${page.pageSize}">${i}</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <c:choose>
                            <c:when test="${page.hasNext}">
                                <li><a href="?p=${page.pageNo+1}&ps=${page.pageSize}">&gt;</a></li>
                                <li><a href="?p=${page.totalPages}&ps=${page.pageSize}">&gt;&gt;</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="disabled"><a href="#">&gt;</a></li>
                                <li class="disabled"><a href="#">&gt;&gt;</a></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
            </div>
            <!-- page end -->
        </div>
    </div>
</div>
<!-- /container -->
<%@include file="/common/footer.jsp" %>
</body>
</html>
