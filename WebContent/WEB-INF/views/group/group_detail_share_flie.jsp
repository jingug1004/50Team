<%@ page contentType="text/html; charset=UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="utf-8"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<style type="text/css">
ul.ulA {
    list-style:none;
    margin:0;
    padding:0;
}
li.liA {
    margin: 0 0 0 0;
    padding: 0 0 0 0;
    border : 0;
    float: left;
}
</style>
<script>
$(document).ready(function(){
    $("#all_file").click(function() {
    	$("#fileForm").attr({"target":"_self","action":"group_detail_flie.do"}).submit();
	});
    $("#upload_file").click(function() {
    	$("#fileForm").attr({"target":"_self","action":"group_detail_upload_flie.do"}).submit();
	});
    $("#share_text").click(function() {
    	$("#fileForm").attr({"target":"_self","action":"group_detail_share_flie.do"}).submit();
	});
});
</script>
</head>
<body>
<!-- 헤더 -->
<div>
<div style="width: 100%;">
<jsp:include page="/WEB-INF/views/group/group_header.jsp"/>
</div>
<!-- 헤더 끝-->
<hr>
<div style="width: 100%; border: 1px solid black;">
		<table style="width: 100%;" border="1">
			<tr>
			<td align="left">
			<form action="" id="fileForm" method="post">
			<input type="hidden" value="${g_make.g_seq }" name="g_seq" id="g_seq">
				<ul class="ulA">
					<li class="liA"><a href="#none" id="all_file">모든 파일</a>&nbsp;&nbsp;</li>
					<li class="liA"><a href="#none" id="upload_file">업로드된 파일</a>&nbsp;&nbsp;</li>
					<li class="liA"><b><a href="#none" id="share_text">공유 문서</a></b>&nbsp;&nbsp;</li>
				</ul>
			</form>
			
			
		</table>
		
	</div>
<!-- 뉴스피드 들어감 -->
</div>
</body>
</html>