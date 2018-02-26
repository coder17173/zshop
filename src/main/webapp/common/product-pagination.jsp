<%--
  Created by IntelliJ IDEA.
  User: zhanghang
  Date: 2018/2/26
  Time: 15:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="pagination pagination-centered">
    <ul class="pagination">
        <li class="disabled"><a>共${page.totalCount }条数据</a></li>
        <c:choose>
            <c:when test="${page.hasPre}">
                <li><a href="?p=1&ps=${page.pageSize}&searchQuery=${searchQuery}">&lt;&lt;</a></li>
                <li><a href="?p=${page.pageNo-1}&ps=${page.pageSize}&searchQuery=${searchQuery}">&lt;</a></li>
            </c:when>
            <c:otherwise>
                <li class="disabled"><a href="#">&lt;&lt;</a></li>
                <li class="disabled"><a href="#">&lt;</a></li>
            </c:otherwise>
        </c:choose>
        <c:forEach var="i" begin="1" end="${page.totalPages}">
            <c:choose>
                <c:when test="${i == page.pageNo}">
                    <li class="active"><a href="?p=${i}&ps=${page.pageSize}&searchQuery=${searchQuery}">${i}</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="?p=${i}&ps=${page.pageSize}&searchQuery=${searchQuery}">${i}</a></li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:choose>
            <c:when test="${page.hasNext}">
                <li><a href="?p=${page.pageNo+1}&ps=${page.pageSize}&searchQuery=${searchQuery}">&gt;</a></li>
                <li><a href="?p=${page.totalPages}&ps=${page.pageSize}&searchQuery=${searchQuery}">&gt;&gt;</a></li>
            </c:when>
            <c:otherwise>
                <li class="disabled"><a href="#">&gt;</a></li>
                <li class="disabled"><a href="#">&gt;&gt;</a></li>
            </c:otherwise>
        </c:choose>
    </ul>
</div>
