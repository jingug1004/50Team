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
		<li class="title">PDS자료실</li>
		<li class="subtitle">PDS자료실</li>
		<li class="menu_item">
			<a href="#none" onclick="url_pdslist()" title="자료실목록">자료실목록</a>
		</li>
		<li class="menu_item">
			<a href="#none" onclick="url_pdswrite()" title="자료실추가">자료실추가</a>
		</li>
	</ul>
</div> 


