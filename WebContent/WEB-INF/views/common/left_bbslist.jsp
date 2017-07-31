<%@ page contentType="text/html; charset=UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:requestEncoding value="utf-8" />

<style>

.menu_table 
li.menu_item
a:hover{
	background-image:url("<%=request.getContextPath()%>/image/arrow.gif");
	background-repeat:no-repeat;
	background-position:5px 7px;
	background-color:#000000;
}

ul {
	list-style: none;
	margin: 0px; 
	padding: 0px;
}

</style> 

<div id="top_menu_wrap">
	<div id="_top_menu">
		<ul class="navi">

			<li><a href="my_page.do" title="프로필 수정">프로필 수정</a>
			<li><a href="NewsFeedList2.do?m_id=${login.m_id }" title="뉴스피드">뉴스피드</a></li>
			<li><a href="friendmain.do" title="친구">친구</a></li>
			<li><a href="event_calendar.do">일정</a></li>
			<li class="menu_item">
			<!-- <a href="#none" onclick="location.href='group_list.do?category=membership&m_id=aa'" title="그룹">그룹</a> -->
			<form action="" id="groupForm" method="post">
			<input type="hidden" value="${login.m_id }" id="m_id" name="m_id">
			<a href="#none" id="group" title="그룹">그룹</a>
			</form>
			</li>
			<li class="menu_item">
			 		<a data-toggle="modal" data-target="#myModal">그룹 만들기</a>
			</li>
		</ul>
	</div>
</div>
	
<!-- <div class="menu_table">
	<ul style="width:100%;">
		
	</ul>
</div> -->
<!-- 여기부터 모달 입니다. -->
<div class="container">
  <!-- Trigger the modal with a button -->
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
<!--         <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div> -->
      	 <!--  <div class="modal-body"> -->
          <jsp:include page="/WEB-INF/views/group/group_make.jsp"></jsp:include>
       <!--  </div> -->
      </div>
    </div>
  </div>
</div>

<!-- 여기까지 모달 입니다. -->

<script type="text/javascript">
$(document).ready(function name() {
	$("#group").click(function() {
		$("#groupForm").attr({"target":"_self","action":"group_list.do?category=membership"}).submit();
	});
});
</script>