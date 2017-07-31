<%@ page contentType="text/html; charset=UTF-8"%>

<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:requestEncoding value="utf-8"/>

<!DOCTYPE html>
<html lang="ko">
<head>
	<tiles:insertAttribute name="header"/>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css"/>
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>

<div id="body_wrap">
	<div id="main_wrap">
		<div id="header_wrap">
			<tiles:insertAttribute name="top_inc"/>
		</div>	
		
		<div id="middle_wrap">
			<div id="sidebar_wrap">
				<tiles:insertAttribute name="left_main"/>			
			</div>
			<div id="content_wrap">
				<tiles:insertAttribute name="center_main"/>
			</div>		
		</div>	
	</div>
</div>

</body>
</html>
