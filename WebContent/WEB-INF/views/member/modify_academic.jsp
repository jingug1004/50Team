<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:requestEncoding value="utf-8"/>    

<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js" ></script>
<script type="text/javascript">



function change_m_mypage1(){

	var id = $("#_id").val();
	
	var office = $("#_office").val();
	
	$.ajax({
	type:"POST",
	url:"./change_m_mypage1.do",
	data:{"m_id":id,"m_office":office},
	success:function(msg){
			$("#_basics_office").html(office);
			$('#_modify_office').show();
			$('#_office').hide();
			$('#_add_office2').hide();
			$('#_basics_office').show();
	},
	error:function(request,error){
		alret("공백 문자열은 불가능 합니다.");
		/* alert("message.:"+request.responseText); */
	}
})  
}
function change_m_mypage2(){

	var id = $("#_id").val();

	var highschool = $("#_highschool").val();
	
	$.ajax({
	type:"POST",
	url:"./change_m_mypage2.do",
	data:{"m_id":id,"m_highschool":highschool},
	success:function(msg){
			$("#_basics_highschool").html(highschool);
			$('#_modify_highschool').show();
			$('#_highschool').hide();
			$('#_add_highschool2').hide();
			$('#_basics_highschool').show();		
	},
	error:function(request,error){
		alret("공백 문자열은 불가능 합니다.");
		/* alert("message.:"+request.responseText); */
	}
})  
}
function change_m_mypage3(){

	var id = $("#_id").val();
	var university = $("#_university").val();
	
	$.ajax({
	type:"POST",
	url:"./change_m_mypage3.do",
	data:{"m_id":id,"m_university":university},
	success:function(msg){
			$("#_basics_university").html(university);
			$('#_modify_university').show();
			$('#_university').hide();
			$('#_add_university2').hide();
			$('#_basics_university').show();
	},
	error:function(request,error){
		alert("message.:"+request.responseText);
	}
})  
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

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<br><br>
	<h4>
	직장
	<hr>
	<input type="hidden" id="_id" value="${login.m_id }">
	<div id="test2">
	<c:if test="${login.m_office eq null}">
		<a id="_add_office" value="modify_office" class="btn btn-success">직장 추가</a>
	</c:if>
	<input type="text" id="_office" value="" onkeypress="return academicCode(event)" maxlength="30">
	<a onclick="change_m_mypage1()" id="_add_office2" class="btn btn-success">확인</a>
	<div id="_basics_office">${login.m_office}</div>
	<a value="modify_office" id="_modify_office" class="btn btn-success">수정</a>
	</div>
	<hr>
	고등학교
	<hr>
	<div id="test3">
	<c:if test="${login.m_highschool eq null}">
		<a id="_add_highschool" value="modify_highschool" class="btn btn-success">고등학교 추가</a>
		<!-- <button id="_add_highschool" value="modify_highschool">고등학교 추가</button> -->
	</c:if>
	<input type="text" id="_highschool" value="" onkeypress="return academicCode(event)" maxlength="30">
	<a onclick="change_m_mypage2()" id="_add_highschool2" class="btn btn-success">확인</a>
	<!-- <button onclick="change_m_mypage2()" id="_add_highschool2">확인</button> -->
	<div id="_basics_highschool">${login.m_highschool}</div>
	<a value="modify_highschool" id="_modify_highschool" class="btn btn-success">수정</a>
	<!-- <button value="modify_highschool" id="_modify_highschool">수정</button> -->

	</div>
	<hr>
	대학교
	<hr>
	
	<div id="test4">
	<c:if test="${login.m_university eq null}">
		<a id="_add_university" value="modify_university" class="btn btn-success">대학교 추가</a>
	</c:if>
		<input type="text" id="_university" value="" onkeypress="return academicCode(event)" maxlength="30">
		<a onclick="change_m_mypage3()" id="_add_university2" class="btn btn-success">확인</a>
	<div id="_basics_university">${login.m_university}</div>
		<a value="modify_university" id="_modify_university" class="btn btn-success">수정</a>
	</div>
	<hr>
	</h4>

<script type="text/javascript">

var high2 = "${login.m_highschool}";
var uni2 = "${login.m_university}";
var of2 = "${login.m_office}";

if(high2==""){
	$('#_modify_highschool').hide();
}
if(uni2==""){
	$('#_modify_university').hide();
}
if(of2==""){
	$('#_modify_office').hide();
}

$('#_office').hide();
$('#_add_office2').hide();

$('#_highschool').hide();
$('#_add_highschool2').hide();

$('#_university').hide();
$('#_add_university2').hide();

$(function(){
	$("a").click(function(){
	var btn = $(this).attr("value");
	
	if(btn=="modify_office"){
/* 			
		$("#_highschool").val("");
		$("#_university").val("");
		 */
		$('#_office').show();
		$('#_add_office').hide();
		$('#_add_office2').show();
		$('#_basics_office').hide();
		$('#_modify_office').hide();
      
	}else if(btn=="modify_highschool"){
/* 		
		$("#_office").val("");
		$("#_university").val("");
 */
		$('#_highschool').show();
		$('#_add_highschool').hide();
		$('#_add_highschool2').show();
		$('#_basics_highschool').hide();
		$('#_modify_highschool').hide();
    	  	
	}else if(btn=="modify_university"){
/* 		
		$("#_office").val("");
		$("#_highschool").val("");
		 */
		$('#_university').show();
		$('#_add_university').hide();
		$('#_add_university2').show();
		$('#_basics_university').hide();
		$('#_modify_university').hide();
	}
     
	});
});

</script>




	
</body>
</html>