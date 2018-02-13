<%--
  Created by IntelliJ IDEA.
  User: zhanghang
  Date: 2018/2/10
  Time: 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span> <span class="icon-bar"></span> <span
                    class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/product">逆非的商铺</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li><a href="${ctx}/product/">首页</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <c:choose>
                    <c:when test="${not empty login_user}">
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                    ${login_user.nickName}
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="${pageContext.request.contextPath}/user/profile">个人设置</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/logout">登出</a></li>
                            </ul>
                        </li>
                    </c:when>
                    <c:when test="${not empty login_admin}">
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                    ${login_admin.userName}
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="${pageContext.request.contextPath}/admin/product">后台管理</a></li>
                                <li><a href="${pageContext.request.contextPath}/admin/logout">登出</a></li>
                            </ul>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="${pageContext.request.contextPath}/user/login">登陆</a></li>
                        <li><a href="${pageContext.request.contextPath}/user/reg">注册</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
            <form class="navbar-form navbar-right" role="cart">
                <a href="${pageContext.request.contextPath}/cart/" class="btn btn-info">购物车</a>
            </form>
        </div>
        <!--/.nav-collapse -->
    </div>
</nav>
