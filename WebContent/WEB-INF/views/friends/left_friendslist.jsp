<%@ page contentType="text/html; charset=UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:requestEncoding value="utf-8"/>

<div id="top_menu_wrap">
	<div id="_top_menu">
		<ul class="navi" style="list-style: none;">
			<li><a href="outfriendsearchmain.do" title="친구검색">친구검색</a></li> <!-- 친구검색 : 좌측 리스트, 우측리스트 중에 좌측리스트에 해당. 이건 친구 외 검색의 메인을 보여줌(==알수도있는친구) -->
			<li><a href="infriendsearch.do" title="친구목록">친구목록</a></li>
			<!-- <li><a href="friendlist.do" title="친구목록">친구목록</a></li> -->	<!-- header에 놓일 anchor, right side menu에 나타날 목록(넣을까말까) -->
			<!-- 해당회원의 SNS에 들어갔을 때 left side menu에 나타날 anchor : -->
						<!-- 그룹별 관리 대메뉴(친구관리) -->
			<li><a href="familygroup.do" title="가족">가족</a></li>		<!-- 그룹별 관리 메뉴1 -->
			<li><a href="bestgroup.do" title="친한친구">친한친구</a></li>		<!-- 그룹별 관리 메뉴2 -->
			<li><a href="knowgroup.do" title="아는 친구">아는 친구</a></li>		<!-- 그룹별 관리 메뉴3 : follow친구 여기에 포함-->
			<li><a href="blockgroup.do" title="차단">차단</a></li>		<!-- 그룹별 관리 메뉴4 -->
			
			
			<li><a href="friendask.do" title="친구요청">친구요청</a></li>
		</ul>
	</div>
</div>
