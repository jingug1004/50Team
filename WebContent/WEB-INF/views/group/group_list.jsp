<%@ page contentType="text/html; charset=UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:requestEncoding value="utf-8" />
<script type="text/javascript">
	$(document).ready(function() {
		$(".b_name").hide();
		
		$("#top").click(function() {
			$("#groupForm").attr({"target" : "_self","action" : "group_list.do?category=top"}).submit();
		});
		$("#friends").click(function() {
			$("#groupForm").attr({"target" : "_self","action" : "group_list.do?category=membership"}).submit();
		});
		$("#local").click(function() {
			$("#groupForm").attr({"target" : "_self","action" : "group_list.do?category=local"}).submit();
		});
		$("#membership").click(function() {
			$("#groupForm").attr({"target" : "_self","action" : "group_list.do?category=membership"}).submit();
		});
		
		$(".update_gn").click(function() {
			var seq= $(this).attr("data-set");
			$(".b_name").not(this).hide();
			$("#b_name"+seq).show();
		});
	
		$(".up_g_n").click(function() {
			var seq = $(this).attr("data-set");
			var g_name = $("#up_name"+seq).val();
			
			$("#groupForm").attr({"target" : "_self","action" : "group_name_update.do?g_seq="+seq+"&g_name="+g_name}).submit();
			
		});
		
	});

</script>
<div style="width: 100%;" align="center">
	<table style="width: 1200px;" class="table table-striped">
		
		<tr>
			<td>
				<a href="#none" id="top">추천 그룹</a>
				<!--  <a href="#none" id="friends">친구의 그룹</a> --> 
				<a href="#none" id="local">지역그룹</a>
				<b> <a href="#none" id="membership">회원님의 그룹</a></b>
			</td>
		
			<td align="right">
				<a href="#none" data-toggle="modal" data-target="#myModal"><img alt="그룹 생성" src="image/making_group.jpg"></a>
			</td>
		</tr>
	</table>
</div>

<br>
<div style="width: 100%;" align="center">
<div>
	<table class="table table-condensed" style="width: 1200px;">
		<tr>
			<th colspan="2"><h6>내가 관리하는 그룹</h6></th>
		</tr>
		<c:forEach items="${g_list}" var="glist" varStatus="i">
			<c:if test="${glist.g_auth eq 3 }">
				<tr>
					<td align="left"><a href="group_detail.do?g_seq=${glist.g_seq}">${glist.g_name}</a>
					<span class="b_name" id="b_name${glist.g_seq}">
					<input type="text" value="${glist.g_name}" id="up_name${glist.g_seq }">
					<button class="up_g_n btn btn-danger" data-set="${glist.g_seq}">수정</button>
					</span>					
					</td>
					<td align="right"><button class="update_gn btn btn-danger" id="update_gn${glist.g_seq}" data-set="${glist.g_seq }" >그룹 명 수정 </button></td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
</div>
<br>
<div>
	<table class="table table-condensed" style="width: 1200px;">
		<tr>
			<th colspan="2"><h6>가입한 그룹</h6></th>
		</tr>
		<c:forEach items="${g_list}" var="glist" varStatus="i">
			<c:if test="${glist.g_auth ne 3}">
				<tr>
					<td align="left"><a href="group_detail.do?g_seq=${glist.g_seq}">${glist.g_name}</a></td>
					<td></td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
</div>
</div>
<!-- 모달 -->
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
<!--       	  <div class="modal-body"> -->
         <jsp:include page="/WEB-INF/views/group/group_make.jsp"></jsp:include>
       <!--  </div> -->
      </div>
    </div>
  </div>
</div>
<form action="group_list.do" id="groupForm" method="post">
				<input type="hidden" value="1" name="s_num">
				<input type="hidden" value="10" name="l_num">
				<input type="hidden" value="${login.m_id }" id="m_id" name="m_id">
</from>
<!-- 여기까지 모달 입니다. -->
