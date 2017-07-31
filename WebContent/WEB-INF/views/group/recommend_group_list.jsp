<%-- <%@page import="org.omg.CORBA.OBJ_ADAPTER"%> --%>
<%@ page contentType="text/html; charset=UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:requestEncoding value="utf-8" />
<%
Object snum = request.getAttribute("s_num");
int s_num = (int)snum;

Object lnum = request.getAttribute("l_num");
int l_num = (int)lnum;
/* 
System.out.println("받은 값 S"+s_num+"L"+l_num);
*/
%>
 <script type="text/javascript">
$(document).on("click",".g_join",function() {
	var g_id = $(this).attr("id");
	var g_seq = $(this).attr("data-set");
	var g_manager = $(this).attr("manager");
	var m_id = $("#m_id").attr("value");
	var r_date= 0;
	/* alert(g_id); */
/* 	var all_data ={"g_seq":g_seq, "g_manager":g_manager, "m_id":m_id, "r_date":0}; */
	 $.ajax({
		 type:"POST",
		/*  data: all_data, */
		/*  url:"group_join_request.do", */
			url: "group_join_request.do?g_seq="+g_seq+"&g_manager="+g_manager+"&m_id="+m_id,
		 success: function(result){
			/* alert(result); */
		 	$("#"+g_id).attr('src','image/request.jpg'); 
	    }, error: function(){
	    	alert(result);
	    }
	});
	
	
});
</script> 
<script type="text/javascript">
var s_num1 =1;
var l_num1 =10;
var id = $("#m_id").attr("value");

	$(document).ready(function() {
		//리스트 출력 막으려고
		var i = 0;
	
		$("#top").click(function() {
			$("#groupForm").attr({"target" : "_self","action" : "group_list.do?category=top&s_num=1&l_num=10"}).submit();
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
	 	$(window).scroll(function() {
			var posScroll = $(window).scrollTop() + $(window).height();
			var maxHeight = $(document).height();

			if (($(window).scrollTop() == $(document).height() - $(window).height())) {
				s_num1 = s_num1+10;
				l_num1 = l_num1+10;
				
				$.ajax({
					type: 'POST',
					url: 'list.do?category=top&m_id='+id+'&s_num='+s_num1+'&l_num='+l_num1,
					async: false,
					cache: false,
					timeout: 10000,
					success: function(data) {
					  	$('#bdiv').append(data); 
					},
					error: function(data) {
						alert("실패...");
					}
				}); 
			}
			
		});
 

	});
</script>


<div style="width: 100%;" align="center">
	<table style="width: 1200px;" class="table table-striped">
		<tr>
			<td>
				<b><a href="#none" id="top">추천 그룹</a></b>
				<!-- <a href="#none" id="friends">친구의 그룹</a> -->
				<a href="#none" id="local">지역그룹</a>
				<a href="#none" id="membership">회원님의 그룹</a>
			</td>
			<td align="right">
				<a href="#none" data-toggle="modal" data-target="#myModal"><img alt="그룹 생성" src="image/making_group.jpg"></a>
			</td>
		</tr>
	</table>
</div>
<div>
<jsp:include page="list_table.jsp"/>
	<c:if test="${re_list.size() == 0 }">
		<table>
			<tr>
				<td><h4>추천 그룹이 없습니다.</h4></td>
			</tr>
		</table>
	</c:if>
</div>

<!-- 리스트 출력 부분 -->
<div id="bdiv">
</div>
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
      <!--   </div> -->
      </div>
    </div>
  </div>
</div>

<!-- 여기까지 모달 입니다. -->
<form action="group_list.do" id="groupForm" method="post">
	<input type="hidden" value="1" name="s_num">
	<input type="hidden" value="10" name="l_num"> 
	<input type="hidden" value="${login.m_id }" id="m_id" name="m_id">
</from> 
