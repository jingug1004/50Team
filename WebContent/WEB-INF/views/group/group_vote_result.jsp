<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>

<table class="table table-striped">
<%-- <c:if test="${empty list }">
<tr>
<td>투표 결과가 없습니다.</td>
</tr>
</c:if>

<c:if test="${!empty list }">
 --%><tr>
<td>투표 항목</td><td>투표 수</td>
</tr>
<c:forEach items="${list }" var="alist" varStatus="i">
<tr>
<td>${alist.v_list }</td><td>${alist.v_count }</td>
</tr>
</c:forEach>
<tr>
<td colspan="2">내가 투표한 항목 : ${vdto.g_vote }</td>
</tr>
<%-- </c:if> --%>
</table>