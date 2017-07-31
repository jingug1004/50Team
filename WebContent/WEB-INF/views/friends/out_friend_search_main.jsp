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
<!-- <script type="text/javascript" src="js/friend.js"></script> -->


<script type="text/javascript">
function befriends(val){
	
	$.ajax({
		type:"POST",
		url:"befriends.do",
		data:{"m_id":'${login_id}', "f_id":val},
		success : function(response) {
			$("#bt_"+response).attr({"value":"친구요청완료", "disabled":true});
		},error:function(request,status,error){
			alert("error  code:"+request.status+"\n"+"error:"+error);
	    }
		 		
	}); 
}

</script>



<h4>친구검색 메인 = 알수도 있는 친구 </h4>

<form name="ofsmForm">
<%-- <input type="hidden" name="ofsmLoginid" value="${login_id}"> --%>
<table class="table table-striped table-hover ">
	<colgroup>
		<col width="150px"><col width="200px"><col width="200px">
	</colgroup>
	<tr>
		<td colspan="3">알수도 있는 친구</td>
	</tr>
	<c:if test="${fn:length(fsflistinform) eq 0}">
		<tr><td colspan="3" style="text-align: center;">새로운 친구 요청이 없습니다</td></tr>	
	</c:if> 
	<c:forEach items="${fsflistinform }" var="fsflistinf" varStatus="fsflistinfS">
		
		<c:if test="${fsflistinfS.count%2 eq 0}">
			<tr class="info">
		</c:if>
		<c:if test="${fsflistinfS.count%2 eq 1}">
			<tr>
		</c:if>
		<%-- <c:set var="pathone" value="${imgpath }\\${fsflistinf.m_profile }"/> --%>
		<c:set var="pathone" value="upload/${fsflistinf.m_profile }"/>
		<td><img src="${pathone}" alt="이미지없음" width="150px" height="100px"></td>
		<td style="text-align: left; vertical-align: middle;">
			${fsflistinf.m_id }
			<p id="testone${fsflistinfS.count }" style="font-size: 11px">
				<c:if test="${fsflistinf.m_office ne null}">
					${fsflistinf.m_office }  근무
				</c:if>
				<c:if test="${fsflistinf.m_office eq null}">
					<c:if test="${fsflistinf.m_university ne null}">
						${fsflistinf.m_university } 대학교
					</c:if>
					<c:if test="${fsflistinf.m_university eq null}">
						<c:if test="${fsflistinf.m_highschool ne null}">
							${fsflistinf.m_highschool } 고등학교
						</c:if>
						<c:if test="${fsflistinf.m_highschool eq null}">
							<c:if test="${fsflistinf.m_address ne null}">
								${fsflistinf.m_address }  거주
							</c:if>
						</c:if>
					</c:if>
				</c:if>
			</p>
		</td> 
		<td style="text-align: center; vertical-align: middle;">
			<!-- <a href="#" class="btn btn-primary">친구요청</a> --> 
			<%-- <input type="button" id="ofsm${fsflistinfS.count}" class="btn btn-primary" value="친구요청" onclick="befriends(id)"> --%>
			<input type="button" id="bt_${fsflistinf.m_id }" class="btn btn-primary" value="친구요청" onclick="befriends('${fsflistinf.m_id }')">
		</td>
		</tr>
		</c:forEach>
	
</table>
</form>
