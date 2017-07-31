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
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<style>
video{
	width: 100%;
    height: auto;
}


</style>


<script>
var s_num1 = 1;
var l_num1 = 10;
	
$(document).ready(function(){
	var gseq = $("#g_seq").attr("value");
	
	$("#writer").hide();
    $("#content").click(function(){
        $("#writer").show();
    });
    
	$(window).scroll(function() {
		var posScroll = $(window).scrollTop() + $(window).height();
		var maxHeight = $(document).height();
		
		
		if (($(window).scrollTop() == $(document).height() - $(window).height())) {
			s_num1 = s_num1+10;
			l_num1 = l_num1+10;
			$.ajax({
				type: 'POST',
				url: 'group_newsfeed_list.do?g_seq='+gseq+'&s_num='+s_num1+'&l_num='+l_num1,
				async: false,
				cache: false,
				timeout: 10000,
				success: function(data) {
					$('#add_g_list').append(data); 
				},
				error: function(data) {
					alert("오류..");
				}
			}); 
		}
		
	});

});

$(document).on("click",".g_nlistp",function(){
	var modal_src =  $(this).attr("src");
	$("#g_list_photo").attr("src",modal_src);
});


$(document).on("click",".videoclass",function(){
	var modal_video =  $(this).attr("data-set");
	$("#g_list_video").attr("src",modal_video);
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
<c:if test="${g_key eq true }">
<div style="width: 70%;">
	<jsp:include page="/WEB-INF/views/group/group_newsfeed_write.jsp"/>
	<%-- <jsp:include page="/WEB-INF/views/group/test.jsp"/>  --%>
</div>
</c:if>
<c:if test="${g_key ne true }">
<div style="width: 70%;">
<h5>글쓰기는 그룹 가입후 작성 가능합니다.</h5>
</div>
</c:if>

<br/>
<c:if test="${g_key eq true || g_make.g_type eq 1 }">
<div style="width: 70%;">
<jsp:include page="/WEB-INF/views/group/group_newsfeed_list.jsp"/>
</div>
<div id="add_g_list" style="width: 70%;">

</div>
</c:if>
</div>


<div class="container">
  <!-- Trigger the modal with a button -->
  <!-- Modal -->
  <div class="modal fade" id="Modalaaa" role="dialog" aria-labelledby="myFullsizeModalLabel">
    <div class="modal-dialog modal-80size modal-center">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        	<!-- 여기에 모달 사진들어갑닌다. -->
        	<div id="v_result_div"> 
        	</div>
        	
<%--      	<jsp:include page="/WEB-INF/views/group/group_vote_result.jsp"></jsp:include>  --%>
        </div>
      	  <div class="modal-body">
        </div>
      </div>
    </div>
  </div>
</div>



<div class="container">
  <!-- Trigger the modal with a button -->
  <!-- Modal -->
  <div class="modal fade" id="Modalpho" role="dialog" aria-labelledby="myFullsizeModalLabel">
    <div class="modal-dialog modal-80size modal-center">
      <!-- Modal content-->
       <div class="modal-content" >
   <!--   <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        	여기에 모달 사진들어갑닌다.
        </div>  -->
        	
      	  <div class="modal-body">
        <img id="g_list_photo" src="image/bac.jpg" style="width: 100%;height: auto;">
        </div>
      </div> 
    </div>
  </div>
</div>



<div class="container">
  <!-- Trigger the modal with a button -->
  <!-- Modal -->
  <div class="modal fade" id="Modalvid" role="dialog" aria-labelledby="myFullsizeModalLabel">
    <div class="modal-dialog modal-lg modal-center">
      <!-- Modal content-->
      <div class="modal-content">
      <!--   <div class="modal-header">
    			<source id="md_video" src=""/>
			</video>
		
        </div> -->
      	  <div class="modal-body">
      	  <video id="g_list_video" controls autoplay src="" type="video/mp4"></video>
      	  
        </div>
      </div>
    </div>
  </div>
</div>


</body>
</html>