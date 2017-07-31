<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<script type="text/javascript">
$(window).bind('scroll', function(){
	   if ($(window).scrollTop() == $(document).height() - $(window).height()){
		   news_scrollEvent();
	   }   
});

function news_scrollEvent(){
	var peopleName='${peopleName }';
	 $(window).unbind('scroll');
     var lastseq = $(".table:last").attr("data-seq");
 	  $.ajax({
 	        type: 'POST',
 	        url: 'test2.do',
 	        data: {'lastseq' : lastseq ,'viewPage' : 'people','eventSeq' : '0','m_id':peopleName},
 			async: false ,
 			cache: false,
 	        success: function(data) {
 	        	  $('#scrolling').append(data); 
 	        	 $(window).bind('scroll', function(){
 	        		   if ($(window).scrollTop() == $(document).height() - $(window).height()){
 	        			  news_scrollEvent();
 	        		   }   
 	        	 }); 
 	        },
 	        error: function(data) {
 	      		alert("error");
 	        }
 	     }); 
}

</script>


<!-- 한영선 : list길이가 0이 아니고, 삭제글이 아니며, 댓글이 아닌 일반글 출력 조건 -->

<c:if test="${fn:length(NewsFeedList) ne 0}">
<input type="hidden" name="m_id" value="${login.m_id }" >

<c:forEach var="news" items="${NewsFeedList }" varStatus="i"> 
<!-- 한영선 : 뉴스피드 수정 클릭시 모달 출력  --> 
<div class="modal fade yss${news.n_seq }">
  <div class="modal-dialog">
    <div class="modal-content">
    
         <jsp:include page="/WEB-INF/views/newsfeed/newsfeed_update_modal.jsp">
            <jsp:param value="${news.n_seq}" name="n_seq"/>
            <jsp:param value="${news.n_content}" name="n_content"/>
            <jsp:param value="${news.n_tag_where}" name="n_tag_where"/>
            <jsp:param value="${news.n_tag_friend}" name="n_tag_friend"/>
            <jsp:param value="${news.n_tag_feel}" name="n_tag_feel"/>
            <jsp:param value="${news.filename }" name="file_name"/>
         </jsp:include>
         
    </div>
  </div> 
</div> 
<!-- 한영선 : 뉴스피드 수정 클릭시 모달 출력  --> 


<c:if test="${news.n_del ne 1 }">
<c:if test="${news.n_step eq 0}">

<!-- // 한영선 : list길이가 0이 아니고, 삭제글이 아니며, 댓글이 아닌 일반글 출력 조건 -->
<br><br>

<!-- 한영선: 뉴스피드 테이블 1 (댓글리스트 출력 제외한 나머지 전부) -->
<div class="table2" data-seq="${news.n_seq }" id="newsfeedlist_total${news.n_seq }" style="width: 800px;">
<div class="table" data-seq="${news.n_seq }" id="newsfeedlist_top${news.n_seq }">

	<table class="newsfeed_list_table${news.n_seq } table  table-condensed table-bordered " style="width: 100%; ">
		<tr>
			
			<td width=80px; rowspan="2">
				<c:if test="${login.m_profile eq 'member_basic.jpg'}">
				<img alt="사진없음" src="./image/${login.m_profile}" height="50px" width="50px">
				</c:if>
				<c:if test="${login.m_profile ne 'member_basic.jpg'}">
				<img alt="사진없음" src="upload/${login.m_profile}" height="50px" width="50px">
				</c:if>
			</td>
			<td align=left>작성자 : <a onclick="location.href='time_line.do?m_id=${news.m_id}'">${news.m_id}</a></td>
			<td>
			
			<!-- 한영선: "수정/삭제" (in 뉴스피드 테이블 1)  -->
			<select name="update_select" class="form-control">
			 	<option value=""><삭제/수정></option>
			 	<option  value="삭제" onclick="removeNews('${news.n_seq}')" >삭제</option>
			 	<option value="수정" data-toggle="modal" data-target=".yss${news.n_seq }">수정</option>
			</select>
			<!-- // 한영선: 수정/삭제 (in 뉴스피드 테이블 1)  -->
			
			</td>
		</tr>
		<tr>
			<td align=left>작성시간 : ${news.n_wdate}</td>
			<td>
				<!-- 한영선: "공개 대상" (in 뉴스피드 테이블 1)  -->
				<select class="dropdown-menu4 form-control" id="total">
				<c:choose>
					<c:when test="${news.n_show eq 1}"> 
						<option value=""><공개 대상></option>
						<option id="dropdown-menu-1-${news.n_seq }"   style="color: red" value="1" onclick="updateShow('1,${news.n_seq }'); changeShow('${news.n_seq }',1)" >전체</option>
					    <option id="dropdown-menu-2-${news.n_seq }" value="2" onclick="updateShow('2,${news.n_seq }'); changeShow('${news.n_seq }',2)" >친구만</option>
					    <option id="dropdown-menu-3-${news.n_seq }" value="3" onclick="updateShow('3,${news.n_seq }'); changeShow('${news.n_seq }',3)" >나만보기</option>
				     </c:when>
					<c:when test="${news.n_show eq 2}">
						<option value=""><공개 대상></option>
						<option id="dropdown-menu-1-${news.n_seq }" value="1" onclick="updateShow('1,${news.n_seq }'); changeShow('${news.n_seq }',1)">전체</option>
					    <option id="dropdown-menu-2-${news.n_seq }" style="color: red" value="2" onclick="updateShow('2,${news.n_seq }'); changeShow('${news.n_seq }',2)" >친구만</option>
					    <option id="dropdown-menu-3-${news.n_seq }" value="3" onclick="updateShow('3,${news.n_seq }'); changeShow('${news.n_seq }',3)">나만보기</option>
				     </c:when>
					<c:when test="${news.n_show eq 3}">
						<option value=""><공개 대상></option>
						<option id="dropdown-menu-1-${news.n_seq }" value="1" onclick="updateShow('1,${news.n_seq }'); changeShow('${news.n_seq }',1)">전체</option>
					    <option id="dropdown-menu-2-${news.n_seq }" value="2" onclick="updateShow('2,${news.n_seq }'); changeShow('${news.n_seq }',2)">친구만</option>
					    <option id="dropdown-menu-3-${news.n_seq }" style="color: red"  value="3" onclick="updateShow('3,${news.n_seq }'); changeShow('${news.n_seq }',3)" >나만보기</option>
				     </c:when>
				</c:choose>
				</select>
				<!-- // 한영선: "공개 대상" (in 뉴스피드 테이블 1)  -->
				 
			</td>
		</tr>
	
		<!-- 한영선: "태그3가지(장소,친구,기분상태)" (in 뉴스피드 테이블 1)  -->
		<tr>
			<td colspan="3"  align=left>
				
				
					<pre width="50px" style="background-color: white">${news.n_content}</pre>
				
				<c:if test="${news.n_tag_where ne NULL}">
					<strong>${news.n_tag_where}</strong>&nbsp;에서
				</c:if>
				
				<c:if test="${news.n_tag_friend ne NULL}">
					&nbsp;&nbsp;&nbsp;<strong>${news.n_tag_friend}</strong>&nbsp;님과 함께
				</c:if>
				
				<c:if test="${news.n_tag_feel ne NULL}">
					&nbsp;&nbsp;&nbsp;나는 지금
					<c:choose>
						<c:when test="${news.n_tag_feel eq 1}"><strong>기뻐요</strong><img src="image/happy.jpg" width="5px" height="5px"></c:when>
						<c:when test="${news.n_tag_feel eq 2}"><strong>슬퍼요</strong><img src="image/sad.jpg"></c:when>
						<c:otherwise><strong>피곤해요</strong><img src="image/tired.jpg"></c:otherwise>
					</c:choose>
				</c:if>	
			</td>
		</tr>
		<!-- // 한영선: "태그3가지(장소,친구,기분상태)" (in 뉴스피드 테이블 1)  -->

		<!-- 한영선: "이미지첨부 글인 경우, 이미지 출력부분" (in 뉴스피드 테이블 1)  -->
		<c:if test="${news.n_form_num eq 1}" >
				<tr>
					<td colspan="3"  align=left>
					<img alt="이미지없음" src="upload/${news.filename }" width="200px" height="200px"><br>
					</td>
				</tr>
		</c:if>
		<!-- // 한영선: "이미지첨부 글인 경우, 이미지 출력부분" (in 뉴스피드 테이블 1)  -->
		
		<!-- 한영선: "좋아요, 댓글달기 클릭 하는 곳" (in 뉴스피드 테이블 1)  -->
		<tr>
			<td colspan="3"  align=left>
				<i class="fa fa-thumbs-o-up" id="like_btn${news.n_seq }"  aria-hidden="true" onclick="like_btn_second(${news.n_seq })"  style="color: black"></i> 
				<a id="like_btn_second${news.n_seq }"  onclick="like(${news.n_seq },'${news.m_id }')" style="color: black">좋아요</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<i class="fa fa-comment-o" aria-hidden="true" onclick="showComment(${news.n_seq })"></i> 
				<a onclick="showComment(${news.n_seq })" style="color: black">댓글달기</a>
			</td>
		</tr>
		<!-- // 한영선: "좋아요, 댓글달기 클릭 하는 곳" (in 뉴스피드 테이블 1)  -->
		
		
		
		<tr id="show_like_member${news.n_seq }" style="display: none">
			<td colspan="3"  align=left>
				<!-- 한영선: "[ 좋아요 누른 사람들 ] 텍스트출력 고정" (in 뉴스피드 테이블 1)  -->
				<div id="like_member">
					[ 좋아요 누른 사람들 ]
				</div>
				<!-- // 한영선: "[ 좋아요 누른 사람들 ] 텍스트출력 고정" (in 뉴스피드 테이블 1)  -->
				
				<!-- 한영선: "[ 좋아요 누른 사람들 ] DB값 뿌리는 곳" (in 뉴스피드 테이블 1)  -->
				<div id="like_member${news.n_seq }">
				</div>
				<!-- // 한영선: "[ 좋아요 누른 사람들 ] DB값 뿌리는 곳" (in 뉴스피드 테이블 1)  -->
			</td>
		</tr>
		
		<!-- 한영선: 댓글 입력  (in 뉴스피드 테이블 1)  -->
		<tr id ="show_comment${news.n_seq }" style="display: none;">
		<td>
		${login.m_id }
<%-- 			<c:if test="${login.m_profile eq 'member_basic.jpg'}">
			<img alt="사진없음" src="./image/${login.m_profile}" height="50px" width="50px">
			</c:if>
			<c:if test="${login.m_profile ne 'member_basic.jpg'}">
			<img alt="사진없음" src="upload/${login.m_profile}" height="50px" width="50px">
			</c:if> --%>
		</td>
			<td colspan="2"><input type="text"  style="width:100%;" id="n_content${news.n_seq }" name="n_content" onkeydown="onKeyDown_comment('${news.n_seq }')"></td>
		</tr>
		<!-- // 한영선: 댓글 입력  (in 뉴스피드 테이블 1)  -->

	</table>

</div>
<!-- // 한영선: 뉴스피드 테이블 1 (댓글리스트 출력 제외한 나머지 전부) -->


<!-- 한영선: 뉴스피드 테이블2 (댓글리스트 출력) -->
<div id="newsfeedlist_bottom${news.n_seq }">

   <table class="newsfeed_list_table2${news.n_seq }"  >
      <c:forEach var="news2" items="${NewsFeedList2 }" varStatus="j"> 
      
         <c:if test="${news.n_seq eq news2.n_parent}">   
            <tr class="comment2${news.n_seq }"style="display: none;">
               <td rowspan="2">
<%--                <c:if test="${login.m_profile eq 'member_basic.jpg'}">
               <img alt="사진없음" src="./image/${login.m_profile}" height="50px" width="50px">
               </c:if>
               <c:if test="${login.m_profile ne 'member_basic.jpg'}">
               <img alt="사진없음" src="upload/${login.m_profile}" height="50px" width="50px">
               </c:if> --%>
               </td>
               
               <td colspan="2" align="left">&nbsp;<Strong>${news2.m_id }</Strong> &nbsp;&nbsp;${news2.n_content }</td>
            </tr>
            <tr class="comment3${news.n_seq }"  align="left"style="display: none;">
               <td colspan="2">&nbsp;<a>좋아요</a>&nbsp;·&nbsp;<a>답글달기</a>&nbsp;·&nbsp;${news2.n_wdate }</td>
            </tr>
         </c:if>
      </c:forEach>
   </table>

</div>
<!-- // 한영선: 뉴스피드 테이블2 (댓글리스트 출력) -->

</c:if>
</c:if>
</div>

</c:forEach> 

</c:if>


<!-- 한영선: 스크롤 이벤트 발생 시 뿌려지는 곳 -->
<div id="scrolling"></div>
<!-- // 한영선: 스크롤 이벤트 발생 시 뿌려지는 곳 -->




<script type="text/javascript">

function like(val, val2){
   var now_like_member
      $.ajax({
      type: 'GET',
      url:'Like.do',
      data:{'seq':val , 'm_id':'${login.m_id}'},
      async: false ,
      cache: false,
      success: function(data) {
         now_like_member=data;
       },
       error: function(data) {
         alert("like error");
       } 
   }); 

   status = $("#like_btn"+val).css("color");
   if(status=="rgb(255, 0, 0)"){
      $(" #like_btn"+val).css("color","black");
      $(" #like_btn_second"+val).css("color","black");
      $("#show_like_member"+val).css("display","none");
      
   }else{
      $(" #like_btn"+val).css("color","red");
      $(" #like_btn_second"+val).css("color","red");
      $("#show_like_member"+val).show();
      $("#like_member"+val).text(now_like_member);
   };
}

function showComment(val){

    status = $("#show_comment"+val).css("display");
    if(status=="none"){
      $(".comment2"+val).show();
      $(".comment3"+val).show();
      $("#show_comment"+val).show();
    }else{
       $(".comment2"+val).hide();
       $(".comment3"+val).hide();
       $("#show_comment"+val).hide();
    }
}

function updateShow(val){
    $.ajax({
      type: 'GET',
      url:'updateShow.do',
      data:{'val':val},
    })
}

function changeShow(val,val2){
   if(val2=="1"){
      $("#dropdown-menu-"+1+"-"+val).css("color","red");
      $("#dropdown-menu-"+2+"-"+val).css("color","black");
      $("#dropdown-menu-"+3+"-"+val).css("color","black");
   }else if(val2=="2"){
      $("#dropdown-menu-"+1+"-"+val).css("color","black");
      $("#dropdown-menu-"+2+"-"+val).css("color","red");
      $("#dropdown-menu-"+3+"-"+val).css("color","black");
   }else if(val2=="3"){
      $("#dropdown-menu-"+1+"-"+val).css("color","black");
      $("#dropdown-menu-"+2+"-"+val).css("color","black");
      $("#dropdown-menu-"+3+"-"+val).css("color","red");
   }
}

function removeNews(val){
    $.ajax({
         type: 'GET',
         url:'deleteNews.do',
         data:{'val':val},
          success: function(data) {
             $(".newsfeed_list_table"+val).hide();
             $(".newsfeed_list_table2"+val).hide();
          },
            error: function(data) {
               alert("removeNews error");
            }
       });
}

function onKeyDown_comment(val)
{
    if(event.keyCode == 13)

	{
	 	var s = "<tr><td rowspan='2'></td><td colspan='2' align='left'>&nbsp;<Strong>${login.m_id }</Strong> &nbsp;&nbsp;"+
	 	$("#n_content"+val).val()+"</td></tr><tr><td colspan='2' align='left'>&nbsp;<a>좋아요</a>&nbsp;·&nbsp;<a>답글달기</a>&nbsp;·&nbsp;방금전</td></tr>";
		
	 	$("#newsfeedlist_bottom"+val).prepend(s); 
		
		var content = $("#n_content"+val).val();
		var viewPage = '${ param.viewPage }';
		var eventSeq = '${ param.eventSeq }';
		
		$.ajax({
			type: 'GET',
			data:{'n_seq':val, 'n_content':content, 'm_id':'${login.m_id }', 'viewPage': viewPage, 'eventSeq' : eventSeq},
			url:'writeComment.do',
		 });
		
		$("#n_content"+val).val("");

   }
}

</script>