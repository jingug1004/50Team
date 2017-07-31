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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>	<!-- 도로명주소 다음 -->
<title>Insert title here</title>
<style type="text/css">
#middle_wrap tr{
	height: 70px;
}
#middle_wrap table {
	margin-left: 25%;
	/* margin-right: 15%; */
}
</style>
<script>
var a_number = "";
var count_ = 0;				//인증 횟수용
var checkemail_ = 0;		//이메일인증 눌렀는지 체크
var check_aa_number_ = 0;	//인증번호 성공했는지 확인.
var checkpwd_= 0;			//패스워드 입력했나 확인.
var checkadd_= 0;			//우편번호 찾기 했는지 확인.
var checkphone_= 0;			//폰 번호 중복찾기 했는지 확인.
var id_count = 0;			//아이디 카운트

    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                
                $("#sample6_address2").attr("readonly", false);
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }

   function LastDay() {
    	var Year = $("#birth_year").val();		
    	var Month = $("#birth_month").val();		
    	var date = new Date(Year, Month, 0);
    	var lastDay = date.getDate();				
    	var htmlTag = "";
    	
    	for ( var i = 1; i < lastDay+1; i++ ) {
    		htmlTag += "<option label='" + i + "' value='" + i + "'/>";
    	}
    	
    	$("#birth_day").html(htmlTag);
    	$("#birth_day option:eq(0)").attr("selected", "selected");
    }
   
	function change_email() {
		var mail = $("#_mail").val();
		
		if(mail != "직접입력"){
			$("#_id2").val(mail);
			$("#_id2").attr("readonly", true);

		
		}else{
			$("#_id2").val("");
			$("#_id2").attr("readonly", false);
		}		
	}
	function aa_number() {
		
		var a_usernumber = $("#_a_number").val();
		if(a_number!=a_usernumber){
			count_ = count_+1;	
			check_aa_number_ = 0;
			$("#aa_number_check").html("인증 " + count_ + "회 실패");

			if(count_ == 5){
				alert("로그인창으로 이동됩니다.");
				location.href="login.do";
			}
			
		}else if(a_usernumber != "" && a_number == a_usernumber){
			$("#aa_number_check").html("인증성공!");
			check_aa_number_ = 1;
		}
	} 
   
	function check_id() {
		
		var id1 = $("#_id1").val();
		var id2 = $("#_id2").val();
		if(id1==""){
			alert("아이디를 입력해 주세요.");
		}else if(id2==""){
			alert("이메일을 입력해 주세요.");
		}else{
			var id = id1+"@"+id2;
			check_member2(id);
		}
	}
	
	function check_member2(a){
		 $.ajax({
		type:"POST",
		url:"./check_member.do",
		data:"m_id="+a,
		
		success:function(msg){
			output(msg);
		},
		error:function(request,error){
			alert("message.:"+request.responseText);
		}

	}) 
	}	
	function output(msg) {
		
		if(id_count == 1){
			if(msg.message=='Sucs'){
				$("#check_member").html("사용할 수 없는 아이디 입니다.");
				checkemail_ = 0;
			}else{
				$("#check_member").html("사용할 수 있는 아이디 입니다.");
				$("#_id1").attr("readonly", true);
				$("#_id2").attr("readonly", true);
				
				checkemail_ = 1;
				a_number = msg.message;
				
				alert("이메일 확인 후 승인번호를 입력하세요");
			}
		}else{
			alert("아이디를 6자리 이상 입력해주세요.");	
		}
	}
	function check_phone() {

		var phone1 = $("#_m_phone1").val();
		var phone2 = $("#_m_phone2").val();
		var phone3 = $("#_m_phone3").val();
		if(phone1=="" || phone2=="" || phone3==""){
			alert("번호를 입력하세요");
		}else{
			var phone = phone1+phone2+phone3;
			check_phone2(phone);
		}
	}
	function check_phone2(a){
		$.ajax({
		type:"POST",
		url:"m_phoneAf.do",
		data:"m_phone="+a,
		
		success:function(msg){
			outputphone(msg);
		},
		error:function(request,error){
			alert("폰번호 체크 실패.");
		}
	})
	}
	function outputphone(msg) {
		if(msg.message=='Sucs'){
			alert("사용할 수 없는 핸드폰 번호 입니다.");
		}else{
			alert("사용할 수 있는 핸드폰 번호 입니다.");
			$("#_m_phone1 option").not(":selected").attr("disabled", "disabled");
			$("#_m_phone2").attr("readonly", true);
			$("#_m_phone3").attr("readonly", true);
			$("#_check_phone1").hide();
			checkphone_ = 1;

		}
	}

	
	function add_member_cancel() {
		location.href="login.do";
	}
	
	function add_member() {
		// 생일 및 폰 번호 설정부분
		var birthmonth = $("#birth_month").val();
		var birthday = $("#birth_day").val();

		if(birthmonth.length < 2 ){
			birthmonth = "0"+birthmonth;
		}
		if(birthday.length < 2 ){
			birthday = "0"+birthday;
		}
		
		var m_phone = $("#_m_phone1").val() +  $("#_m_phone2").val() + $("#_m_phone3").val();
		var m_birthday = $("#birth_year").val() + birthmonth + birthday;
		
		$("#_m_phone").attr("value", m_phone);
		$("#_m_birthday").attr("value", m_birthday);
		
		// 여기까지 폰 및 생일 
		// 아이디
		var id1 = $("#_id1").val();
		var id2 = $("#_id2").val();
		
		var id = id1+"@"+id2;
		
		$("#_m_id").attr("value", id);
		// 아이디
		
		//주소
		
		var add1 = $("#sample6_address").val();
		var add2 = $("#sample6_address2").val();
		
		if(add2 != ""){
			checkadd_ = 1;
		}

		var address = add1+"-"+add2;
		
		if(checkemail_ == 0){
			alert("이메일 인증을 해 주십시오.");
			$("#_id1").focus();
		}else if(check_aa_number_ == 0){
			alert("인증번호를 확인하여 주십시오.");
			$("#_a_number").focus();
		}else if(checkpwd_ == 0){
			alert("올바른 패스워드를 입력해 주십시오.");
			$("#_pwd1").focus();
		}else if(checkadd_ == 0){
			alert("올바른 주소를 입력해 주십시오.");
			$("#sample6_postcode").focus();
		}else if(checkphone_ == 0){
			alert("휴대폰 번호 중복체크를 해 주십시오.");
			$("#_m_phone2").focus();
		}else{
			alert("회원가입 완료");
			$("#_m_address").attr("value", address);
			$("#_addmember").attr({"target":"_self", "action":"regiAf.do"}).submit();
		}
	}
	
	function checkpwd(){
		
		var check_pwd1 = $("#_pwd1").val();
		var check_pwd2 = $("#_pwd2").val();
		
		if(check_pwd1.length < 8){
			$("#_checkPwd").html("8자리 이상 입력해주세요.");
		}else{
			if(check_pwd1!=""){
				if(check_pwd1 != check_pwd2){
					$("#_checkPwd").html("비밀번호가 틀립니다.");
					checkpwd_ = 0;
				}else{
					$("#_checkPwd").html("동일한 패스워드입니다.");
					checkpwd_ = 1;
				}	
			}
		}
	}
	function checkid(){
		var check_id1 = $("#_id1").val();
		if(check_id1.length < 6){
			$("#check_member").html("6자리 이상 입력해주세요.");
		}else{
			$("#check_member").html("좋은 아이디 입니다. 중복체크를 해주세요.");
			id_count = 1;
		}
	}
	
	function phoneCode(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if((keyID==8) || (keyID==9) || ( keyID >=48 && keyID <= 57 ) || ( keyID >=96 && keyID <= 105 ))
		{return;}
		else
		{return false; }
	}
	function idCode(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if( (keyID==46) || (keyID==8) || (keyID==9) || ( keyID >=48 && keyID <= 57 ) || ( keyID >=65 && keyID <= 90 ) || ( keyID >=97 && keyID <= 122 ) )
		{return;}
		else
		{return false;}
	}
	function pwdCode(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if( (keyID==32) )
		{return false;}
		else
		{return;}
	}
	function nameCode(event) {
		event = event || window.event;
		
		var keyID = (event.which) ? event.which : event.keyCode;
		
		if(( keyID >=33 && keyID <= 47 )||( keyID >=123 && keyID <= 126 )||( keyID >=91 && keyID <= 96 )||( keyID >=58 && keyID <= 64 )||( keyID >=65 && keyID <= 90 )||( keyID >=97 && keyID <= 122 )||(keyID==32))
			
		{return false;}
		else
		{return;}
	}
	function addCode(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if(( keyID >=33 && keyID <= 47 )||( keyID >=123 && keyID <= 126 )||( keyID >=91 && keyID <= 96 )||( keyID >=58 && keyID <= 64 )||( keyID >=65 && keyID <= 90 )||( keyID >=97 && keyID <= 122 )||(keyID==32))
		{return false;}
		else
		{return;}
	}
	function academicCode(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if(( keyID >=33 && keyID <= 47 )||( keyID >=123 && keyID <= 126 )||( keyID >=91 && keyID <= 96 )||( keyID >=58 && keyID <= 64 )||(keyID==32))
		{return false;}
		else
		{return;}
	}

</script>
</head>
<body>
<div style="background-image: ./image/member/2.jpg">
<h4 style="margin-right: 40%;">(*)는 필수항목입니다.</h4>
<hr/>
<form class="form-horizontal" name="addmember" id="_addmember">
  <fieldset>
    
    <table>
    <col width="100px;"><col width="300px;"><col width="50px;">
    <col width="300px;"><col width="150px;"><col width="150px;"><col width="150px;">
	<tr>
		<td>
			*아이디
		</td>
		<td>
			<input class="form-control" id="_id1" type="text" name="m_id1" size="30" onkeyup="checkid()" placeholder="Email" onkeypress="return idCode(event)" maxlength="12">
			<input type="hidden" id="_m_id" name="m_id">
		</td>
		<td>
			@
		</td>
		<td>
			<input class="form-control" id="_id2" type="text" name="m_id2" size="30"  onkeypress="return idCode(event)" maxlength="12">
		</td>
		<td>
			<select class="form-control" onchange="change_email()" id="_mail">
				<option>직접입력</option>
     			<option value="hanmail.net">hanmail.net</option>
     			<option value="naver.com">naver.com</option>
     			<option value="gmail.com">gmail.com</option>
     		</select>
		</td>
		
		<td>
			<button type="button" class="btn btn-success" onclick="check_id()">*아이디 중복체크</button>		
		</td>
		<td>
			<div id="check_member"></div>
		</td>
	</tr> 
	<tr>
		<td></td>
		<td >
			<input onkeypress="return phoneCode(event)" maxlength="8" class="form-control" id="_a_number" type="text" name="ab_number" size="30" placeholder="승인번호 입력">
		</td>
		<td></td>
		<td style="text-align: left;">
			<button type="button" class="btn btn-success"  onclick="aa_number()">*인증확인</button>
		</td>
		<td colspan="2">
			<div id="aa_number_check"></div>
		</td>
	</tr>
	
	<tr>
		<td>
			*비밀번호
		</td>	
		<td>
		<input class="form-control" id="_pwd1" name="m_password" type="password" placeholder="Password" onkeyup="checkpwd()" onkeypress="return pwdCode(event)" maxlength="12">
		</td>
		<td>
			*확인
		</td>	
		<td>
		<input class="form-control" id="_pwd2" type="password" placeholder="비밀번호 재입력" onkeyup="checkpwd()" onkeypress="return pwdCode(event)" maxlength="12">
		</td>
		<td colspan="2">
			<div id="_checkPwd"></div>
		</td>
	</tr>
	</table>
	
	
	<hr>
	
	<table >
	<col width="100px;"><col width="300px;"><col width="100px;">
	<tr>

		<td>
			*이름
		</td>
		<td>
			<input class="form-control" id="_name" name="m_name" type="text" style="ime-mode:active" placeholder="이름" onkeypress="return nameCode(event)" maxlength="10">
		</td>
		<td style="margin-left: 200px;">
			<input type="radio" name="m_gender" value="0" checked="checked">남자
			<input type="radio" name="m_gender" value="1">여자
		</td>
		

	</tr>
	
	</table>

	<table>
	<col width="100px;"><col width="auto"><col width="100px;"><col width="auto">
	<!-- 주소  API 넣기 -->
	<tr>
		<td>*주소</td>
		<td>
			<input type="text" class="form-control" readonly="readonly" id="sample6_postcode" size="50" placeholder="우편번호" >
		</td>
		<td></td>
		<td>
			<input type="button" class="btn btn-success" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		</td>
	</tr>
	
	</table>

	<table>
	<col width="100px;">
	<tr>
		<td></td>
		<td>
			<input type="text" class="form-control" id="sample6_address" readonly="readonly" placeholder="주소" name="m_address1" size="50">
		</td>
		<td>
			<input type="text" class="form-control" id="sample6_address2" readonly="readonly" placeholder="상세주소" name="m_address2" size="50" onkeypress="return addCode(event)" maxlength="30">
			<input id="_m_address" type="hidden" name = "m_address">
		</td>
	</tr>
	
	</table>
	<table>
	<col width="100px;"><col width="100px;"><col width="25px;">
	<col width="100px;"><col width="25px;"><col width="100px;">
	<col width="25px;"><col width="100px;"><col width="100px;"><col width="100px;">
	<col width="100px;">
	<tr>
		<td>
			*생년월일
		</td>
		<td>
			<% Calendar cal = Calendar.getInstance(); %>
				<c:set var="year" value="<%= cal.get(Calendar.YEAR) %>"/>
				<select id="birth_year" name="m_birthday_year" class="form-control">
					<c:forEach var="i" begin="0" end="${ year - 1950 - 14 }">
						<option label="${ (year-14) - i }" value="${ (year-14) - i }"/>
					</c:forEach>
				</select>
		</td>
		<td>년</td>
		<td>
			<select onchange="LastDay()" id="birth_month" name="m_birthday_month" class="form-control">
				<c:forEach var="i" begin="1" end="12">
					<option label="${ i }" value="${ i }"/>
				</c:forEach>
			</select>
		</td>
		<td>월</td>
		<td>	
			<select id="birth_day" class="form-control" name="m_birthday_day"> 
			</select>
			<script type="text/javascript">
			LastDay();
			</script>
		</td>
		<td>일</td>
		<td style="text-align: right;">결혼유무</td>
		
		<td>
			<input type="radio" name="m_marriage" value="0" checked="checked">싱글
		</td>
		<td>
			<input type="radio" name="m_marriage" value="1">연애중
		</td>
		<td>
			<input type="radio" name="m_marriage" value="2">결혼	
		</td>
	</tr>
	</table>
	<table>
	<col width="100px;"><col width="100px;"><col width="40px;"><col width="100px;"><col width="40px;"><col width="100px;">
	<tr>
		<td>*휴대전화번호</td>
		<td >
			<select class="form-control" id="_m_phone1">
				<option>010</option>
     				<option>011</option>
     				<option>016</option>
     				<option>018</option>
     			</select>
		</td>
		<td>
			-
		</td>
		<td>
			<input class="form-control" id="_m_phone2" type="text" placeholder="1234" style="ime-mode:disabled;" onkeydown="return phoneCode(event)" maxlength="4"> 
		</td>
		<td>
			-
		</td>
		<td>
			<input class="form-control" id="_m_phone3" type="text" placeholder="5678" style="ime-mode:disabled;" onkeydown="return phoneCode(event)" maxlength="4"> 
		</td>
		<td><button type="button" id="_check_phone1" onclick="check_phone()" class="btn btn-success">휴대전화 중복확인</button>
	</tr>
	</table>
	<table>
	<col width="100px;"><col width="auto"><col width="100px;"><col width="auto"><col width="100px;"><col width="auto">
	<tr>
		<td>고등학교 </td>
		<td><input class="form-control" name="m_highschool" type="text" placeholder="고등학교" onkeypress="return academicCode(event)" maxlength="30"></td>
		<td>대학교 </td>
		<td><input class="form-control" name="m_university" type="text" placeholder="대학교" onkeypress="return academicCode(event)" maxlength="30"></td>
		<td>직장</td>
		<td> <input class="form-control" name="m_office" type="text" placeholder="직장" onkeypress="return academicCode(event)" maxlength="30"></td>
		
	</tr>
	
	</table>
	<table>
	<col width="100px;">
	<tr>
		<td>
			자기소개
		</td>
		<td>
			<textarea class="form-control" id="textArea" name="m_content" cols="120" rows="6" ></textarea>
		</td>
	</tr>
	
	</table>
	<table style="margin: auto;">
	
	<tr>
		<td>
		<input type="hidden" id="_m_phone" name = "m_phone" value="">
		<input type="hidden" id="_m_birthday" name = "m_birthday" value="">
		
		<button type="button" class="btn btn-success" onclick="add_member()">가입완료</button>
		</td>
		<td><button type="button" class="btn btn-success" onclick="add_member_cancel()">취소</button></td>
	</tr>
	</table>
  </fieldset>
</form>
</div>
</body>
</html>