<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<fmt:requestEncoding value="UTF-8"/>

<link rel="stylesheet" type="text/css" href="css/jquery.mCustomScrollbar.css"/>
<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>

<style type="text/css">

.title_image_wrap {
	/* position: relative; */
	width: 200px;
}

.title_image {
	width: 150px;
	max-height: 100px;
}

.tbl_event_day_list {
	width: 100%;
	border-radius: 20px;
}

.tbl_event_day_list td {
	 padding: 5px;
}

.tbl_event_day_list tr {
	border-bottom: 1px solid #AAA;
	border-radius: 20px;
}

</style>

<jsp:useBean id="calUtil" class="sist.co.util.CalendarUtil" />

<c:if test="${ !empty eventDayList }">
	<div align="left"><i class="fa fa-pencil" aria-hidden="true"></i>&nbsp;내가 주최한 이벤트</div>
	
	<br/>
	
	<div class="mCustomScrollbar" data-mcs-theme="minimal-dark">
		<table class="tbl_event_day_list">
		<col style="width: 30%;"><col style="width: 70%;">
		<c:forEach var='event' items='${ eventDayList }'>
		<tr>
			<td style="text-align: left;">
				<!-- 타이틀 이미지 -->
				<c:choose>
				<c:when test="${ empty event.e_image }">
					<img src="image/event/event_title_no.jpg" class="title_image" />
				</c:when>
				
				<c:when test="${ fn:substring(event.e_image, 0, 12) == 'image/event/' }">
					<img src="${ event.e_image }" class="title_image" />
				</c:when>
				
				<c:otherwise>
					<img src="upload/${ event.e_image }" class="title_image" />
				</c:otherwise>
				</c:choose>
			</td>
			<td style="vertical-align: top;">
				<!-- 날짜 -->
				<div class="event_date" align="left" style="font-size: 10pt; font-weight: 800;">
					${ fn:substring(event.e_start_date, 0, 4) }년
					${ calUtil.toOne(fn:substring(event.e_start_date, 5, 7)) }월
					${ calUtil.toOne(fn:substring(event.e_start_date, 8, 10)) }일
					${ calUtil.toOne(fn:substring(event.e_start_date, 11, 13)) }시
					${ calUtil.toOne(fn:substring(event.e_start_date, 14, 16)) }분
					
					<c:if test="${ !empty event.e_end_date }">
						&nbsp;~&nbsp;
						${ fn:substring(event.e_end_date, 0, 4) }년
						${ calUtil.toOne(fn:substring(event.e_end_date, 5, 7)) }월
						${ calUtil.toOne(fn:substring(event.e_end_date, 8, 10)) }일
						${ calUtil.toOne(fn:substring(event.e_end_date, 11, 13)) }시
						${ calUtil.toOne(fn:substring(event.e_end_date, 14, 16)) }분
					</c:if>
				</div>
				
				<br/>
				
				<!-- 이벤트 이름 -->
				<div class="event_title" align="left">
					<a href="event_detail.do?seq=${ event.e_seq }">${ event.e_title }</a>
				</div>
			</td>
		</tr>
		</c:forEach>
		</table>
	</div>
</c:if>

<br/>

<c:if test="${ !empty eventInviteList }">
	<div align="left"><i class="fa fa-envelope" aria-hidden="true"></i>&nbsp;초대 받은 이벤트</div>
	
	<br/>
	
	<div>
		<table class="tbl_event_day_list">
		<col style="width: 30%;"><col style="width: 70%;">
		<c:forEach var='event' items='${ eventInviteList }'>
		<tr>
			<td>
				<!-- 타이틀 이미지 -->
				<c:choose>
				<c:when test="${ empty event.e_image }">
					<img src="image/event/event_title_no.jpg" class="title_image" />
				</c:when>
				
				<c:when test="${ fn:substring(event.e_image, 0, 12) == 'image/event/' }">
					<img src="${ event.e_image }" class="title_image" />
				</c:when>
				
				<c:otherwise>
					<img src="upload/${ event.e_image }" class="title_image" />
				</c:otherwise>
				</c:choose>
			</td>
			<td style="vertical-align: top;">
				<!-- 날짜 -->
				<div class="event_date" align="left" style="font-size: 10pt; font-weight: 800;">
					${ fn:substring(event.e_start_date, 0, 4) }년
					${ calUtil.toOne(fn:substring(event.e_start_date, 5, 7)) }월
					${ calUtil.toOne(fn:substring(event.e_start_date, 8, 10)) }일
					${ calUtil.toOne(fn:substring(event.e_start_date, 11, 13)) }시
					${ calUtil.toOne(fn:substring(event.e_start_date, 14, 16)) }분
					
					<c:if test="${ !empty event.e_end_date }">
						&nbsp;~&nbsp;
						${ fn:substring(event.e_end_date, 0, 4) }년
						${ calUtil.toOne(fn:substring(event.e_end_date, 5, 7)) }월
						${ calUtil.toOne(fn:substring(event.e_end_date, 8, 10)) }일
						${ calUtil.toOne(fn:substring(event.e_end_date, 11, 13)) }시
						${ calUtil.toOne(fn:substring(event.e_end_date, 14, 16)) }분
					</c:if>
				</div>
				
				<br/>
				
				<!-- 이벤트 이름 -->
				<div class="event_title" align="left">
					<a href="event_detail.do?seq=${ event.e_seq }">${ event.e_title }</a>
				</div>
			</td>
		</tr>
		</c:forEach>
		</table>
	</div>

</c:if>