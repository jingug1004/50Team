<%@ page contentType="text/html; charset=UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="utf-8"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
video{
	width: 100%;
    height: auto;
}
</style>
<script>

$(document).ready(function(){
    $("#g_photo").click(function() {
    	$("#photoForm").attr({"target":"_self","action":"group_detail_photo.do"}).submit();
	});
    $("#g_video").click(function() {
    	$("#photoForm").attr({"target":"_self","action":"group_detail_photo_video.do"}).submit();
	});
    $(".videoclass").click(function() {
    	$("#md_video").attr("src",'');
    	$("#md_video").attr("src",$(this).attr("data-set"));
    }); 	
 
    
    
});
</script>


<!-- 헤더 -->
<div>
<div style="width: 100%;">
<jsp:include page="/WEB-INF/views/group/group_header.jsp"/>
</div>
<!-- 헤더 끝-->
<hr>
<div style="width: 100%;" class="table table-bordered">
		<table style="width: 100%;" class="table table-bordered">
			<tr>
			<td align="left">
			<form action="" id="photoForm" method="post">
			<input type="hidden" value="${g_make.g_seq }" name="g_seq" id="g_seq">
				<ul class="ulA">
					<li class="liA"><a href="#none" id="g_photo">사진</a>&nbsp;&nbsp;</li>
					<li class="liA"><b><a href="#none" id="g_video">동영상</a></b>&nbsp;&nbsp;</li>
				</ul>
			</form>
		
			
		</table>
		<c:if test="${!empty g_videolist}">	
			<table style="width: 100%;" class="table table-bordered">
				<tr>
				<c:forEach items="${g_videolist }" var="vlist" varStatus="i">
					<td style="width: 25%; height: 200px; margin-left: 5px; margin-right: 5px;" align="center" valign="middle">
					<a data-toggle="modal" data-target="#Modalvideo">
					<video  controls="controls" class="videoclass" data-set="upload/${vlist.nf_video }">
    					<source id="video${i.count }" src="upload/${vlist.nf_video }" type="video/mp4" />
					</video>
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
	<c:if test="${empty g_videolist}">	
	<tr><td>결과 없음</td></tr>
	</c:if>
	</div>
<!-- 뉴스피드 들어감 -->
</div>

<div class="container">
  <!-- Trigger the modal with a button -->
  <!-- Modal -->
  <div class="modal fade" id="Modalvideo" role="dialog" aria-labelledby="myFullsizeModalLabel">
    <div class="modal-dialog modal-lg modal-center">
      <!-- Modal content-->
      <div class="modal-content">
      <!--   <div class="modal-header">
    			<source id="md_video" src=""/>
			</video>
		
        </div> -->
      	  <div class="modal-body">
      	  <video id="md_video" controls autoplay src="" type="video/mp4"></video>
      	  
        </div>
      </div>
    </div>
  </div>
</div>


