<%@tag pageEncoding="UTF-8"%>
<%@ attribute name="page" type="com.zshop.common.Page" required="true"%>
<%@ attribute name="paginationSize" type="java.lang.Integer" required="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    int current = page.getPageNo();
    long begin = 1;
    long end = page.getTotalPages();
    request.setAttribute("current", current);
    request.setAttribute("begin", begin);
    request.setAttribute("end", end);
%>

<div class="pagination pagination-centered">
    <ul class="pagination">
        <li class="disabled"><a>共${page.totalCount }条数据</a></li>
        <% if (page.isHasPre()){%>
        <li><a href="?p=1&ps=${page.pageSize}">&lt;&lt;</a></li>
        <li><a href="?p=${current-1}&ps=${page.pageSize}">&lt;</a></li>
        <%}else{%>
        <li class="disabled"><a href="#">&lt;&lt;</a></li>
        <li class="disabled"><a href="#">&lt;</a></li>
        <%} %>

        <c:forEach var="i" begin="1" end="${page.totalPages}">
            <c:choose>
                <c:when test="${i == current}">
                    <li class="active"><a href="?p=${i}&ps=${page.pageSize}">${i}</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="?p=${i}&ps=${page.pageSize}">${i}</a></li>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <% if (page.isHasNext()){%>
        <li><a href="?p=${current+1}&ps=${page.pageSize}">&gt;</a></li>
        <li><a href="?p=${page.totalPages}&ps=${page.pageSize}">&gt;&gt;</a></li>
        <%}else{%>
        <li class="disabled"><a href="#">&gt;</a></li>
        <li class="disabled"><a href="#">&gt;&gt;</a></li>
        <%} %>
    </ul>
</div>