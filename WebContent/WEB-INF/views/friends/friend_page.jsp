<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:requestEncoding value="utf-8"/>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>

<body>

<div style="height: 100px; border: 1px solid black ;">
	<div style="border: 1px; background-color: blue; width: 100px; height: 100px; float: left;" >
		<%-- ${imgpath }\\${member.m_profile} --%>
		upload/${member.m_profile}
	</div>
	<div style="border:1px; background-color:red; float: left;">
		${member.m_id }
	</div>
</div>
<table border="1">
	<tr><td>타임라인</td><td>정보</td><td>친구</td><td>사진</td></tr>
</table>
<br>









</body>
</html>