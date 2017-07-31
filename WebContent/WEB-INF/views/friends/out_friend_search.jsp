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

<!-- 프로필사진 경로 : C:\springstudy\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\SpringSample\upload -->

<script>
/* function Subinform(val, val2){
	alert(val2["m_address"]);
	document.getElementById("testone"+val).innerHTML=val2;
} */

function Subinform(val, val2){
	
}
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

<h4>친구검색</h4>

<table class="table table-striped table-hover ">
	<colgroup>
		<col width="150px"><col width="200px"><col width="200px">
	</colgroup>
	<tr>
		<td colspan="3">알수도 있는 친구 </td><!-- 친구 요청에 답하기  -->
	</tr>
	<tr>
		<c:if test="${fn:length(fssearchflist) eq 0}">
			<tr><td colspan="3" style="text-align: center;">검색된 친구가 없습니다</td></tr>	
		</c:if> 
		<c:forEach items="${fssearchflist }" var="fsschf" varStatus="fsschfS">
			<c:if test="${fsschfS.count%2 eq 0}">
				<tr class="info">
			</c:if>
			<c:if test="${fsschfS.count%2 eq 1}">
				<tr>
			</c:if>
			<%-- <c:set var="pathone" value="${imgpath }\\${fsschf.m_profile }"/> --%>
			<c:set var="pathone" value="upload/${fsschf.m_profile }"/>
			<td><img src="${pathone}" alt="이미지없음" width="150px" height="100px"></td>
			<td style="text-align: left; vertical-align: middle;">				
				<c:if test="${choosekeyword eq 'Name'}">
					${fsschf.m_name }
				</c:if>
				<c:if test="${choosekeyword eq 'Nickname'}">
					${fsschf.m_nickname }
				</c:if>
				<c:if test="${choosekeyword eq 'Phone'}">
					${fsschf.m_phone }
				</c:if>
				<c:if test="${choosekeyword eq 'Id'}">
					${fsschf.m_id }
				</c:if>
				<!--<p id="testone${fsschfS.count }" style="font-size: 11px">여기는 p태그</p>
				 <script type="text/javascript">
					/* Subinform('${fsschfS.count}', '${fsschf.m_address }');	 */
					Subinform('${fsschfS.count}', '${fsschf}');	
				</script> -->
				<p id="testone${fsschfS.count }" style="font-size: 11px">
					<c:if test="${fsschf.m_office ne null}">
						${fsschf.m_office }  근무
					</c:if>
					<c:if test="${fsschf.m_office eq null}">
						<c:if test="${fsschf.m_university ne null}">
							${fsschf.m_university } 대학교
						</c:if>
						<c:if test="${fsschf.m_university eq null}">
							<c:if test="${fsschf.m_highschool ne null}">
								${fsschf.m_highschool } 고등학교
							</c:if>
							<c:if test="${fsschf.m_highschool eq null}">
								<c:if test="${fsschf.m_address ne null}">
									${fsschf.m_address }  거주
								</c:if>
							</c:if>
						</c:if>
					</c:if>
				</p>
			</td>
			<!-- <td id="testone" style="text-align: left; vertical-align: middle;">${fsschf.m_name }</td> -->

			<td style="text-align: center; vertical-align: middle;">
				<input type="button" id="bt_${fsschf.m_id }" class="btn btn-primary" value="친구요청" onclick="befriends('${fsschf.m_id }')">				
			</td>
		</c:forEach>
	</tr>
	<tr>
		<td colspan="3">검색된 친구</td>
		<c:if test="${fn:length(searchflist) eq 0}">
			<tr><td colspan="3" style="text-align: center;">검색된 친구가 없습니다</td></tr>	
		</c:if> 
		<c:forEach items="${searchflist }" var="schf" varStatus="schfS">
			<c:if test="${schfS.count%2 eq 0}">
				<tr class="info">
			</c:if>
			<c:if test="${schfS.count%2 eq 1}">
				<tr>
			</c:if>
			<c:set var="pathone" value="${imgpath }\\${schf.m_profile }"/>
			<td><img src="${pathone}" alt="이미지없음" width="150px" height="100px"></td>
			<td style="text-align: left; vertical-align: middle;">
				<c:if test="${choosekeyword eq 'Name'}">
					${schf.m_name }
				</c:if>
				<c:if test="${choosekeyword eq 'Nickname'}">
					${schf.m_nickname }
				</c:if>
				<c:if test="${choosekeyword eq 'Phone'}">
					${schf.m_phone }
				</c:if>
				<c:if test="${choosekeyword eq 'Id'}">
					${schf.m_id }
				</c:if>
			</td>
			<!-- <td style="text-align: left; vertical-align: middle;">${schf.m_name }</td> --> 
			<td style="text-align: center; vertical-align: middle;">
				<input type="button" id="bt_${schf.m_id }" class="btn btn-primary" value="친구요청" onclick="befriends('${schf.m_id }')">
			</td>
		</c:forEach>
	</tr>
</table>








