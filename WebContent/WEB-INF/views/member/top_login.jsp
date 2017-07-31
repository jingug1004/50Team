<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="generator" content="Bootply" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">

<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery-ui.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery.cookie.js"></script>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/jquery/jquery-ui.css"/>
<link href="css/styles.css" rel="stylesheet">
		
<title>Insert title here</title>
</head>
<body>

 	<form id="_frmForm">
	<div style="float: left; font-size: 45px; padding-left: 250px; padding-top: 20px; color: #fff; font-weight: bold; ">fakebook</div>
	
	<div align="center" style="background-color: #3B5998; padding: 25px 0; ">
	<i class="fa fa-envira" aria-hidden="true"></i>
	
	<table>
	
	<tr style="color: #ffffff;">
		<td>이메일 또는 휴대폰</td>
		<td>비밀번호</td>
		
	</tr>
	<tr>
		<td><input class="form-control" type="text" name="m_id" id="_id" size="20"></td>
		<td><input class="form-control" type="password" name="m_password" id="_pwd"size="20"></td>
		<td><button type="button" onclick="top_login()" id="_login" class="btn btn-success" title="로그인">로그인</button>	</td>
		<td>
		<button type="button" onclick="top_regi()" id="_regi" class="btn btn-success" title="회원가입">회원가입</button>

		</td>
	</tr>
	
	</table>
	</div>
		
	</form> 
	
<script type="text/javascript">
function top_login() {
	if($("#_id").val() == ""){
		alert("아이디를 입력해 주십시오.");
		$("#_id").focus();
		
	}else if($("#_pwd").val()==""){
		alert("패스워드를 입력해 주십시오.");
		$("#_pwd").focus();
		
	}else{
		$("#_frmForm").attr({"target":"_self", "action":"NewsFeedList.do"}).submit();
	}
}
function top_regi(){
	$("#_frmForm").attr({"target":"_self", "action":"regi.do"}).submit();
}

</script>
</body>

</html>