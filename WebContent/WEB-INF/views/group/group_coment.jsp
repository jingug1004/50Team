<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<style>
/* .c_profile {
width: 25px;
height: 25px;
margin-bottom: 3px;
margin-top: 2px;
}
.profile_flied{
width: 10%;
margin-left: 1px;
}
.c_name{
margin-left: 3px;
width: 10%;
text-align: left;
}
.c_content{
text-align: left;
width: 60%;
} */
</style>
 <script type="text/javascript">
$(document).ready(function() {
	$(".add_coment").click(function() {
		var a = $(this).attr("data-set");
		var b = $(this).attr("data-set2");
		$(this).hide();		
		$.ajax({
			type: 'POST',
			url: 'group_add_coment.do?l_num='+a+'&n_parent='+b,
			async: false,
			cache: false,
			timeout: 10000,
			success: function(data) {
				$('#coment'+b).append(data); 
			},
			error: function(data) {
				alert("실패...");
			}
		});  
		
	});

});
 </script>

<c:if test="${empty clist }">
<h6>작성된 댓글이 없습니다.</h6>
</c:if>
<c:if test="${!empty clist }">
<table style="width: 100%;">
<c:forEach items="${clist }" var="clist" varStatus="i">
<tr>
<td class="profile_flied">

   <c:if test="${clist.m_profile eq 'member_basic.jpg'}">
   <img alt="사진없음" src="image/${clist.m_profile}" class="c_profile">
   </c:if>
   <c:if test="${clist.m_profile ne 'member_basic.jpg'}">
   <img alt="사진없음" src="upload/${clist.m_profile}" class="c_profile">
   </c:if>
<%-- 

<c:if test="${!empty clist.m_profile }">
<img class="c_profile" alt="프로필" src="upload/${clist.m_profile }">
</c:if>
<c:if test="${empty clist.m_profile }">
<img class="c_profile" alt="프로필" src="image/basic_profile.jpg">
</c:if>

 --%>


</td>
<td class="c_name"><h6>${clist.m_id }</h6></td>
<td class="c_content"><h6>${clist.n_content }</h6></td>
<td class="c_time"><h6>${clist.n_wdate }</h6></td>
</tr>
<c:if test="${i.count eq 10 }">
<tr>
<%-- <td colspan="4"><a href="#none" class="add_coment${l_num}" onclick="add_coment(${clist.n_parent},${l_num+10 })">댓글 더보기</a></td> --%>
<td colspan="4"><h6><a href="#none" class="add_coment" data-set="${l_num+10}" data-set2="${clist.n_parent }">댓글 더보기</a></h6></td>
</tr>
</c:if>
</c:forEach>
</table>
</c:if>