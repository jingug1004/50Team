<%@page import="java.util.Calendar"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="utf-8"/>    
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js" ></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<br><br>
<h4>패스워드</h4>
<hr>
<a onclick="modify_pwd1()" id="_modify_pwd" class="btn btn-success">패스워드 변경</a>
<div id="ch_pwd">
<h4>현재 비밀번호&nbsp;&nbsp;&nbsp;<input type="password" style="ime-mode:disabled; display: inline; width: 200px;" class="form-control" id ="_pwd" placeholder="현재 비밀번호">
<a onclick="check_pwd()" id="_check_pwd" class="btn btn-success">패스워드 확인</a>
</h4>
</div>

<div id="new_pwd">
<h4>
<table style="margin: auto;">
<col width="300px;">
<tr><td align="left">
새로운 비밀번호</td><td align="right"><input type="password" style="ime-mode:disabled; display: inline; width: 200px;" class="form-control" id ="new_pwd1" placeholder="비밀번호 입력">
</td></tr>
<tr><td align="left">
새로운 비밀번호 확인</td><td align="right"><input type="password" style="ime-mode:disabled; display: inline; width: 200px;" class="form-control" id ="new_pwd2" placeholder="비밀번호 재입력" onkeyup="che_pwd()">
</td></tr>
</table>
</h4>
</div>
<div id="_checkPwd">

</div>
<div>
<a id="_pwd_ok" onclick="modify_pwd()" class="btn btn-success">확인</a>
<a id="_pwd_cancel" onclick="pwd_cancel()" class="btn btn-success">취소</a>
<!-- <button type="button" id="_pwd_ok" onclick="modify_pwd()">확인</button>
<button type="button" id="_pwd_cancel" onclick="pwd_cancel()">취소</button> -->
</div>


<hr>
<h4>
닉네임
</h4>
<hr>
<!-- <div style="height:50px;"><font size="4">닉네임</font></div> -->
<table id="_nickname" style="margin: auto;">
<col width="150px;"><col width="150px;">
<tr>
<td align="left">
<div>
<h4>
${login.m_nickname}
</h4>
</div>
</td>
<td align="right">
<a onclick="modify_nickname1()" class="btn btn-success">수정</a>
</tr>
</table>

<div id="_m_nickname" style="float: inherit;">
<input type="text" style="ime-mode:disabled; display: inline; width: 100px;" class="form-control" id="m_nickname" maxlength="5">
<a onclick="modify_nickname()" class="btn btn-success">확인</a>
<a onclick="nick_cancel()" class="btn btn-success">취소</a>
<!-- <button onclick="modify_nickname()">확인</button>
<button onclick="nick_cancel()">취소</button> -->
</div>

<hr>
<h4>
휴대전화번호
</h4>
<hr>
<h4>
<table id="_phone" style="margin: auto;">
<col width="150px;"><col width="150px;">
<tr><td align="left">
${login.m_phone} 
</td>
<td align="right">
<a onclick="modify_phone1()" class="btn btn-success">수정</a>
<!-- <button onclick="modify_phone1()">수정</button> -->
</td>
</tr>
</table>
</h4>
<div id="_m_phone">

<select id="_m_phone1" class="form-control" name="m_phone1" style="display: inline; width: 100px;">
<option>010</option>
	<option>011</option>
	<option>016</option>
	<option>018</option>
</select>
-
<input id="_m_phone2" type="text" class="form-control" style="ime-mode:disabled; ime-mode:disabled; display: inline; width: 100px;" onkeydown="return phoneCode(event)" maxlength="4"> 
-
<input id="_m_phone3" type="text" class="form-control" style="ime-mode:disabled; display: inline; width: 100px;" onkeydown="return phoneCode(event)" maxlength="4"> 
<a id="_check_phone1" onclick="check_phone()" class="btn btn-success">휴대전화 중복확인</a>
<a id="_check_phone2" onclick="modify_phone()" class="btn btn-success">확인</a>
<a onclick="phone_cancel()" class="btn btn-success">취소</a>
<!-- <button id="_check_phone1" onclick="check_phone()">휴대전화 중복확인</button>
<button id="_check_phone2" onclick="modify_phone()">확인</button>
<button onclick="phone_cancel()">취소</button> -->
</div>
<h4>
<hr>
성별
<hr>
<table id="_gender" style="margin: auto;">
<col width="150px;"><col width="150px;">
<tr>
<td align="left">
	<c:if test="${login.m_gender eq 0}" >
		남자
	</c:if>
	<c:if test="${login.m_gender eq 1}">
		여자
	</c:if>
</td>

<td align="right"><a onclick="modify_gender1()" class="btn btn-success">수정</a></td>

</tr>

</table>

<div id="_m_gender">
<input type="radio" id="m_gender1" name="m_gender_" value="0" checked="checked">남자
<input type="radio" id="m_gender2" name="m_gender_" value="1">여자
<a onclick="modify_gender()" class="btn btn-success">확인</a>
<a onclick="gender_cancel()" class="btn btn-success">취소</a>
<!-- <button onclick="modify_gender()">확인</button>
<button onclick="gender_cancel()">취소</button> -->
</div>
</h4>
<hr>



<script type="text/javascript">
$("#_m_phone").hide();
$("#_m_nickname").hide();
$("#_m_gender").hide();
$("#_file").hide();
$("#_check_phone2").hide();

$("#ch_pwd").hide();
$("#_pwd_ok").hide();
$("#new_pwd").hide();
$("#_pwd_cancel").hide();





var id = $("#_id").val();

function modify_pwd1(){
	$("#ch_pwd").show();
	$("#_modify_pwd").hide();
}

function modify_phone1(){
	$("#_m_phone1 option").not(":selected").attr("disabled", "");
	$("#_m_phone2").attr("readonly", false);
	$("#_m_phone3").attr("readonly", false);
	$("#_phone").hide();
	$("#_m_phone").show();
}
function modify_nickname1(){
	$("#_nickname").hide();
	$("#_m_nickname").show();
}

function modify_gender1(){
	$("#_gender").hide();
	$("#_m_gender").show();
}

function phone_cancel() {
	$("#_m_phone").hide();
	$("#_phone").show();
	
}
function nick_cancel() {
	$("#_m_nickname").hide();
	$("#_nickname").show();
}
function gender_cancel() {
	$("#_m_gender").hide();
	$("#_gender").show();
}
function pwd_cancel() {
	$("#_modify_pwd").show();
	$("#ch_pwd").hide();
	$("#new_pwd").hide();
	$("#_pwd_cancel").hide();
	$("#_pwd_ok").hide();
	$("#_checkPwd").html("");
	$("#new_pwd1").val("");
	$("#new_pwd2").val("");
	
}


function modify_nickname(){
	var nick = $("#m_nickname").val();
	
	$.ajax({
	type:"POST",
	url:"./change_m_nickname.do",
	data:{"m_id":id,"m_nickname":nick},
	success:function(msg){
		$("#_nickname").html(msg.m_nickname + '<a onclick="modify_nickname1()" class="btn btn-success">수정</a>');
		$("#_nickname").show();
		$("#_m_nickname").hide();
	},
	error:function(request,error){
		alert("변경 실패.");
	}
})
}

function check_phone(){
	
	var phone = $("#_m_phone1").val()+$("#_m_phone2").val()+$("#_m_phone3").val();

	$.ajax({
	type:"POST",
	url:"./m_phoneAf.do",
	data:"m_phone="+phone,
	
	success:function(msg){
		output(msg);
	},
	error:function(request,error){
		alert("폰번호 체크 실패.");
	}
})
}
function output(msg) {
	
	if(msg.message=='Sucs'){
		alert("사용할 수 없는 핸드폰 번호 입니다.");
	}else{
		alert("사용할 수 있는 핸드폰 번호 입니다.");
		$("#_m_phone1 option").not(":selected").attr("disabled", "disabled");
		$("#_m_phone2").attr("readonly", true);
		$("#_m_phone3").attr("readonly", true);
		$("#_check_phone1").hide();
		$("#_check_phone2").show();
	}
}
function modify_phone(){
	
	var phone = $("#_m_phone1").val()+$("#_m_phone2").val()+$("#_m_phone3").val();
	
	$.ajax({
	type:"POST",
	url:"./change_m_phone.do",
	data:{"m_id":id,"m_phone":phone},
	
	success:function(msg){
		$("#_phone").html(msg.m_phone + '<a onclick="modify_phone1()" class="btn btn-success">수정</a>');
		$("#_phone").show();
		$("#_m_phone").hide();
		$("#_check_phone1").show();
		$("#_check_phone2").hide();
		alert("폰번호 변경 성공!.");	
	},
	error:function(request,error){
		alert("폰번호 변경 실패!.");
	}
})
}
function check_pwd(){
	var pwd = $("#_pwd").val();
	
	$.ajax({
	type:"POST",
	url:"./check_m_pwd.do",
	data:{"m_id":id,"m_password":pwd},
	
	success:function(msg){
		output_pwd(msg);
	},
	error:function(request,error){
		alert("폰번호 변경 실패!.");
	}
})
}

function output_pwd(msg) {
	if(msg.message=='Sucs'){
		alert("올바른 패스워드입니다.");
		$("#_modify_pwd").hide();
		$("#ch_pwd").hide();
		$("#new_pwd").show();
		$("#_pwd_cancel").show();
		
	}else{
		alert("패스워드가 틀렸습니다.");
	}
}

function che_pwd(){
	var check_pwd1 = $("#new_pwd1").val();
	var check_pwd2 = $("#new_pwd2").val();
	
	if(check_pwd1!=""){
		if(check_pwd1 != check_pwd2){
			$("#_checkPwd").html("비밀번호가 틀립니다.");
		}else{
			$("#_pwd_ok").show();
			$("#_checkPwd").html("동일한 패스워드입니다.");
			
		}
	}
}

function modify_pwd(){
	var pwd1 = $("#new_pwd1").val();

	$.ajax({
	type:"POST",
	url:"./change_m_pwd.do",
	data:{"m_id":id,"m_password":pwd1},
	
	success:function(msg){
		
		alert("패스워드 변경 성공")
		$("#_modify_pwd").show();
		$("#ch_pwd").hide();
		$("#_pwd_ok").hide();
		$("#new_pwd").hide();
		$("#_pwd_cancel").hide();
		$("#_checkPwd").html("");
		
	},
	error:function(request,error){
		alert("패스워드 변경 실패!");
	}
})
}


function modify_gender(){
	var gender = $(":input:radio[name='m_gender_']:checked").val();
	
	$.ajax({
	type:"POST",
	url:"./change_m_gender.do",
	data:{"m_id":id,"m_gender":gender},
	success:function(msg){
		var ged = "";
		switch (msg.m_gender) {
	      case 0    : ged = "남자";
	                   break;
	      case 1   : ged = "여자"
	                   break;
	    }
		
		$("#_gender").html(ged + '<a onclick="modify_gender1()" class="btn btn-success">수정</a>');
		$("#_gender").show();
		$("#_m_gender").hide();
		
	},
	error:function(request,error){
		alert("성별 변경 실패.");
	}
})
}

function modify_marriage2(){
	var id = $("#_id").val();
	var marriage = $(":input:radio[name='m_marriage']:checked").val();
	 $.ajax({
	type:"POST",
	url:"./change_m_marriage.do",
	data:{"m_id":id,"m_marriage":marriage},
	success:function(msg){
		var mar = "";
		switch (msg.m_marriage) {
	      case 0    : mar = "싱글";
	                   break;
	      case 1   : mar = "연애중"
	                   break;
	      case 2  : mar = "결혼"
	                   break;
	    }
		$("#_basics_marriage").html(mar);
		$("#_radio").hide();
		$("#_add_marriage").show();
	},
	error:function(request,error){
		alert("message.:"+request.responseText);
	}

}) 
}

function nameCode(event) {
	event = event || window.event;
	
	var keyID = (event.which) ? event.which : event.keyCode;
	
	if(( keyID >=33 && keyID <= 47 )||( keyID >=123 && keyID <= 126 )||( keyID >=91 && keyID <= 96 )||( keyID >=58 && keyID <= 64 )||( keyID >=65 && keyID <= 90 )||( keyID >=97 && keyID <= 122 )||(keyID==32))
		
	{return false;}
	else
	{return;}
}


</script>


</body>
</html>