<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:requestEncoding value="utf-8"/>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	
</table>
<table style="width: 100%;">
	<col width="20%"><col width="80%">
	<tr>
		<td></td><td><h2>정보</h2></td>
	</tr>
</table>
<div>
	<div style="float: left; width: 20%;">
		<table style="text-align: left;">
			<tr><td><a id="academic2">경력 및 학력</a></td></tr>
			<tr><td><a id="address2">거주했던장소</a></td></tr>
			<tr><td><a id="information2">연락처 및 기본 정보</a></td></tr>
			<tr><td><a id="marriage2">가족 및 결혼/연애 상태</a></td></tr>
			<tr><td><a id="content2">자세한 내 소개</a></td></tr>
		</table>
	</div>
	<div style="float: left; width: 80%;">
		<div id="_academic2"><jsp:include page='modify_academic.jsp' flush='false' /></div>
		<div id="_address2"><jsp:include page='modify_address.jsp' flush='false' /></div>
		<div id="_content2"><jsp:include page='modify_content.jsp' flush='false' /></div>
		<div id="_information2"><jsp:include page='modify_information.jsp' flush='false' /></div>
		<div id="_marriage2"><jsp:include page='modify_marriage.jsp' flush='false' /></div>
	</div>

</div>



<script type="text/javascript">
$('#_address2').hide();
/* $('#_academic2').hide(); */
$('#_content2').hide();
$('#_information2').hide();
$('#_marriage2').hide();


$('#address2').click(function() {
	$('#_address2').show();
	$('#_academic2').hide();
	$('#_content2').hide();
	$('#_information2').hide();
	$('#_marriage2').hide();
});
$('#academic2').click(function() {
	$('#_address2').hide();
	$('#_academic2').show();
	$('#_content2').hide();
	$('#_information2').hide();
	$('#_marriage2').hide();
});
$('#information2').click(function() {
	$('#_address2').hide();
	$('#_academic2').hide();
	$('#_content2').hide();
	$('#_information2').show();
	$('#_marriage2').hide();
});
$('#marriage2').click(function() {

	$('#_address2').hide();
	$('#_academic2').hide();
	$('#_content2').hide();
	$('#_information2').hide();
	$('#_marriage2').show();
});
$('#content2').click(function() {
	$('#_address2').hide();
	$('#_academic2').hide();
	$('#_content2').show();
	$('#_information2').hide();
	$('#_marriage2').hide();
});

</script>

	
</body>
</html>