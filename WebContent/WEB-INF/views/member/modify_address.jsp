<%@page import="sist.co.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>	<!-- 도로명주소 다음 -->
<html>
<head>
<script type="text/javascript">



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
 
	function addCode(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if(( keyID >=33 && keyID <= 47 )||( keyID >=123 && keyID <= 126 )||( keyID >=91 && keyID <= 96 )||( keyID >=58 && keyID <= 64 )||( keyID >=65 && keyID <= 90 )||( keyID >=97 && keyID <= 122 )||(keyID==32))
		{return false;}
		else
		{return;}
	}
 </script>

</head>
<body>
	<br><br>
	<h4>
	<div id="db_address">
	${login.m_address} <a onclick="modify_()" class="btn btn-success">수정</a> <!-- <button type="button" onclick="modify_()">수정</button> -->
	</div>
	
	<div id = "_address">
	<form>
	<table>
	
	<col width="100px;"><col width="300px;"><col width="185px;"><col width="100px;">
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
	<col width="100px;"><col width="300px;"><col width="300px;">
	<tr>
	<%
	MemberDTO str = (MemberDTO)session.getAttribute("login"); 
	String add1[] = str.getM_address().split("-");
	%>
		<td></td>
		<td>
			<input type="text" class="form-control" id="sample6_address" readonly="readonly" placeholder="주소" name="m_address1" size="50" value="<%=add1[0]%>">
		</td>
		<td>
			<input type="text" class="form-control" id="sample6_address2" readonly="readonly" placeholder="상세주소" name="m_address2" size="50" value="<%=add1[1]%>" onkeypress="return addCode(event)" maxlength="30" >
			<input id="_m_address" type="hidden" name = "m_address">
		</td>
	</tr>
	<tr>
		<td colspan="3" align="right">
			<button class="btn btn-success" onclick="modify_add()">확인</button>
			<button class="btn btn-success" onclick="add_cancel()">취소</button>
		</td>
	</tr>
	</table>
	<input type="hidden" value="${login.m_id }" id ="_id">
	</form>
	</div>
	</h4>

<script type="text/javascript">
$("#_address").hide();

function modify_() {
	$("#_address").show();
	$("#db_address").hide();
}
function add_cancel() {
	$("#_address").hide();
	$("#db_address").show();
}

function modify_add(){
	var add1 = $("#sample6_address").val();
	var add2 = $("#sample6_address2").val();
	
	var address = add1+"-"+add2;
	
	$("#_m_address").attr("value", address);
	
	var id = $("#_id").val();
	var address = $("#_m_address").val();
	
	$.ajax({
	type:"POST",
	url:"./change_m_address.do",
	data:{"m_id":id,"m_address":address},
	success:function(msg){
		$("#db_address").html(msg.m_address);
		$("#sample6_address").attr("readonly", true);
		$("#sample6_address2").attr("readonly", true);
		
		$("#_address").hide();
		$("#db_address").show();
	},
	error:function(request,error){
		alert("message.:"+request.responseText);
	}
})
}

</script>

</body>
</html>