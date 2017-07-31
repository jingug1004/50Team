<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.Calendar" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:requestEncoding value="UTF-8"/>

<!-- 날짜-시간 달력 Plugin -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-material-datetimepicker.css" />
<link href='http://fonts.googleapis.com/css?family=Roboto:400,500' rel='stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/material.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/moment-with-locales.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap-material-datetimepicker.js"></script>
<!-- // 날짜-시간 달력 Plugin -->

<%

Calendar cal = Calendar.getInstance();

int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH);
int day = cal.get(Calendar.DAY_OF_MONTH);

cal.set(year, month, 1);

pageContext.setAttribute("year", year);
pageContext.setAttribute("month", month);
pageContext.setAttribute("day", day);

%>

<style type="text/css">

.modal-header {
	color: white;
	background-color: #3B5998;
}

.tbl_event_write th {
	text-align: right;
	padding-right: 10px;
	padding-top: 15px;
	padding-bottom: 15px;
}

.tbl_event_write td {
	text-align: left;
}

</style>

<!-- 	Modal	 -->
<div class="modal fade" id="modal_event_write" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static">
<div class="modal-dialog" role="document">
<div class="modal-content">
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h4 class="modal-title" id="myModalLabel" style="font-weight: bold;">이벤트 만들기</h4>
</div>
<div class="modal-body">
	<form id="frm_event_write" action="event_write.do" method="POST" enctype="multipart/form-data">
		<table class="tbl_event_write" style="width: 100%;">
		<col style="width: 20%;" /><col style="width: 80%;" />
		<tr>
			<th>이벤트 사진</th>
			<td style="border: 1px solid #505050; border-radius: 2px; height: 200px;">
				<div id="image_wrap_before">
					
					<!-- 보류
					<span>
						<a href="#" id="title_image_choice" class="btn btn-default" 
						style="width: 50%; float: left; border-radius: 0px;">주제 선택</a>
					</span>
					-->
					
					<!-- 주제 선택 구현 시 'width: 50%'로 변경 필요 -->
					<span>
						<a href="#" id="image_upload" class="btn btn-success" 
						style="width: 100%; border-radius: 0px;">사진 업로드</a>
						<!-- 파일 업로드 버튼 '찾아보기' 숨김 -->
						<input type="file" id="btn_image_upload" name="image_name" accept="image/*" />
					</span>
					<br/>
					<div id="img_slide">
						<div style="margin: 10px auto; color: #909090;">추천 주제</div>
						
						<!-- 주제 이미지 슬라이드 -->
						<div id="myCarousel" class="carousel slide">
							<!-- 이미지 리스트 -->
							<div class="carousel-inner">
								<jsp:include page="event_title_image_list.jsp" />
							</div>
							<!-- 이미지 전환(좌/우) -->
							<a class="carousel-control left" href="#myCarousel" data-slide="prev" 
							style="padding-top: 70px; font-size: 30pt;">&lsaquo;</a>
							<a class="carousel-control right" href="#myCarousel" data-slide="next" 
							style="padding-top: 70px; font-size: 30pt;">&rsaquo;</a>
						</div>
						<!-- // 주제 이미지 슬라이드 -->
					</div>
				</div>
				<div id="image_wrap_after">
					<!-- 이미지 취소 버튼, 기본 상태: 숨김 -->
					<span>
						<input type="image" id="btn_title_image_delete" src="image/event/btn_close.png" alt="왜죠"
						onclick="return false"
						style="position: absolute; top: 20px; right: 30px; border: none;"/>
					</span>
					
					<img id="user_image" style="width: 100%; height: 200px;"/>
					
				</div>
			</td>
		</tr>
		
		<tr>
			<th>이벤트 이름</th>
			<td>
				<input type="text" id="event_name" name="e_title" class="form-control frm_event_write" 
				maxlength="50" placeholder="간결하고 명확한 이름을 추가하세요" />
			</td>
		</tr>
		
		<tr>
			<th>장소</th>
			<td>
				<input type="text" id="e_location" name="e_location" class="form-control frm_event_write" 
				maxlength="100" placeholder="장소 또는 주소를 포함하세요" />
			</td>
		</tr>
		
		<tr>
			<th id="event_date_time">날짜/시간</th>
			<td>
				<input type="text" id="start_date" class="form-control" readonly="readonly"
				placeholder="시작 날짜" style="width: 140px; margin-right: 5px; 
				display: inline-block; background-color: white; cursor: pointer;" />
				
				<div style="display: inline-block; margin-top: 6px; float: right;">
					<a href="#" id="end_date_add" onclick="return false;">+ 종료 시간</a>
				</div>
			</td>
		</tr>
		
		<!-- 기본 상태: 숨김 -->
		<tr id="date_end">
			<th>종료</th>
			<td>
				<input type="text" id="end_date" class="form-control" readonly="readonly"
				placeholder="종료 날짜" style="width: 140px; margin-right: 5px; 
				display: inline-block; background-color: white; cursor: pointer;" />
				
				<div style="display: inline-block; margin-top: 6px; float: right;">
					<a href="#" id="end_time_delete" onclick="return false;">삭제</a>
				</div>
			</td>
		</tr>
		
		<tr>
			<th>설명</th>
			<td>
				<textarea rows="3" id="e_content" name="e_content" class="form-control" maxlength="1000"
				placeholder="이벤트에 대해 자세히 알려주세요" style="resize: none;"></textarea>
			</td>
		</tr>
		</table>
		
		<input type="hidden" id="e_seq" name="e_seq" />
		<input type="hidden" id="m_id" name="m_id" />
		<input type="hidden" id="m_name" name="m_name" />
		<input type="hidden" id="e_image" name="e_image" />
		<input type="hidden" id="e_start_date" name="e_start_date" />
		<input type="hidden" id="e_end_date" name="e_end_date" />
		
	</form>
</div>
<div class="modal-footer">
	<!-- <button type="button" id="event_test" class="btn btn-default">테스트</button> -->
	<button type="button" id="event_close" class="btn btn-default" data-dismiss="modal">닫기</button>
	<button type="button" id="event_write" class="btn btn-primary">이벤트 만들기</button>
</div>
</div>
</div>
</div>
<!--  // Modal	 -->

<input type="hidden" id="event_work" />

<!--		script			-->
<!--		▼ ▼ ▼ ▼			-->
<script type="text/javascript">
// 테스트용
/* 
$('#event_test').click(function() {
});
*/

$(document).ready(function () {
	
	/*		'이벤트 만들기'로 이벤트 모달을 오픈할 경우 처리		*/
	$('#event_write_form').click(function() {
		$('#frm_event_write').attr('action', 'event_write.do');
		$('.modal-header').css('background-color', '#3B5998');
		$('#myModalLabel').text("이벤트 만들기");
		$('#event_write').text("이벤트 만들기");
	});
	/*	 // '이벤트 만들기'로 이벤트 모달을 오픈할 경우 처리		*/
	
	/*		'이벤트 수정하기'로 이벤트 모달을 오픈할 경우 처리		*/
	$('#event_update').click(function() {
		$('#frm_event_write').attr('action', 'event_update.do');
		$('#myModalLabel').text("이벤트 수정하기");
		$('.modal-header').css('background-color', '#D9534F');
		$('#event_write').text("이벤트 수정하기");
		$('#event_name').val('${ event.e_title }');
		$('#e_location').val('${ event.e_location }');
		$('#start_date').val('${ event.e_start_date }');
		$('#end_date').val('${ event.e_end_date }');
		$('#e_content').val('${ event.e_content }');
	});
	/*	 // '이벤트 수정하기'로 이벤트 모달을 오픈할 경우 처리		*/
	
	// 이벤트 만들기 팝업 초기 설정
	$('#event_write_form').click(function() {
		// 이벤트 제목 커서 이동
		setTimeout( function() { $('#event_name').focus(); }, 500);
		
		// 모든 입력 값 초기화
		$('#frm_event_write file').val('');
		$('#frm_event_write input').val('');
		$('#frm_event_write textarea').val('');
	});
	
	/*		기본 환경설정		*/
	
	$('#date_end').hide();
	$('.carousel').carousel({ interval: false });
	$('#btn_image_upload').hide();
	$('#image_wrap_after').hide();
	
	/* 	 // 기본 환경설정 		*/
	
	// 추천 이미지 클릭
	$('.title_image').click(function() {
		
		var selectImg = $(this).attr('src');
		
		$('#img_slide').hide();
		$('#image_wrap_before').hide();
		
		$('#user_image').attr('src', selectImg);
		$('#image_wrap_after').show();
		
		$('#e_image').val(selectImg);
	
	});
	
	// 사진 업로드 버튼 클릭
	$('#image_upload').click(function() {
		$('#btn_image_upload').click();
	});

	// 업로드 파일 확장자 검사 & 미리보기
	$('#btn_image_upload').change(function() {
		
		var fileName = $(this).val();
		var lastIdx = fileName.lastIndexOf('.');
		var extentionName = fileName.substring(lastIdx + 1, fileName.length);
		extentionName = extentionName.toLowerCase();
		
		if ( extentionName == '' ) {
			return false;
		} else if (	extentionName != "jpg"
				&& 	extentionName != "jpeg"
				&& 	extentionName != "bmp"
				&& 	extentionName != "gif"
				&& 	extentionName != "png" ) {
			
			alert("지원하지 않는 확장자 입니다." + "\n" + "※ 지원가능한 확장자(jpg, jpeg, bmp, gif, png)");
			$('#btn_image_upload').val('');
			
		} else {
			$('#img_slide').hide();
			$('#image_wrap_before').hide();
			
			// 선택한 파일의 '가상의 웹 경로' 생성
			var file = $('#btn_image_upload').prop("files")[0];
	        var fileURL = window.URL.createObjectURL(file);
			
			$('#user_image').attr('src', fileURL);
			$('#image_wrap_after').show();
		}
	});
	
	// 사진 업로드 취소 버튼 클릭
	$('#btn_title_image_delete').click(function() {
		$('#btn_image_upload').val('');
		$('#user_image').attr('src', '');
		$('#e_image').val('');
		
		$('#image_wrap_after').hide();
		$('#img_slide').show();
		$('#image_wrap_before').show();
	});
	
	/*		날짜-시간		  */
	
	$('#end_date').click(function() {
		var startDate = $('#start_date').val();
		
		if ( startDate == '' ) {
			alert("시작 날짜부터 설정해주세요.");
			$('#start_date').focus();
		}
	});
	
	
 	$('#start_date').bootstrapMaterialDatePicker(
		{ weekStart : 0, format : 'YYYY-MM-DD HH:mm', minDate : new Date() } 
		).on('change', function(e, date) {
			 $('#end_date').bootstrapMaterialDatePicker( 
				{ weekStart : 0, format : 'YYYY-MM-DD HH:mm', minDate : date }
			); 
		});
	
	// 종료 시간 추가 클릭
	$('#end_date_add').click(function () {
		$('#event_date_time').text("시작");
		$('#end_date_add').hide();
		$('#date_end').show();
	});

	// 종료 시간 삭제 클릭
	$('#end_time_delete').click(function () {
		$('#event_date_time').text("날짜/시간");
		$('#date_end').hide();
		$('#end_date_add').show();
		$('#end_date').val('');
	});
	
	/*		// 날짜-시간 		  */
	
	var eventSeq = '${ event.e_seq }';
	
	// 이벤트 만들기 버튼 클릭
	$('#event_write').click(function() {
		
		// 필수항목 입력 체크
		var confirm = confirmInput();
		
		if ( confirm ) {
			// 작성자 저장 ※ form이 multi 방식으로 인코딩 되기 때문에 hidden으로 값을 넘겨줄 수 없음
			$('#m_id').val('${ login.m_id }');
			$('#m_name').val('${ login.m_name }');
			$('#e_seq').val(0);
			
			var btnInsert = $('#event_write').text();
			
			if ( btnInsert == '이벤트 수정하기' ) {
				$('#e_seq').val(eventSeq);
			}
			
			// 위치 값이 공백이면 '위치 없음'으로 저장
			var location = $('#e_location').val();
			
			if ( location.trim() == '' ) {
				$('#e_location').val('위치 없음');
			}
			
			/*		날짜-시간 값 변환 & 저장		*/
			var sDate = $('#start_date').val();
			var eDate = $('#end_date').val();
			
			sDate = sDate.replace(' ', '-');
			sDate = sDate.replace(':', '-');
			
			if ( eDate != '' ) {
				eDate = sDate.replace(' ', '-');
				eDate = sDate.replace(':', '-');
			}
			
			$('#e_start_date').val(sDate);
			$('#e_end_date').val(eDate);
			
			/*	 // 날짜-시간 값 변환 & 저장		*/
			
			// 전송
			$('#frm_event_write').submit();
			$('#event_close').click();
		}
	});
});

/*			function		*/
/*			▼ ▼ ▼ ▼			*/
function confirmInput() {
	var inputEvtTitle = $('#event_name').val();
	var inputEvtDate = $('#start_date').val();
	var inputEvtContent = $('#e_content').val();
	
	if ( inputEvtTitle == '' ) {
		$('#event_name').focus();
		alert("이벤트 이름을 입력해주세요.");
		
		return false;
		
	} else if ( inputEvtDate == '' ) {
		alert("이벤트 날짜를 입력해주세요.");
		
		return false;
		
	} else if ( inputEvtContent == '' ) {
		$('#e_content').focus();
		alert("이벤트 내용을 입력해주세요.");
		
		return false;
	}
	
	return true;
}

</script>
