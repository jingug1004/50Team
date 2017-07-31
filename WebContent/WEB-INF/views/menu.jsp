<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메뉴</title>
</head>
<body>

<h1>로그인</h1>

<c:if test="${ not empty login }">

	${ login.id }님 아뇽~
	
	<table border="1" bgcolor="#00FF80">
	<col width="200"/>
		<tr>
			<td>
				<a href="boardList.do">글 목록</a>
			</td>
		</tr>
		<tr>
			<td>
				<a href="boardWrite.do">글 쓰기</a>
			</td>
		</tr>
	</table>
	
	<a href="logout.do">로그아웃</a>
	
</c:if>

<c:if test="${ empty login }">
<form action="loginAf.do" method="post">

<table border="1">
	<tr>
		<td>아이디</td>
		<td><input type="text" name="id" size="20"/></td>
	</tr>
	
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="pw" size="21"/></td>
	</tr>
	
	<tr>
		<td colspan="2"><input type="submit" value="로그인" style="width:100%; height:40px;"/></td>
	</tr>
</table>

</form>

<a href="regi.do">회원가입</a>
</c:if>


</body>
</html>