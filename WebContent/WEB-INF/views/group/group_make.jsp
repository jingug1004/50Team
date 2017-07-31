<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- <html>
<head> -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- </head> -->
<script type="text/javascript">
$(document).ready(function() {
	$("#create").click(function() {
		$("#group_make_Form").attr({"target":"_self","action":"group_make.do"}).submit();
	});
});
</script>

<!-- <body> -->
<div style="width: 100%;">
<form action="group_make.do" method="post" id="group_make_Form">
	<input type="hidden" value="${login.m_id }" id="g_manager" name="g_manager">
	<table border="1" style="width: 100%;" class="table table-bordered">
		<thead>
			<tr>
				<th style="background-color: #3B5998;color: white;">새 그룹 만들기</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th>그룹 이름 입력</th>
			</tr>
			<tr>
				<td><input type="text" value="" name="g_name" id="g_name" style="width: 100%;"></td>
			</tr>
<!-- 			<tr>
				<th>사람 추가</th>
			</tr>
			<tr>
				<td><input type="text" value="" id="" name="" placeholder="이름 또는 이메일 주소 입력..." style="width: 100%;"></td>
			</tr> -->
			<tr>
				<th>공개 범위 선택</th>
			</tr>
			<tr>
				<td>
					<select name="g_type" id="g_type" style="width: 100%;" class="form-control">
						<option value="1">공개 그룹</option>
						<option value="2">비공개 그룹</option>
						<option value="3">비밀 그룹</option>
					</select>
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td>
				<button type="button" class="btn btn-default" data-dismiss="modal" style="width: 100px; height: 30px;">취소</button>
				<a href="#"><img id="create" alt="만들기" src="image/make.jpg" width="100px" height="30px"></a>
				</td>
			</tr>
		</tfoot>
	</table>
</form>
</div>
<!-- </body>
</html> -->