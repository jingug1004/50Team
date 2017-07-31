<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="utf-8" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="modal fade yss">
  <div class="modal-dialog">
    <div class="modal-content">
       <jsp:include page="/WEB-INF/views/member/file_up.jsp"/>
    </div>
  </div> 
</div> 
<div class="form-control" style=" width: 100%; height: 100%;">
<table>
<tr>
	<td rowspan="3">
		<c:if test="${login.m_profile eq 'member_basic.jpg'}">
		<img style="float: left;" alt="사진없음" src="./image/${login.m_profile}" height="100px" width="100px" data-toggle="modal" data-target=".yss" onmouseover="over()" onmouseout="out()" >
		</c:if>
		<c:if test="${login.m_profile ne 'member_basic.jpg'}">
		<img style="float: left;" alt="사진없음" src="upload/${login.m_profile}" height="100px" width="100px" data-toggle="modal" data-target=".yss" onmouseover="over()" onmouseout="out()" >
		</c:if>
	</td>
</tr>
<tr>
	<td>
		<label data-toggle="modal" data-target=".yss">사진 변경</label>
	</td>
</tr>
<tr>
	<td>
		${login.m_nickname }
	</td>
</tr>
<tr>
</table>
</div>

<table>
		<tr><td><a href="time_line.do">타임라인&nbsp;&nbsp;&nbsp;</a></td><td><a href="my_page.do">정보&nbsp;&nbsp;&nbsp;</a></td></tr>
	</table>
<br>
<br><br>

</body>
</html>