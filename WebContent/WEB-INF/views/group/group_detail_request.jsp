<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div style="width: 100%;">
<jsp:include page="/WEB-INF/views/group/group_header.jsp"/>
</div>
<br><br><br>
<div style="width: 100%;" class="table table-bordered">
		<table style="width: 100%;" class="table table-striped">
			<c:if test="${empty requset_list}">
			<tr><td colspan="2"><h4>가입 신청이 없습니다.</h4></td></tr>
			</c:if>
			
			<c:if test="${!empty requset_list}">
			<!-- <tr>
				<td>
				<div style="width: 100%;">
				<table> -->
				<c:forEach items="${requset_list }" var="j_list" varStatus="i">
				<tr class="j_list${i.count}">
				<td rowspan="2" style="width: 20%;">
				<%-- 
				<img alt="프로필" src="upload/${j_list.m_profile}" style="width: 50px; height: 50px;" >
				 --%>
				<c:if test="${j_list.m_profile eq 'member_basic.jpg'}">
   				<img alt="사진없음" src="image/${j_list.m_profile}" class="m_profile">
   				</c:if>
   				<c:if test="${j_list.m_profile ne 'member_basic.jpg'}">
   				<img alt="사진없음" src="upload/${j_list.m_profile}" class="m_profile">
   				</c:if>	
				</td>
				<td style="width: 60%;">아이디 : ${j_list.m_id}</td>
				<td rowspan="2" style="width: 10%;"><img alt="승인" src="image/yes.jpg" subscriber="${j_list.m_id}" icount="${i.count}"  class="g_join_yes" id="g_yes${j_list.j_seq }" data-set="${j_list.j_seq }"></td>
				<td rowspan="2" style="width: 10%;"><img alt="거절" src="image/no.jpg" subscriber="${j_list.m_id}" icount="${i.count}" class="g_join_no" id="g_no${j_list.j_seq }" data-set="${j_list.j_seq }"></td>
				</tr>
				<tr class="j_list${i.count}">
				<c:if test="${empty j_list.m_university }">
					<c:if test="${empty j_list.m_highschool }">
						<c:if test="${empty j_list.m_office }">
							<c:if test="${empty j_list.m_address }">
								<td></td>
							</c:if>
							<c:if test="${empty j_list.m_address }">
								<td>
								${j_list.m_office} 에 거주
								</td>
							</c:if>
						</c:if>
						<c:if test="${!empty j_list.m_office }">
							<td>
							${j_list.m_office} 에서 근무
							</td>
						</c:if>
					</c:if>
					<c:if test="${!empty j_list.m_highschool }">
						<td>
						학력 : ${j_list.m_highschool}
						</td>
					</c:if>
				</c:if>
				
				<c:if test="${!empty j_list.m_university }">
				<td>
				학력 : ${j_list.m_university}
				</td>
				</c:if>
				
				</tr>
				</c:forEach>
				<!-- </table>
				</div>
				</td>
			</tr> -->
			</c:if>
		</table>
	</div> 
	
	
<script type="text/javascript">
var g_seq =${g_make.g_seq };

$(".g_join_yes").click(function() {
	var yes = $(this).attr("id");
	var j_seq = $(this).attr("data-set");
	var subscriber=$(this).attr("subscriber");
	var count=$(this).attr("icount");	
	 $.ajax({
		 type:"POST",
		 data :{"a_type" :0,"j_seq" : j_seq, "m_id" :subscriber, "g_seq" : g_seq},
			url: "group_accept.do",
		 success: function(result){
			/* alert(result); */
			$(".j_list"+count).hide();
	    }, error: function(){
	    	alert(result);
	    }
	});
});
$(".g_join_no").click(function() {
	var yes = $(this).attr("id");
	var j_seq = $(this).attr("data-set");
	var subscriber=$(this).attr("subscriber");
	var count=$(this).attr("icount");	
	 $.ajax({
		 type:"POST",
		 data :{"a_type" :1,"j_seq" : j_seq, "m_id" :subscriber, "g_seq" : g_seq},
			url: "group_accept.do",
		 success: function(result){
			/* alert(result); */
			$(".j_list"+count).hide();
	    }, error: function(){
	    	alert(result);
	    }
	});
});
</script>	
	
<%--  <form action="group_accept.do" method="post" id="g_form">
 
<input type="hidden" value="" id="j_seq">
<input type="hidden" value="" id="a_type">

</form> --%>
	
	