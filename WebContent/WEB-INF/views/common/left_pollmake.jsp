<%@ page contentType="text/html; charset=UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:requestEncoding value="utf-8"/>

<style>
.menu_table 
li.menu_item
a:hover{
	background-image:url("<%=request.getContextPath()%>/image/arrow.gif");
	background-repeat:no-repeat;
	background-position:5px 7px;
	background-color:#ffffff;
}
</style> 

<div class="menu_table">
	<ul style="width:100%;">
	
	<c:if test="${login.auth eq '3' }">
			<li class="title">투표하기</li>
		<li class="subtitle">투표</li>
		<li class="menu_item">
		<a href="#none" onclick="url_polllist();" title="투표목록">투표목록</a>
		</li>
</c:if>	
	
	
	<c:if test="${login.auth eq '1' }">
		<li class="title">투표만들기</li>
		<li class="subtitle">투표</li>
		<li class="menu_item">
		<a href="#none" onclick="url_polllist();" title="투표목록">투표목록</a>
		</li>
	</c:if>	
	</ul>
</div>