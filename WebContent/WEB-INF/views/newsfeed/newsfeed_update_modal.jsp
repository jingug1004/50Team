<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- header -->
<div class="modal-header">
짜잔~
<button type="button" class="close"  data-dismiss="modal">×</button>
</div>

<!-- body -->
<div class="modal-body">
  
<form name="frmForm2" id="_frmForm2" action="writeNewsFeed.do" method="post" enctype="multipart/form-data">
<input type="hidden" name="n_seq" value="${param.n_seq }">
<table class="ys_update_table${param.n_seq } table  table-condensed table-bordered " style="width: 100%" border="1px solid black">
	<tr>
		<td colspan="4">수정하세여</td>
	</tr>
	
 	<tr>
		<th width=300px; rowspan="2">프사사진</th>
		<td colspan="2">
			<textarea id="ta2" name="n_content" style="overflow: hidden">${param.n_content }</textarea>
				
			<c:if test="${param.file_name ne ''}">
				<div id="nowImage${param.n_seq }">
				<img alt="이미지없음" src="upload/${param.file_name }" width="200px" height="200px" >
				<i class="fa fa-times" aria-hidden="true" onclick="deleteArea('nowImage${param.n_seq }')"></i>
				</div>
				<br>
			</c:if>
			
				<div id="field_2" ></div>
				
				<div id="nowWhere_2${param.n_seq }">
				<c:if test="${param.n_tag_where ne ''}">
					${param.n_tag_where}&nbsp;에서&nbsp;&nbsp;<i class="fa fa-times" aria-hidden="true" onclick="deleteArea('nowWhere_2${param.n_seq }')"></i>
				</c:if>
				</div>
				
				<div id="nowFriend_2${param.n_seq }" >
				<c:if test="${param.n_tag_friend ne ''}">				
					${param.n_tag_friend}&nbsp;
					님과 함께&nbsp;&nbsp;<i class="fa fa-times" aria-hidden="true" onclick="deleteArea('nowFriend_2${param.n_seq }')"></i>
				</c:if>
				</div>	

				<div id="nowFeel_2${param.n_seq }">
				<c:if test="${param.n_tag_feel ne ''}">
				<input type='hidden' name='n_tag_feel' value="${param.n_tag_feel }">
					&nbsp;&nbsp;&nbsp;나는 지금
					<c:choose>
						<c:when test="${param.n_tag_feel eq 1}"><strong>기뻐요</strong><img src="image/happy.jpg" width="5px" height="5px"></c:when>
						<c:when test="${param.n_tag_feel eq 2}"><strong>슬퍼요</strong><img src="image/sad.jpg"></c:when>
						<c:otherwise><strong>피곤해요</strong><img src="image/tired.jpg"></c:otherwise>
					</c:choose>
					<i class="fa fa-times" aria-hidden="true" onclick="deleteArea('nowFeel_2${param.n_seq }')"></i>
				</c:if>	
				</div>	
		</td>
	</tr> 
	
	<tr id="friend_2${param.n_seq }" style="display:none;">
		<th>함께한 친구</th>
		<td colspan="2"><input type ="text" id="_friend_2${param.n_seq }" name="n_tag_friend" onKeyDown="onKeyDown3(${param.n_seq });"  onclick="this.value=''"></td>
	</tr>

	
	<tr id="feel_2${param.n_seq }" style="display:none;">	
		<td colspan="2">
			 <div class="dropdown">
					  <ul class="dropdown-menuu">
					    <li onclick="getState2('기뻐요',${param.n_seq }); setState2('1',${param.n_seq })" value="1"><img src="image/happy.jpg">기뻐요</a></li>
					    <li onclick="getState2('슬퍼요',${param.n_seq }); setState2('2',${param.n_seq })" value="2"><img src="image/sad.jpg">슬퍼요</a></li>
					    <li onclick="getState2('피곤해요',${param.n_seq }); setState2('3',${param.n_seq })" value="3"><img src="image/tired.jpg">피곤해요</a></li>
					  </ul>
		 	 </div>
		</td>
	</tr>
	
	<tr id="where_2${param.n_seq }" style="display:none;">
				<th>장소</th>
					<td colspan="2"><input type ="text" id="_where_2${param.n_seq }" name="n_tag_where" onKeyDown="onKeyDown4(${param.n_seq });"  value="${param.n_tag_where }" onclick="this.value=''"></td>
	</tr>

	<tr> 
	<td colspan="4">
	
		<input type=file  name="fileloadd" id="image_2${param.n_seq }" style='display: none;'> 
		<img src='image/photo.jpg' name="_file2${param.n_seq }" id="_file2_2${param.n_seq }" border='0' onclick='hideAll2(${param.n_seq });'>


		&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="#none"><img src="image/tag.jpg" id="viewFriend_2${param.n_seq }" onclick="return false;"></a>
		&nbsp;&nbsp;&nbsp;&nbsp; 
		<a href="#none"> <img src="image/face.jpg" id="viewFeel_2${param.n_seq }" onclick="return false;"></a>
		&nbsp;&nbsp;&nbsp;&nbsp; 
		<a href="#none"> <img src="image/place.jpg" id="viewWhere_2${param.n_seq }" onclick="return false;"></a>
<input type='hidden' name='n_tag_feel' value="">

<%-- 


		&nbsp;&nbsp;&nbsp;&nbsp;
		<span  style="color:blue" class="fa fa-users fa-2x" id="viewFriend_2${param.n_seq }"  onclick="return false;"></span>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<span class="fa fa-smile-o fa-2x" id="viewFeel_2${param.n_seq }"  onclick="return false;"></span>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<span class="fa fa-map-marker fa-2x"  id="viewWhere_2${param.n_seq }"  onclick="return false;"></span>
 --%>
	</td>

	</tr>
</table>

</form>
</div>
<!-- Footer -->
<div class="modal-footer">
  <button type="button" class="btn btn-default"  id="update_2"  onclick="finish()" >수정완료</button>
</div>

<script type="text/javascript">
 var a ="";
 var countDiv=1;
 
$("#viewFriend_2${param.n_seq }").click(function() {
	  status = $("#friend_2${param.n_seq }").css("display");
	  if (status == "none") {
			$("#friend_2${param.n_seq }").show();
			$("#where_2${param.n_seq }").hide();
			$("#feel_2${param.n_seq }").hide();
	  }
	  else {
			$("#friend_2${param.n_seq }").hide();
	  }
});
 
$("#viewFeel_2${param.n_seq }").click(function() {
	  status = $("#feel_2${param.n_seq }").css("display");
	  if (status == "none") {
			$("#friend_2${param.n_seq }").hide();
			$("#where_2${param.n_seq }").hide();
			$("#feel_2${param.n_seq }").show();
	  }
	  else {
			$("#feel_2${param.n_seq }").hide();
	  }
});
 
$("#viewWhere_2${param.n_seq }").click(function() {
	  status = $("#where_2${param.n_seq }").css("display");
	  if (status == "none") {
			$("#friend_2${param.n_seq }").hide();
			$("#where_2${param.n_seq }").show();
			$("#feel_2${param.n_seq }").hide();
	  }
	  else {
			$("#where_2${param.n_seq }").hide();
	  }
});
 
function hideAll2(seq){
	 $("#friend_2"+seq).hide();
	  $("#feel_2"+seq).hide();
	  $("#where_2"+seq).hide();
}
function getState2(val,seq) {

	$("#nowFeel_2"+seq).css("display","");
	$("#nowFeel_2"+seq).text("");
	$("#nowFeel_2"+seq).text("나는지금  "+val);
	$("#nowFeel_2"+seq).append("&nbsp;&nbsp;<i class='fa fa-times' aria-hidden='true' onclick=\"deleteArea('nowFeel_2"+seq+"')\"></i>"); 

}

function setState2(val,seq){
	$("#nowFeel_2"+seq).append("<input type='hidden' name='n_tag_feel' value="+val+">");
}

function onKeyDown3(seq)
{
     if(event.keyCode == 13)
     {
		status = $("#nowFriend_2"+seq).css("display");
		$("#nowFriend_2"+seq).show();
		if (status == "none") {
			$("#nowFriend_2"+seq).text("");
	  		$("#nowFriend_2"+seq).prepend($("#_friend_2"+seq).val()+"&nbsp;&nbsp;님과 함께 <i class='fa fa-times' aria-hidden='true' onclick=\"deleteArea('nowFriend_2"+seq+"')\"></i>");

		}else{
	  		$("#nowFriend_2"+seq).prepend($("#_friend_2"+seq).val()+",");
	    
    	}
     }
}

function onKeyDown4(seq)
{
     if(event.keyCode == 13)
     {
		status = $("#nowWhere_2"+seq).css("display");
		$("#nowWhere_2"+seq).show();
		if (status == "none") {
	
			$("#nowWhere_2"+seq).text("");
		    $("#nowWhere_2"+seq).text($("#_where_2"+seq).val()+"에서");
			$("#nowWhere_2"+seq).append("&nbsp;&nbsp;<i class='fa fa-times' aria-hidden='true' onclick=\"deleteArea('nowWhere_2"+seq+"')\"></i>"); 

		}else{
		
			$("#nowWhere_2"+seq).text("");
		    $("#nowWhere_2"+seq).text($("#_where_2"+seq).val()+"에서");
			$("#nowWhere_2"+seq).append("&nbsp;&nbsp;<i class='fa fa-times' aria-hidden='true' onclick=\"deleteArea('nowWhere_2"+seq+"')\"></i>"); 

		}
     }
}

function deleteArea2(val){
	$("#"+val+"_2").hide();
}

$(function() {
	  $("#ta2").keyup(function () {
	    $(this).css("height","5px").css("height",(20+$(this).prop("scrollHeight"))+"px");
	  });
	});

 $('#image_2').on('change', function() {
	   
    ext = $(this).val().split('.').pop().toLowerCase(); //확장자
    
    if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg','mp4']) == -1) {
        resetFormElement($(this)); //폼 초기화
        window.alert('파일 업로드 할 수 없습니다. 파일은 gif, png, jpg, jpeg 만 가능합니다.');
    } else { 
    	$("#image_preview2_2").css("display","");
        file = $('#image_2').prop("files")[0];
        blobURL = window.URL.createObjectURL(file);
     //   alert("blobURL=="+file.name);
        
       	a = a+file.name +",";	//업로드파일이름
     //   alert("a="+a);
        
        $('#image_preview_2 img').attr('src', blobURL);
        $('#image_preview_2').slideDown(); //업로드한 이미지 미리보기 
        $('#image_preview2_2').slideDown(); 
        $(this).slideUp(); //파일 양식 감춤
      
        
   } 
});
 $('#image2_2').on('change', function() {
	   
	    ext = $(this).val().split('.').pop().toLowerCase(); //확장자
	    
	    if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg','mp4']) == -1) {
	        resetFormElement($(this)); //폼 초기화
	        window.alert('파일 업로드 할 수 없습니다. 파일은 gif, png, jpg, jpeg 만 가능합니다.');
	    } else { 
	    	add_div2();
	    	$("#image_preview2_2").css("display","");
	        file = $('#image2_2').prop("files")[0];
	        blobURL = window.URL.createObjectURL(file);
	    //    alert("blobURL=="+file.name);
	        
	       	a = a+file.name +",";	//업로드파일이름
	    //    alert("a="+a);
	        
	        $('#image_preview_2 img').attr('src', blobURL);
	        $('#image_preview_2').slideDown(); //업로드한 이미지 미리보기 
	        $('#image_preview2_2').slideDown(); 
	        $(this).slideUp(); //파일 양식 감춤
	   } 
	});

 

 $('#image_preview_2 a_2').bind('click', function() {
    resetFormElement($('#image_2')); //전달한 양식 초기화
    $(this).parent().slideUp(); //미리 보기 영역 감춤
    $('#image_preview2_2').slideUp(); 
    return false; //기본 이벤트 막음
});
    

function resetFormElement(e) {
    e.wrap('<form>').closest('form').get(0).reset(); 
    e.unwrap(); //감싼 <form> 태그를 제거
}

function add_div2(){
 	 	var div = document.createElement('div');
    	div.innerHTML = document.getElementById('image_preview_2').innerHTML;
    	document.getElementById('field_2').appendChild(div); 
}

function remove_div2(obj){
	document.getElementById('field_2').removeChild(obj.parentNode);
}



$(function(){ 
   $("#_file2_2").click(function(){                    
        $("#image_2").click(); 
   }); 
}); 

$(function(){ 
	   $("#_file3_2").click(function(){                    
	        $("#image2_2").click(); 
	 	   
	       });
	});
	
function finish(){
 	if($("#ta2").val()==""){
		alert("본문 텍스트 작성은 필수입니다!!!!!!!!!");
	}
	else{
	  
	/*    alert($("#_frmForm2").serialize()); */
	   $("#_frmForm2").attr({"target":"_self", "action":"updateNewsFeed.do"}).submit();
	}
}

</script>