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
<div class="table table-bordered">
	<div style="width: 100%;" class="table table-striped">
		<table style="width: 100%;" class="table table-bordered">
			<tr>
			<td align="left">
			<form action="" id="fileForm" method="post">
			<input type="hidden" value="${g_make.g_seq }" name="g_seq" id="g_seq">
				<ul class="ulA">
					<li class="liA"><a href="#none" id="all_file">모든 파일</a>&nbsp;&nbsp;</li>
					<li class="liA"><b><a href="#none" id="upload_file">업로드된 파일</a></b>&nbsp;&nbsp;</li>
					<!-- <li class="liA"><a href="#none" id="share_text">공유 문서</a>&nbsp;&nbsp;</li> -->
				</ul>
			</form>
			
			
		</table>
		
	</div>
		<div style="width: 100%;" class="table table-striped">
	<table class="table table-hover">
	<col width="auto"><col width="65%"><col width="20%"><col width="10%">
	<c:if test="${empty g_flist}">
	<tr>
	<td colspan="4">결과 없음</td>
	</tr>
	</c:if>
	<c:if test="${!empty g_flist}">
	<c:forEach items="${g_flist }" var="flist" varStatus="i" >
		<c:if test="${flist.n_form_num eq 1 }">
			<tr>
				<td rowspan="2"><img src="image/g_jpg_img.jpg"></td><td><a href="#none">${flist.nf_photo }</a></td><td rowspan="2"><h5>작성자 : ${flist.m_id }</h5></td>
				<td rowspan="2">
				<input type="button" name="btnDown2" value="다운로드" onclick="filedowns('${flist.nf_photo }')"/>
				</td>
			</tr>
			<tr>
				<td><h6>등록일 : ${flist.n_wdate}</h6></td>
			</tr>
		</c:if>
		<c:if test="${flist.n_form_num eq 2 }">
			<tr>
				<td rowspan="2"><img src="image/g_video_img.jpg"></td><td><a href="#none">${flist.nf_video }</a></td><td rowspan="2"><h5>작성자 : ${flist.m_id }</h5></td>
				<td rowspan="2">
				<input type="button" name="btnDown2" value="다운로드" onclick="filedowns('${flist.nf_video }')"/>
				</td>
			</tr>
			<tr>
				<td><h6>등록일 : ${flist.n_wdate}</h6></td>
			</tr>
		</c:if>
	</c:forEach>
	</c:if>
	</table>
	
	</div>
</div>
</div>
<form name="delfileup"  method="post" action="fileDownload.do">
   <input type="hidden" name="filename" value=""/>
</form>
</body>
</html>