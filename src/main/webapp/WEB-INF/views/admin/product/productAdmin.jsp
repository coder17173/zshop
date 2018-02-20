<%--
  Created by IntelliJ IDEA.
  User: zhanghang
  Date: 2018/2/11
  Time: 21:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 屏蔽tomcat 自带的 EL表达式 -->
<%@ page isELIgnored="false" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="utf-8">
    <title>商品管理</title>
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
            <li class="active"><a href="${pageContext.request.contextPath}/admin/product">商品管理</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/order">订单管理</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/coupon">优惠管理</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/news">公告管理</a></li>
        </ul>
    </div>
    <div class="row">
        <div class="col-md-10 col-md-offset-3" style="margin-left:10px;margin-top: 10px;">
            <div class="well well-sm" style="width: 110%">
                <form:form id="searchForm" role="form" action="${pageContext.request.contextPath}/admin/product"
                           method="get" class="form-horizontal" enctype="multipart/form-data">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">商品名称</label>
                        <div class="col-sm-2">
                            <input class="form-control" type="text" id="pname" name="pname" placeholder="支持模糊查询"/>
                        </div>
                        <label class="col-sm-2 control-label">商品编码</label>
                        <div class="col-sm-2">
                            <input class="form-control" type="text" id="pcode" name="pcode"/>
                        </div>
                        <label class="col-sm-2 control-label">商品状态</label>
                        <div class="col-lg-2" style="width: 120px">
                            <select id="pstate" name="pstate" class="form-control">
                                <option value=""></option>
                                <option value="1">在售</option>
                                <option value="0">已下架</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">一级类目</label>
                        <div class="col-sm-2">
                            <select id="pcid" name="pcid" class="form-control">
                                <option value=""></option>
                                <c:forEach items="${cList}" var="category">
                                    <option value="${category.cid}">${category.cname}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <label class="col-sm-2 control-label">二级类目</label>
                        <div class="col-sm-2">
                            <select id="pcsid" name="pcsid" class="form-control">
                                <option value=""></option>
                                <c:forEach items="${csList}" var="categorySecond">
                                    <option value="${categorySecond.csid}">${categorySecond.csname}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <label class="col-sm-1 control-label"></label>
                        <div class="col-sm-1">
                            <button type="submit" class="btn btn-primary" style="width: 120px">搜索</button>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>

        <table class="table table-striped">
            <thead>
            <tr>
                <td>ID</td>
                <td>名称</td>
                <td>类型</td>
                <td>编码</td>
                <td>价格</td>
                <td>库存</td>
                <td>状态</td>
                <td>操作</td>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${page.result}" var="product">
                <tr>
                    <td>${product.pid}</td>
                    <td>${product.pname}</td>
                    <td>${product.categorySecond.csname}</td>
                    <td>${product.code}</td>
                    <td>${product.price}</td>
                    <td>${product.inventory}</td>
                    <td>${product.stateDesc}</td>
                    <td><a href="${pageContext.request.contextPath}/admin/product/edit/${product.pid}">修改</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
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
                        <li class="disabled"><a href="#">&lt;&lt;</a></li>
                        <li class="disabled"><a href="#">&lt;</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
    <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/product/new">添加</a>
</div>
<%@include file="/common/footer.jsp" %>
</body>
</html>
