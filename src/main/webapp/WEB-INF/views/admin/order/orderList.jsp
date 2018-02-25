<%--
  Created by IntelliJ IDEA.
  User: zhanghang
  Date: 2018/2/22
  Time: 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 屏蔽tomcat 自带的 EL表达式 -->
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="utf-8">
    <title>订单管理</title>
    <link rel="shortcut icon" href="/images/logo.ico">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <!-- dateTime控件 -->
    <link href="${pageContext.request.contextPath}/common/date/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/common/date/bootstrap-datetimepicker.min.js"></script>
    <script src="${pageContext.request.contextPath}/common/date/bootstrap-datetimepicker.zh-CN.js"></script>

    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css"/>
</head>
<body>
<%@include file="/common/header-nav.jsp" %>
<div class="container-fluid">
    <div class="row br">
        <ul class="nav nav-tabs">
            <li><a href="${pageContext.request.contextPath}/admin/product">商品管理</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/admin/order">订单管理</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/coupon">优惠管理</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/news">公告管理</a></li>
        </ul>
    </div>
    <div class="row2" style="margin-top:20px;width:90%;margin-left:auto;margin-right:auto;">
        <!-- 搜索start -->
        <div class="col-md-10 col-md-offset-3" style="margin-left:10px;margin-top: 10px;">
            <div class="well well-sm" style="width: 110%">
                <form:form id="searchForm" role="form" action="${pageContext.request.contextPath}/admin/order"
                           method="get" class="form-horizontal" enctype="multipart/form-data">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">订单编号</label>
                        <div class="col-sm-3">
                            <input class="form-control" type="text" id="orderNumber" name="orderNumber"/>
                        </div>
                        <label class="col-sm-2 control-label">订单状态</label>
                        <div class="col-sm-3">
                            <select id="orderState" name="orderState" class="form-control">
                                <option value=""></option>
                                <option value="0">待付款</option>
                                <option value="1">待发货</option>
                                <option value="2">已发货</option>
                                <option value="3">已删除</option>
                                <option value="4">已完成</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">开始时间</label>
                        <div class='col-sm-3'>
                            <input id="startDate" class="form-control" name="startDate" placeholder="请选择开始时间" type="text" >
                        </div>
                        <label class="col-sm-2 control-label">结束时间</label>
                        <div class='col-sm-3'>
                            <input  id="endDate" class="form-control" name="endDate" placeholder="请选择结束时间" type="text" >
                        </div>
                        <div class="col-sm-1">
                            <button type="submit" class="btn btn-primary" style="width: 100px">搜索</button>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
        <!-- 搜索end -->
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
                                <a class="btn btn-info btn-xs" href="${pageContext.request.contextPath}/admin/order/${order.oid}">查看</a>
                                <a class="btn btn-info btn-xs" href="${pageContext.request.contextPath}/admin/order/delete/${order.oid}">删除</a>
                            </c:when>
                            <c:when test="${order.state==1}">
                                <a class="btn btn-info btn-xs" href="${pageContext.request.contextPath}/admin/order/${order.oid}">查看</a>
                                <a class="btn btn-info btn-xs" href="${pageContext.request.contextPath}/admin/order/ship/${order.oid}">发货</a>
                                <a class="btn btn-info btn-xs" href="${pageContext.request.contextPath}/admin/order/delete/${order.oid}">删除</a>
                            </c:when>
                            <c:when test="${order.state==2}">
                                <a class="btn btn-info btn-xs" href="${pageContext.request.contextPath}/admin/order/${order.oid}">查看</a>
                            </c:when>
                            <c:when test="${order.state==3}">
                                <a class="btn btn-info btn-xs" href="${pageContext.request.contextPath}/admin/order/${order.oid}">查看</a>
                            </c:when>
                            <c:when test="${order.state==4}">
                                <a class="btn btn-info btn-xs" href="${pageContext.request.contextPath}/admin/order/${order.oid}">查看</a>
                            </c:when>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <!-- 分页 -->
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
</div>
<!-- footer  -->
<%@include file="/common/footer.jsp" %>
<script>
    $("#startDate").datetimepicker({//选择年月日
        format: 'yyyy-mm-dd hh:ii',
        language: 'zh-CN',
        weekStart: 1,
        todayBtn: 1,//显示‘今日’按钮
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 0,  //Number, String. 默认值：0, 'hour'，日期时间选择器所能够提供的最精确的时间选择视图。
        clearBtn:true,//清除按钮
        forceParse: 0
    });
    $("#endDate").datetimepicker({
        format: 'yyyy-mm-dd hh:ii',
        language: 'zh-CN',
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 0,
        clearBtn:true,
        forceParse: 0
    });
</script>
</body>
</html>
