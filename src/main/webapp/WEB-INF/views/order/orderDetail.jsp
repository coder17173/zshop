<%--
  Created by IntelliJ IDEA.
  User: zhanghang
  Date: 2018/2/27
  Time: 16:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 屏蔽tomcat 自带的 EL表达式 -->
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <title>订单详情</title>
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <link rel="shortcut icon" href="/images/logo.ico">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css"/>
</head>
<body>
<%@include file="/common/header-nav.jsp" %>
<div class="container-fluid">
    <div class="form-horizontal">
        <div class="row">
            <div class="page-header">
                <h2>买家信息</h2>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">收货地址</label>
                <div class="col-sm-3">
                    <p class="form-control-static">${order.addr}</p>
                </div>
                <label class="col-sm-2 control-label">邮编</label>
                <div class="col-sm-3">
                    <p class="form-control-static">${order.zipCode}</p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">联系人姓名</label>
                <div class="col-sm-3">
                    <p class="form-control-static">${order.name}</p>
                </div>
                <label class="col-sm-2 control-label">联系人电话</label>
                <div class="col-sm-3">
                    <p class="form-control-static">${order.phone}</p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">创建时间</label>
                <div class="col-sm-3">
                    <p class="form-control-static">${order.createTimeStr}</p>
                </div>
                <label class="col-sm-2 control-label">付款时间</label>
                <div class="col-sm-3">
                    <p class="form-control-static">${order.payTimeStr}</p>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">发货时间</label>
                <div class="col-sm-3">
                    <p class="form-control-static">${order.shipTimeStr}</p>
                </div>
                <label class="col-sm-2 control-label">确认时间</label>
                <div class="col-sm-3">
                    <p class="form-control-static">${order.confirmTimeStr}</p>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="page-header">
            <h2>商品详情</h2>
        </div>
        <table class="table table-striped">
            <thead>
            <tr>
                <td>名称</td>
                <td>编码</td>
                <td>原价</td>
                <td>购买单价</td>
                <td>数量</td>
                <td>总价</td>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${order.orderItems}" var="orderItem">
                <tr pid="${orderItem.oiid}">
                    <td><a href="${pageContext.request.contextPath}/product/${orderItem.product.pid}">${orderItem.product.pname}</a></td>
                    <td>${orderItem.product.code}</td>
                    <td>${orderItem.product.price}</td>
                    <td>${orderItem.buyPrice}</td>
                    <td>${orderItem.count}</td>
                    <td>${orderItem.buyPrice*orderItem.count}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<!-- /container -->
<!-- footer -->
<%@include file="/common/footer.jsp" %>
</body>
</html>
