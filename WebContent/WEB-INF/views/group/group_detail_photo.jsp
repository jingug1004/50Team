<%@page import="sist.co.model.GroupPhotoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<fmt:requestEncoding value="utf-8"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
.container1 {
    position: relative;
}

.btnleft {
    position: absolute;
    bottom: 50%;
    left: 10px;
    font-size: 18px;
    opacity: 0.5;
}
.btnright {
	position: absolute;
	bottom: 50%;
	right: 10px;
	font-size: 18px;
	opacity: 0.5;
}

</style>
<script>
var str = new Array();
</script>
<c:forEach items="${g_photolist }" var="plist" varStatus="iist">
<script>
str.push("${plist.nf_photo}");
</script>
</c:forEach>
<script>
$(document).on('keydown','.modal',function(e){
	if(e.keyCode == 37)
	  {
	    $("#prebtn").click();
	  }
	if (e.keyCode == 39) {
		  $("#nextbtn").click();
	  }
});

$(document).ready(function(){
	var img_num = 0;
	var last_num= '${fn:length(g_photolist)}';
	last_num -= 1;
	
	$("#nextbtn").hide();
	$("#prebtn").hide();
	
    $("#g_photo").click(function() {
    	$("#photoForm").attr({"target":"_self","action":"group_detail_photo.do"}).submit();
	});
    $("#g_video").click(function() {
    	$("#photoForm").attr({"target":"_self","action":"group_detail_photo_video.do"}).submit();
	});
    $(".m_img").click(function() {
    	img_num = $(this).attr("data-set");
    	$("#m_photo").attr("src",$(this).attr("src"));
    	
	});
    
    $("#prebtn").click(function() {
		img_num--;
		if (img_num<=0) {
			img_num=0;
			$("#m_photo").attr("src","upload/"+str[img_num]);
		}else if (img_num>0) {
			$("#m_photo").attr("src","upload/"+str[img_num]);
		}
		
	});
	$("#nextbtn").click(function() {
		img_num++;
		if (img_num>=last_num) {
			img_num = last_num;
			$("#m_photo").attr("src","upload/"+str[img_num]);
		}else if (img_num<last_num) {
			$("#m_photo").attr("src","upload/"+str[img_num]);
		}
	});
	$("#m_photo").mouseover(function() {
		$("#nextbtn").show();
		$("#prebtn").show();
	});
	$("#m_photo").mouseout(function() {
		$("#nextbtn").hide();
		$("#prebtn").hide();
	});
	$("#nextbtn").mouseover(function() {
		$("#nextbtn").show();
		$("#prebtn").show();
	});
	$("#nextbtn").mouseout(function() {
		$("#nextbtn").hide();
		$("#prebtn").hide();
	});
	$("#prebtn").mouseover(function() {
		$("#nextbtn").show();
		$("#prebtn").show();
	});
	$("#prebtn").mouseout(function() {
		$("#nextbtn").hide();
		$("#prebtn").hide();
	});
    
});
</script>
</head>
<body>
<%-- <%
Object obj = request.getAttribute("g_photolist");
List<GroupPhotoDTO> plist = (List<GroupPhotoDTO>)obj;

for(int i=0;i<plist.size();i++){
	System.out.println(plist.get(i).getNf_photo());
}
%> --%>

<!-- 헤더 -->
<div>
<div style="width: 100%;">
<jsp:include page="/WEB-INF/views/group/group_header.jsp"/>
</div>
<!-- 헤더 끝-->
<hr>
<c:if test="${g_key eq true || g_make.g_type eq 1 }">
<div style="width: 100%;" class="table table-bordered">
		<table style="width: 100%;" class="table table-bordered">
			<tr>
			<td align="left">
			<form action="" id="photoForm" method="post">
			<input type="hidden" value="${g_make.g_seq }" name="g_seq" id="g_seq">
				<ul class="ulA">
					<li class="liA"><b><a href="#none" id="g_photo">사진</a></b>&nbsp;&nbsp;</li>
					<li class="liA"><a href="#none" id="g_video">동영상</a>&nbsp;&nbsp;</li>
				</ul>
			</form>
		</table>
	<c:if test="${!empty g_photolist}">	
		<table style="width: 100%;" class="table table-bordered">
		<tr>
		<c:forEach items="${g_photolist }" var="plist" varStatus="i">
				<td style="width: 25%;">
				<a data-toggle="modal" data-target="#ModalPhoto">
				<img class="m_img" style="width: 100px; height: 100px;" src="upload/${plist.nf_photo}" alt="이미지를 불러올 수 없습니다." data-set="${i.index }">
				</a>
				</td>
			<c:if test="${i.count%4 eq 0 }">
			</tr>
			<tr>
			</c:if>	
		</c:forEach>
		</tr>
		</table>
	</c:if>
	
	
	</div>
</c:if>
</div>
<!-- 모달 -->
<div class="container" >
  <!-- Trigger the modal with a button -->
  <!-- Modal -->
  <div class="modal fade" id="ModalPhoto" role="dialog" aria-labelledby="myFullsizeModalLabel">
    <div class="modal-dialog modal-80size modal-center">
      <!-- Modal content-->
      <div class="modal-content">
    <!--     <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        	여기에 모달 사진들어갑닌다.
		
        </div> -->
      	  <div class="modal-body" >
	      	<div class="container1">       
	        	<div class="btnleft"><img id="prebtn" style="width: 50px; height: 50px;" src="image/pre.png" alt="이전" ></div>
	        	<img src="" alt="사진" id="m_photo" style="width: 100%; height: auto;">
	       		<div class="btnright"><img id="nextbtn" style="width: 50px; height: 50px;" src="image/next.png" alt="다음"></div>
	      	</div>
        </div>
      </div>
    </div>
  </div>
</div>

</body>
</html>