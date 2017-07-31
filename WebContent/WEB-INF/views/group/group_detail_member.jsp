<%@ page contentType="text/html; charset=UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="utf-8"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<style type="text/css">
ul.ulA {
    list-style:none;
    margin:0;
    padding:0;
}
li.liA {
    margin: 0 0 0 0;
    padding: 0 0 0 0;
    border : 0;
    float: left;
}
</style>
<script>
$(document).ready(function(){
    $("#membernum").click(function() {
    	location.href="group_detail_member.do?keyword=&type=1&g_seq="+${g_make.g_seq };
	});
    $("#admin").click(function() {
    	location.href="group_detail_member.do?keyword=&type=2&g_seq="+${g_make.g_seq };
	});
    $("#block").click(function() {
    	location.href="group_detail_member.do?keyword=&type=3&g_seq="+${g_make.g_seq };
	});
    $("#name_search").click(function() {
    	  var keyword = $("#keyword").val();
       	location.href="group_detail_member.do?keyword="+keyword+"&type=1&g_seq="+${g_make.g_seq };
  	});
    $(".m_out").click(function() {
    	 var m_id = $(this).attr("data-set");
    	 var g_seq = $("#g_seq").attr("value");
    	 var i =  $(this).attr("i-count");
    	/*  alert(i); */
    	 
    	 $.ajax({
    		 type:"POST",
    			url: "group_mem_out.do?g_seq="+g_seq+"&m_id="+m_id,
    		 success: function(result){
    			/* alert(result); */
    			$("#profileTable"+i).hide();
    	    }, error: function(){
    	    	alert(result);
    	    }
    	}); 
    	 
    });
});
</script>
</head>
<body>
<!-- 헤더 -->
<div>
<div style="width: 100%;">
<jsp:include page="/WEB-INF/views/group/group_header.jsp"/>
</div>
<!-- 헤더 끝-->
<hr>
<!-- 멤버 -->
<c:if test="${g_key eq true || g_make.g_type eq 1 }">
	<div style="width: 100%;" class="table table-bordered">
		<table style="width: 100%;" class="table table-bordered">
			<tr>
			<td align="left">
				<ul class="ulA">
					<li class="liA"><b><a href="#none" id="membernum">멤버 ${g_m_list.size()}명</a></b>&nbsp;&nbsp;</li>
					<li class="liA"><a href="#none" id="admin">관리자(${g_m_a_list.size()})</a>&nbsp;&nbsp;</li>
					<li class="liA"><a href="#none" id="block">차단(${g_m_r_list.size()})</a>&nbsp;&nbsp;</li>
					</ul>
			</td>
				<td align="right" style="width: 50%;"class="form-inline"><span><input class="form-control" type="text" value="" placeholder="멤버 검색" name="keyword" id="keyword"></span><span><button id="name_search" class="btn btn-danger">검색</button>&nbsp;</span></td>
			</tr>
			<c:if test="${g_m_list.size() == 0}">
			<tr><td colspan="2"><h4>검색 결과가 없습니다.</h4></td></tr>
			</c:if>
			<c:if test="${g_m_list.size() > 0}">
			<tr>
				<c:forEach items="${g_m_list}" var="mlist" varStatus="i">
				<td style="width: 50%;">
				<div style="width: 100%;">
				<table id="profileTable${i.count }">
				<tr>
				<td style="width: 20%;">
				<c:if test="${mlist.m_profile eq 'member_basic.jpg'}">
   				<img alt="사진없음" src="image/${mlist.m_profile}" class="m_profile">
   				</c:if>
   				<c:if test="${mlist.m_profile ne 'member_basic.jpg'}">
   				<img alt="사진없음" src="upload/${mlist.m_profile}" class="m_profile">
   				</c:if>	
			<%-- 	
				<c:if test="${!empty mlist.m_profile && mlist.m_profile ne 'member_basic.jpg'}">
				<img class="m_profile" alt="프로필" src="upload/${mlist.m_profile}">
				</c:if>
				<c:if test="${empty mlist.m_profile || mlist.m_profile eq 'member_basic.jpg' }">
				<img class="m_profile" alt="프로필" src="image/basic_profile.jpg">
				</c:if>
			 --%>
				</td>
				
				<td style="width: 70%;">
				<h5><a href="#">${mlist.m_name}</a></h5>
					<c:if test="${mlist.m_university ne null}">
						<h6>${mlist.m_university}</h6>		
					</c:if>
					<c:if test="${mlist.m_university eq null}">
						<h6>${mlist.m_highschool}</h6>		
					</c:if>
					<c:if test="${mlist.m_address ne null}">
						<h6>${mlist.m_address}</h6>		
					</c:if>
					<c:if test="${mlist.m_address eq null}">
						<h6>${mlist.m_office}</h6>		
					</c:if>
				</td>
				<c:if test="${g_make.g_manager eq login.m_id}">
				<td style="width: 10%;">
				<div class="dropdown">
				<a href="#"><img src="image/set.jpg" alt="설정"></a>
				<div class="dropdown-content">
					<a href="#"><img class="m_out" alt="그룹 나가기" src="image/del_group.jpg" data-set="${mlist.m_id }" i-count="${i.count }"></a>
					</div>
				</div>
				</td>
				</c:if>
				</tr>
				</table>
				</div>
				</td>
				<c:if test="${i.count%2 eq 0 }">
				</tr><tr>
				</c:if>
				</c:forEach>
			</tr>
			</c:if>
		</table>
		
	</div>
</c:if>
</div>
</body>
</html>
