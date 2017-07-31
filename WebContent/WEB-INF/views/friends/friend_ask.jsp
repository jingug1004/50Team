<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="utf-8"/>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<!-- <link rel="stylesheet" href="css/ay.css"> -->	<!-- tiles를 사용하면, layouts-tiles.jsp기준으로 경로 설정하면 됌 -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
function refuse(val){
	
	$.ajax({
		type:"POST",
		url:"refuse.do",
		data:{"m_id":'${login_id}', "f_id":val},
		success: function(response){
			$("#ac_"+response).attr("style", "visibility:hidden");
			$("#rf_"+response).attr({"value":"거절완료", "disabled":true});
		},error : function(request, status, error){
			alert("error  code:"+request.status+"\n"+"error:"+error);
		}
		
	});
	
}
function acceptone(val){
	
	$.ajax({
		type:"POST",
		url:"accept.do",
		data:{"m_id":'${login_id}', "f_id":val},
		success: function(response){
			$("#rf_"+response).attr("style", "visibility:hidden");
			$("#ac_"+response).attr({"value":"수락완료", "disabled":true});
		},error : function(request, status, error){
			alert("error  code:"+request.status+"\n"+"error:"+error);
		}
		
	});
	
}
function cancle(val){
	
	$.ajax({
		type:"POST",
		url:"cancle.do",
		data:{"m_id":'${login_id}', "f_id":val},
		success: function(response){
			$("#cc_"+response).attr({"value":"취소완료", "disabled":true});
		},error: function(request, status, error){
			alert("error code:" + request.status + "\n" + "error : " + error);
		}
		
	});
	
}

</script>

<!-- 프로필사진 경로 : C:\springstudy\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\SpringSample\upload -->

<h1>친구요청</h1>
<form>
<table class="table table-striped table-hover ">
	<colgroup>
		<col width="150px"><col width="200px"><col width="200px">
	</colgroup>
	<tr>
		<td colspan="3">수신된 친구 요청 보기</td><!-- 친구 요청에 답하기  -->
	</tr>
	<c:if test="${fn:length(ansflistinform) eq 0}">
		<tr><td colspan="3" style="text-align: center;">새로운 친구 요청이 없습니다</td></tr>	
	</c:if> 
	<c:forEach items="${ansflistinform }" var="ansf" varStatus="ansfS">
		<c:if test="${ansfS.count%2 eq 0}">
			<tr class="info">
		</c:if>
		<c:if test="${ansfS.count%2 eq 1}">
			<tr>
		</c:if>
		<%-- <c:set var="pathone" value="${imgpath }\\${ansf.m_profile }"/> --%>
		<c:set var="pathone" value="upload/${ansf.m_profile }"/>
		<td><img src="${pathone}" alt="이미지없음" width="150px" height="100px"></td>
		<td style="text-align: left; vertical-align: middle;">${ansf.m_nickname }</td> 
		<td style="text-align: center; vertical-align: middle;">
			<%-- <input type="button" id="${ansf.m_id }" value="수락" class="btn btn-primary" onclick="accept(id)"> 
			<input type="button" id="${ansf.m_id }" value="거절" class="btn btn-default" onclick="refuse(id)"> --%>
			<input type="button" id="ac_${ansf.m_id }" value="수락" class="btn btn-primary" onclick="acceptone('${ansf.m_id }')"> 
			<input type="button" id="rf_${ansf.m_id }" value="거절" class="btn btn-default" onclick="refuse('${ansf.m_id }')">
		</td>
		</tr>
	</c:forEach>
	
</table>


<table class="table table-striped table-hover ">
	<colgroup>
		<col width="150px"><col width="200px"><col width="200px">
	</colgroup>
	<tr>
		<td colspan="3">전송한 친구 요청 보기</td>
	</tr>
	<tr>
	<c:if test="${fn:length(askflistinform) eq 0}">
		<td colspan="3" style="text-align: center;">친구 요청을 하지 않았습니다</td></tr>	
	</c:if> 
	<c:forEach items="${askflistinform }" var="askf" varStatus="askfS">
		<c:if test="${askfS.count%2 eq 0}">
			<tr class="info">
		</c:if>
		<c:if test="${askfS.count%2 eq 1}">
			<tr>
		</c:if>
		<c:set var="pathone" value="${imgpath }\\${askf.m_profile }"/>
		<td><img src="${pathone}" alt="이미지없음" width="150px" height="100px"></td>
		<td style="text-align: left; vertical-align: middle;">${askf.m_nickname }</td>
		<td style="text-align: center; vertical-align: middle;">
			<input type="button" id="cc_${askf.m_id }" value="요청취소" class="btn btn-primary" onclick="cancle('${askf.m_id}')">
		</td>
		</tr>
	</c:forEach>
	
</table>
</form>


