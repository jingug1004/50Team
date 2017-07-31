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
<script type="text/javascript">

function modify_content2(){
	var id = $("#_id").val();
	var content = $("#_basics_content").val();
	$.ajax({
	type:"POST",
	url:"./change_m_content.do",
	data:{"m_id":id,"m_content":content},
	success:function(msg){
		$("#_basics_content").html(msg.m_content);
		$("#_basics_content").attr("readonly", true);
		$("#_basics_content").show
		$('#_modify_content').show();
		$("#_add_content").hide();
		$("#_modify_btn").hide();
	},
	error:function(request,error){
		alert("message.:"+request.responseText);
	}
})
}
</script>
</head>
<body>
<br><br>
	<h4>
	<input type="hidden" id="_id" value="${login.m_id }">
	자기소개
	<hr>
	<div id="_add_content">
		<button type="button" class="btn btn-success" onclick="modify_content()">자기소개 추가</button>
	</div>

	<textarea class="form-control" id="_basics_content" name="m_content" cols="120" rows="6" readonly="readonly">${login.m_content}</textarea>
	<button type="button" id="_modify_content" class="btn btn-success" onclick="modify_content()">자기소개 수정</button>

	<div id="_modify_btn">
		<button type="button" class="btn btn-success" onclick="modify_content2()">완료</button>
		<button type="button" class="btn btn-success" onclick="content_cancel()">취소</button>
	</div>
	</h4>
<script type="text/javascript">
var cont = "${login.m_content}";
$('#_modify_btn').hide();
if(cont==""){
	$('#_basics_content').hide();
	$('#_add_content').show();
	$('#_modify_content').hide();
}else if(cont!=""){
	$('#_basics_content').show();
	$('#_modify_content').show();
	$('#_add_content').hide();
}
function modify_content() {
	$("#_add_content").hide();
	$('#_modify_content').hide();
	$("#_basics_content").show();
	$("#_modify_btn").show();
	$("#_basics_content").attr("readonly", false);
}
function content_cancel() {
	if(cont==""){
		$('#_basics_content').hide();
		$("#_add_content").show();
		$("#_modify_btn").hide();
	}else{
		$("#_basics_content").val(cont);
		$('#_modify_content').show();
		$("#_modify_btn").hide();
	}
	$("#_basics_content").attr("readonly", true);
}
</script>


</body>
</html>