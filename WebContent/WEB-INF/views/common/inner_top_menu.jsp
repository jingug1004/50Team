<%@ page contentType="text/html; charset=UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:requestEncoding value="utf-8"/>

<script src="js/friend.js"></script>

<!-- ay -->

<div id="top_menu_wrap">
	<div id="_top_menu">
		<form class="navbar-form navbar-left" name="idCheckForm" method="get" action="">
			<div class="form-group">
				<input type="hidden" name="m_id" value="${login_id }">
		    	<input type="text" class="form-control" placeholder="이름" name="insearchname" onkeypress="if(event.keyCode==13) {Searchingin(); return false;}">
		    	<a href="javascript:Searchingin()" class="btn btn-primary">검색</a>
		    </div>
		</form>
	</div>
</div>

