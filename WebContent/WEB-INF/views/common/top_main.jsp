<%@ page contentType="text/html; charset=UTF-8"%>

<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/go_url.js"></script>

<meta name="generator" content="Bootply" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<!-- <link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet"> -->


<style>
#header_wrap div{
	 background-color: #3B5998;
}

.tbl_top_main td {
	padding-right: 10px;
}

</style>

<div style="padding: 5px 0">
<table class="tbl_top_main" style="text-align: center; margin: auto;">
<col width="50px;">
<col width="auto;">
<col width="auto;">
<col width="40px;">
<col width="auto;">
<tr>
<td>
	<a href="NewsFeedList2.do"><i class="fa fa-home fa-2x" aria-hidden="true" style="color: #fff;"></i></a>
</td>

<td>
	<div>
	<c:if test="${login.m_profile eq 'member_basic.jpg'}">
	<img alt="사진없음" src="./image/${login.m_profile}" height="50px" width="50px">
	</c:if>
	<c:if test="${login.m_profile ne 'member_basic.jpg'}">
	<img alt="사진없음" src="upload/${login.m_profile}" height="50px" width="50px">
	</c:if>
	</div>

</td>
<td>
	<c:if test="${login.m_id ne ''}">
	<a class="btn btn-default" href="my_page.do">
      	${login.m_nickname}
    </a>
	</c:if>
</td>
<!-- 
<td>
	<a class="btn btn-default" href="#">친구찾기</a>
</td>
-->
<td>
	<div class="btn-group">
	  <a class="btn btn-default dropdown-toggle"  aria-expanded="false" href="#" data-toggle="dropdown"><span class="caret"></span></a>
	  <ul class="dropdown-menu">
	    <li><a href="#">페이지 만들기</a></li>
	    <li class="divider"></li>
	    <li><a href="#">그룹 만들기</a></li>
	    <li><a href="#">새 그룹</a></li>
	    <li class="divider"></li>
	    <li><a href="#">광고 만들기</a></li>
	    <li><a href="#">ㅇㅇ에서 광고하기</a></li>
	    <li class="divider"></li>
	    <li><a href="#">활동 로그</a></li>
	    <li><a href="#">뉴스피드 기본 설정</a></li>
	    <li><a href="#">설정</a></li>
	    <li><a href="login.do">로그아웃</a></li>
	    <li class="divider"></li>
	    <li><a href="#">고객센터</a></li>
	    <li><a href="#">지원 관련 메시지함</a></li>
	    <li><a href="#">문제 신고</a></li>
	    <li class="divider"></li>
	  </ul>
	</div>
</td>
</tr>
</table>
</div>

<!-- <script type="text/javascript">
function logout() {
	alert("로그아웃");
	location.href="login.do";
}

</script> -->
