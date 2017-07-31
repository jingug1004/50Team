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
<script src="js/friend.js"></script>

<!-- 프로필사진 경로 : C:\springstudy\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\SpringSample\upload -->

<h1>차단 그룹</h1>

<form>
<table class="table table-striped table-hover ">
	<colgroup>
		<col width="150px"><col width="200px"><col width="200px">
	</colgroup>
	<tr>
		<td colspan="3">차단 <font color="gray">( ${fn:length(blocklistinform) } 명 )</font></td>
	</tr>
	<c:if test="${fn:length(blocklistinform) eq 0}">
		<tr><td colspan="3" style="text-align: center;">해당 그룹 내 인원이 없습니다</td></tr>	
	</c:if> 
	<c:forEach items="${blocklistinform }" var="blockf" varStatus="blockfS">
		<c:if test="${blockfS.count%2 eq 0}">
			<tr class="danger">
		</c:if>
		<c:if test="${blockfS.count%2 eq 1}">
			<tr>
		</c:if>
		<%-- <c:set var="pathone" value="${imgpath }\\${knowf.m_profile }"/> --%>
		<c:set var="pathone" value="upload/${knowf.m_profile }"/>
		<td><img src="${pathone}" alt="이미지없음" width="150px" height="100px"></td>
		<td style="text-align: left; vertical-align: middle;">
			<p>${blockf.m_nickname }</p>
			<c:forEach items="${fstotalnum }" var="fstn" varStatus="fstnS">	
				<c:if test="${fstn.key eq blockf.m_id }">
					<p><font color="gray" size="1px">친구 ${fstn.value } 명</font></p>
				</c:if>
			</c:forEach>
		</td> 
		<td style="text-align: center; vertical-align: middle;">
			<input type="button" id="bg_${blockf.m_id }" class="btn btn-primary" value="차단 해제" onclick="cancleblock(id, '${blockf.m_id}', '${login_id }')">
		</td>
		</tr>
	</c:forEach>
	
</table>
</form>