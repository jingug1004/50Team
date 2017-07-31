<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:requestEncoding value="utf-8"/>  

<html>
<head>

</head>
<body>



<jsp:include page="../newsfeed/newsfeed_write.jsp">
	<jsp:param name="viewPage" value="main" />
	<jsp:param name="eventSeq" value="0" />
</jsp:include> 

<jsp:include page="../newsfeed/newsfeed_list(people).jsp">
	<jsp:param name="viewPage" value="people" />
	<jsp:param name="eventSeq" value="0" />
</jsp:include> 







</body>
</html>