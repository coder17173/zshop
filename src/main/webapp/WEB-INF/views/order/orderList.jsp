<%--
  Created by IntelliJ IDEA.
  User: zhanghang
  Date: 2018/2/27
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 屏蔽tomcat 自带的 EL表达式 -->
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <title>订单列表</title>
    <link rel="shortcut icon" href="/images/logo.ico">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script type="text/javascript" src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/container.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css"/>
</head>
<body>
<%@include file="/common/header-nav.jsp"%>
<div class="container-fluid">
    <div class="row br">
        <ul class="nav nav-tabs">
            <li><a href="${pageContext.request.contextPath}/user/profile">个人信息</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/user/order">订单管理</a></li>
            <li><a href="${pageContext.request.contextPath}/user/userAddress">地址管理</a></li>
        </ul>
    </div>
    <div class="row">
        <table class="table table-responsive table-striped">
            <thead>
            <tr>
                <td>订单日期</td>
                <td>订单编号</td>
                <td>订单金额</td>
                <td>订单状态</td>
                <td>收件人</td>
                <td>操作</td>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${page.result}" var="order">
                <tr pid="${order.oid}">
                    <td>${order.createTimeStr}</td>
                    <td>${order.orderNumber}</td>
                    <td>${order.total}</td>
                    <td>
                        <c:choose>
                            <c:when test="${order.state==0}">等待付款</c:when>
                            <c:when test="${order.state==1}">等待发货</c:when>
                            <c:when test="${order.state==2}">已发货</c:when>
                            <c:when test="${order.state==3}">已取消</c:when>
                            <c:when test="${order.state==4}">已完成</c:when>
                        </c:choose>
                    </td>
                    <td>${order.name}</td>
                    <td>
                        <c:choose>
                            <c:when test="${order.state==0}">
                                <a class="btn btn-info btn-xs" href="${pageContext.request.contextPath}/order/${order.oid}">查看</a>
                                <a class="btn btn-info btn-xs" href="${pageContext.request.contextPath}/order/pay/${order.oid}">付款</a>
                                <a class="btn btn-info btn-xs" href="${pageContext.request.contextPath}/order/cancel/${order.oid}">取消订单</a>
                            </c:when>
                            <c:when test="${order.state==1}">
                                <a class="btn btn-info btn-xs" href="${pageContext.request.contextPath}/order/${order.oid}">查看</a>
                                <a class="btn btn-info btn-xs" href="${pageContext.request.contextPath}/order/cancel/${order.oid}">取消订单</a>
                            </c:when>
                            <c:when test="${order.state==2}">
                                <a class="btn btn-info btn-xs" href="${pageContext.request.contextPath}/order/${order.oid}">查看</a>
                                <a class="btn btn-info btn-xs" href="${pageContext.request.contextPath}/order/confirm/${order.oid}">确认收货</a>
                            </c:when>
                            <c:when test="${order.state==3}">
                                <a class="btn btn-info btn-xs" href="${pageContext.request.contextPath}/order/${order.oid}">查看</a>
                            </c:when>
                            <c:when test="${order.state==4}">
                                <a class="btn btn-info btn-xs" href="${pageContext.request.contextPath}/order/${order.oid}">查看</a>
                            </c:when>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <!-- pagination -->
    <div class="pagination pagination-centered" style="margin-left: 30%">
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
<!-- footer -->
<%@include file="/common/footer.jsp" %>
</body>
</html>
