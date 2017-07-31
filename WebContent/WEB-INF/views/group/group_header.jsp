<%@ page contentType="text/html; charset=UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:requestEncoding value="utf-8" />
<style>
.div_header {
	position: relative;
}

.bottomright {
	position: absolute;
	bottom: 8px;
	right: 16px;
	font-size: 18px;
}

.bottomleft {
	position: absolute;
	bottom: 0px;
	left: 16px;
}

.center {
	position: absolute;
	left: 0;
	top: 40%;
	width: 100%;
	text-align: center;
	font-size: 12pt;
	
}
.topright {
    position: absolute;
    top: 8px;
    right: 16px;
    font-size: 18px;
}
.dropdown {
    position: relative;
    display: inline-block;
}

 .dropdown-content {
    display: none;
    position: absolute;
    padding-left: 22px; 
} 

.dropdown:hover .dropdown-content {
    display: block;
}

.img_group_flower{
	position: absolute;
	top: -20px;
	left: 340px;
}
.img_group_zombie{
	position: absolute;
	top: -110px;
	left: 170px;
}
.m_profile{
	width: 100px;
	height: 100px;
}
</style>
<form action="" id="fileForm" method="post" enctype="multipart/form-data">
	<input type="file" id="fileupload" name="fileload">
	<input type="hidden" value="${g_make.g_seq }" name="g_seq" id="g_seq">
</form>


<div style="width: 100%;">
	<div>
		<div class="div_header table table-bordered" style="width: 100%; height: 250px; margin-bottom: 0px; margin-top: 0px;background-color: #ffc0cf" >
		<!-- 1.그룹 가입여부에따른 다른 창 보여줄예정(조건문 걸기) -->
			<div class="center" >
				<c:if test="${g_make.g_photo eq null ||g_make.g_photo eq ''}">
					<div>
						<c:if test="${g_make.g_manager eq login.m_id}">
							<div align="center">
								<span class="img_group_zombie"><img alt="사진" src="image/Zombie_ani.gif" height="200px"></span>
								<span class="img_group_flower"><img alt="facebookimg.png" src="image/facebookimg.png"></span>
								<span>
									<h6>그룹의 개성을 가장 잘 나타내는 사진을 한 장 고르세요.</h6>
									<img id="filesearch" alt="사진" src="image/upload_g_back.png">
								</span>
							</div>
						</c:if>
					</div>	
				</c:if>
			</div>
			<c:if test="${!empty g_make.g_photo}">
				<div id="group_heder">
					<img alt="배경" src="upload/${g_make.g_photo}" style="width: 100%; height: 250px;" >
					<div class="topright">
						<c:if test="${g_make.g_manager eq login.m_id}">
						<a href="#"><img id="changeImage" src="image/group_change.jpg" alt="사진변경"/></a>
						</c:if>
					</div>
				</div>
			</c:if>
			<!-- 1.여기까지 -->
			<div class="bottomleft">
				<h4>
					<a href="group_detail.do?g_seq=${g_make.g_seq }">${g_make.g_name}</a>
				</h4>
				<c:if test="${g_make.g_type eq 1}">
					<h5>
						<a href="#none">공개 그룹</a>
					</h5>
				</c:if>
				<c:if test="${g_make.g_type eq 2}">
					<h5>
						<a href="#none">비공개 그룹</a>
					</h5>
				</c:if>
				<c:if test="${g_make.g_type eq 3}">
					<h5>
						<a href="#none">비밀 그룹</a>
					</h5>
				</c:if>
			</div>
			<div class="bottomright">
				<c:if test="${g_key eq true}">
					<div class="dropdown">
						<img alt="가입함" src="image/already_join.jpg">
						<div class="dropdown-content">
							<a href="#"><img id="g_out" alt="그룹 나가기" src="image/group_out.jpg"></a>
						</div>
					</div>
				</c:if>
				<c:if test="${g_key ne true}">
					<a href="#"><img id="join_group" alt="가입하기" src="image/group_join.jpg"></a>
				</c:if>
			</div>
		</div>
	</div>
	<div>
		<div style="width: 100%; margin-left: 10px; margin-top: 4px;" class="table table-bordered" align="left">
			<form action="" method="post" id="_frmForm">
			<input type="hidden" value="${g_make.g_seq }" name="g_seq" id="g_seq">
				<h5>
				<button id="debate"  class="btn btn-danger">토론</button>
				<button id="member"  class="btn btn-danger">멤버</button>
				<!-- <button id="event"  class="btn btn-danger">이벤트</button> -->
				<button id="photo"  class="btn btn-danger">사진</button>
				<button id="file"  class="btn btn-danger">파일</button>
				<c:if test="${g_make.g_manager eq login.m_id}">
				<button id="request"  class="btn btn-danger">가입요청</button>
				</c:if> 
				</h5>
			</form>
		</div>
	</div>
	<!-- 
	<div style="width: 40%; float: left; border: 1px solid black;">
	<input type="text" placeholder="이 그룹 검색" value="">
	<button>검색</button>
	</div>
	 -->
</div>

<script type="text/javascript">
$(document).ready(function() {
	$("#debate").click(function() {
		$("#_frmForm").attr({"target":"_self","action":"group_detail.do"}).submit();
	});
	$("#member").click(function() {
		$("#_frmForm").attr({"target":"_self","action":"group_detail_member.do?type=1&keyword="}).submit();
	});	
	$("#event").click(function() {
		$("#_frmForm").attr({"target":"_self","action":"group_detail_event.do"}).submit();
	});	
	$("#photo").click(function() {
		$("#_frmForm").attr({"target":"_self","action":"group_detail_photo.do"}).submit();
	});	
	$("#file").click(function() {
		$("#_frmForm").attr({"target":"_self","action":"group_detail_flie.do"}).submit();
	});	
	$("#request").click(function() {
		$("#_frmForm").attr({"target":"_self","action":"group_detail_request.do"}).submit();
	});	
	
	$("#fileupload").hide();
	
	$("#filesearch").click(function() {
		$("#fileupload").trigger("click");	
	});
	$("#changeImage").click(function() {
		$("#fileupload").trigger("click");	
	});
	$("#fileupload").change(function() {
		/* $.ajax({url: "group_main_image.do", success: function(result){ */
			
			var file = $("#fileupload").val();
				
			var pos = file.lastIndexOf( "." );
			var fileExt = file.substring( pos + 1 );
			/* fileExt.toLowerCase(); */
			fileExt = fileExt.toLowerCase();
		
			if (fileExt == "jpg" ||fileExt == "gif" || fileExt == "jpeg" || fileExt == "png" || fileExt == "bmp"  ) {
				$("#fileForm").attr({"target":"_self","action":"group_main_image.do"}).submit(); 
			}else{
				alert("제대로된 파일좀 올려줘");
			}
	});
	$("#changeImage").hide();	
		
	$("#group_heder").mouseover( function() {
		$("#changeImage").show();
	});
	
	$("#group_heder").mouseout(function() {
		$("#changeImage").hide();
	});
	
});
$("#join_group").click(function() {
	/* alert("클릭"); */
	var g_seq = $("#g_seq").attr("value");
	var m_id = $("#g_id").attr("value");
	var g_manager = $("#gmanager").attr("value");
	 $.ajax({
		 type:"POST",
			url: "group_join_request.do?g_seq="+g_seq+"&g_manager="+g_manager+"&m_id="+m_id,
		 success: function(result){
			/* alert(result); */
		 	$("#join_group").attr('src','image/request.jpg'); 
	    }, error: function(){
	    	alert(result);
	    }
	}); 
});

$("#g_out").click(function() {
	var g_seq = $("#g_seq").attr("value");
	var m_id = $("#g_id").attr("value");
	
	$("#g_outForm").attr({"target":"_self","action":"group_out.do?g_seq="+g_seq+"&m_id="+m_id}).submit();
	
});
</script>
<form action="" method="post" id="g_outForm">
<input type="hidden" value="${login.m_id }" id="g_id">
<input type="hidden" value="${g_make.g_manager }" id="gmanager">
</form>
