<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form id="fileup" method="post" enctype="multipart/form-data">
	<div id="image_preview">
	<img  src="upload/${login.m_profile}" alt="사진없음" class="img-thumbnail" width="150px" height="150px">
	<br />
		<div>
		<a href="#" onclick="modify_img()" class="btn btn-success">수정</a>
		<input type="hidden" value="member_basic.jpg" name="m_profile" id = "_m_profile">
		</div>
		
		<button type="button" class="btn btn-success" onclick="modify_profile()" id="_add_profile2">삭제</button>
		<button type="button" class="btn btn-success" onclick="modify_profile()" id="_add_profile1">확인</button>

		<div id="_file">	
		<label for="image">
			<input type=file name="fileload_j" id="image" >
			<input type="hidden" name="m_id" id="_id" value="${login.m_id}">
		</label>
		</div>
		</div>
	</form>


<script type="text/javascript">

$('#_add_profile1').hide();
$('#_add_profile2').hide();
function modify_img() {
	$("#_file").show();
	$("#_add_profile2").show();
	$("#_add_profile1").hide();
}


$('#image').on('change', function() {
    
    ext = $(this).val().split('.').pop().toLowerCase(); //확장자
    
    //배열에 추출한 확장자가 존재하는지 체크
    if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
        resetFormElement($(this)); //폼 초기화
        window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
    } else {
        file = $('#image').prop("files")[0];
		
        blobURL = window.URL.createObjectURL(file);
        $('#image_preview img').attr('src', blobURL);
        $('#image_preview').slideDown(); //업로드한 이미지 미리보기 
        
        $('#_add_profile2').hide();
        $('#_add_profile1').show();
       $(this).slideUp(); //파일 양식 감춤 
    }
});

 $('#image_preview a').bind('click', function() {
    resetFormElement($('#image')); //전달한 양식 초기화
    $('#image').slideDown();

    $('#image_preview img').attr('src', 'upload/${login.m_profile}');

    //$(this).parent().slideUp(); //미리 보기 영역 감춤 */
    return false; //기본 이벤트 막음
});
    

/** 
* 폼요소 초기화 
* Reset form element
* 
* @param e jQuery object
*/
/* function resetFormElement(e) {
    e.wrap('<form>').closest('form').get(0).reset(); 
    //리셋하려는 폼양식 요소를 폼(<form>) 으로 감싸고 (wrap()) , 
    //요소를 감싸고 있는 가장 가까운 폼( closest('form')) 에서 Dom요소를 반환받고 ( get(0) ),
    //DOM에서 제공하는 초기화 메서드 reset()을 호출
    e.unwrap(); //감싼 <form> 태그를 제거
} */

function modify_profile() {

	$("#_add_profile").hide();
	$("#fileup").attr({"target":"_self", "action":"change_m_profile.do"}).submit();
	
}







</script>
</body>
</html>