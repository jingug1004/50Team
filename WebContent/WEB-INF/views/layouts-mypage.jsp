<%@ page contentType="text/html; charset=UTF-8"%>

<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:requestEncoding value="utf-8"/>


<!DOCTYPE html>
<html lang="ko">
<head>
	<tiles:insertAttribute name="header2"/>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/go_url.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css"/>
	<style type="text/css"></style>
</head>

<body>

<div id="body_wrap">
	<div id="main_wrap">
		<div id="header_wrap">
			<tiles:insertAttribute name="top_inc2"/>
		</div>	
		
		<div id="middle_wrap">
			<div id="my_content_wrap">
				<div id="my_top_wrap">
				<tiles:insertAttribute name="my_page1"/>
				</div>	
				<div id="my_content_wrap2">
				<tiles:insertAttribute name="my_page2"/>
				</div>
			</div>		
		</div>	
	</div>
</div>

<script type="text/javascript">
$(document).ready(function() {
	$("#content_title_wrap div.title").css("background-image", "url('<%=request.getContextPath()%>/image/ico_sub_sb.gif')");	
});
</script>

</body>
</html>




