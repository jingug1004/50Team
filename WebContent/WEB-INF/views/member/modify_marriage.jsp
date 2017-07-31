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

</script>


</head>
<body>
	<br><br>
	<h4>
	<input type="hidden" id="_id" value="${login.m_id }">
	결혼/연애 상태
	<hr>
	<div>
		<div id="_basics_marriage">
		<c:if test="${login.m_marriage eq 0}">
			싱글
		</c:if>
		<c:if test="${login.m_marriage eq 1}">
			연애중
		</c:if>
		<c:if test="${login.m_marriage eq 2}">
			결혼
		</c:if>
		
		</div>
	</div>
	<a id="_add_marriage" onclick="modify_marriage()" class="btn btn-success">결혼/연애 상태 수정</a>

	<div id="_radio">
	<input type="radio" id="m_marriage1" name="m_marriage" value="0" checked="checked">싱글
	<input type="radio" id="m_marriage2" name="m_marriage" value="1">연애중
	<input type="radio" id="m_marriage3" name="m_marriage" value="2">결혼
	<a onclick="modify_marriage2()" id="_modify_btn" class="btn btn-success">완료</a>
	</div>
	</h4>

<script type="text/javascript">
$("#_radio").hide();
/* $("#_modify_btn").hide(); */

function modify_marriage() {
	$("#_add_marriage").hide();
	$("#_radio").show();

}




</script>


</body>
</html>