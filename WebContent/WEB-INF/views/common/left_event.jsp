<%@ page contentType="text/html; charset=UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:requestEncoding value="utf-8"/>

<style>

.event_left_menu {
	list-style: none;
	margin: 0px; 
	padding: 0px;
}

#myModal {
	margin-top: 100px;
}

</style> 

<ul class="event_left_menu">
	<li><a href="event_calendar.do">달력</a></li>
	<li><a href="#" id="event_write_form" data-toggle="modal" data-target="#modal_event_write" onclick="return false">만들기</a></li>
</ul>

<jsp:include page="../event/form_event_write.jsp" />
