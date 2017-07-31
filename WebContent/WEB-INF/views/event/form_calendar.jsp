<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.Calendar" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<fmt:requestEncoding value="UTF-8"/>

<style type="text/css">

.tbl_calendar {
	width: 100%; 
	border-collapse: separate; 
	border-spacing: 10px; 
	border-radius: 5px; 
	border: 1px solid #AAA;
	background-color: #FFF;
}

.dayOfWeek {
	text-align: center;
}

.day {
	width: 150px; 
	padding-top: 5px;
	padding-left: 10px;
	text-align: left;
	vertical-align: top;
	border-top: 1px solid #AAA;
}

.day:HOVER {
	background-color: #A9F5E1;
	cursor: pointer;
}

.event_title_wrap {
	width: 140px;
	display: inline-block;
	overflow: hidden; 
	white-space: nowrap; 
	text-overflow: ellipsis; 
	vertical-align: middle;
}

</style>

<%

Calendar cal = Calendar.getInstance();

int year = Integer.parseInt(request.getParameter("year"));
int month = Integer.parseInt(request.getParameter("month"));
int day = Integer.parseInt(request.getParameter("day"));

cal.set(year, month, 1);

int startDay = cal.get(Calendar.DAY_OF_WEEK);
int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);

pageContext.setAttribute("year", year);
pageContext.setAttribute("month", month);
pageContext.setAttribute("day", day);

pageContext.setAttribute("startDay", startDay);
pageContext.setAttribute("lastDay", lastDay);

%>
<!-- 확인용 테스트 -->
<%-- year: ${ year } &nbsp;
month: ${ month } &nbsp;
day: ${ day } &nbsp;
startDay: ${ startDay } &nbsp;
lastDay: ${ lastDay } --%>
<!-- // 확인용 테스트 -->

<div class="event_calendar">
	<table class="tbl_calendar">
		<tr>
			<td colspan="7" align="left" style="padding: 10px 0px;">
				<!-- <span><img id="_prev_month" class="prev_month" src="image/left.png" alt="이전 달"/></span> -->
				<span><a href="#" class="btn btn-danger btn-xs prev_month" onclick="return false">이전 달</a></span>
				<!-- <span><img id="_next_month" class="next_month" src="image/right.png" alt="다음 달"/></span> -->
				<span>${ year }년 ${ month + 1 }월</span>
			</td>
		</tr>
		
		<tr class="active">
			<td class="dayOfWeek">월</td>
			<td class="dayOfWeek">화</td>
			<td class="dayOfWeek">수</td>
			<td class="dayOfWeek">목</td>
			<td class="dayOfWeek">금</td>
			<td class="dayOfWeek">토</td>
			<td class="dayOfWeek">일</td>
		</tr>
		
		<tr class="active" style="height: 130px;">
		
		<!-- 시작 날 이전 표시: 달력이 '월요일'부터 시작하며, 시작 요일을 제외하기 위해 '-2' 처리 -->
		<c:choose>
		<c:when test="${ startDay > 1 }">
			<c:forEach begin="1" end="${ startDay - 2 }">
				<td class="day"></td>
			</c:forEach>
		</c:when>
		
		<c:otherwise>
			<c:forEach begin="1" end="6">
				<td class="day"></td>
			</c:forEach>
		</c:otherwise>
		</c:choose>
		<!-- // 시작 날 이전 표시 -->
		
		<!-- 시작 날 ~ 종료 날 표시 -->
		<jsp:useBean id="calUtil" class="sist.co.util.CalendarUtil" />
		<c:forEach begin="1" end="${ lastDay }" varStatus="calCnt">
			
			<c:set var="eventDate" value="${ year }년 ${ month+1 }월 ${ calCnt.count }일" />
			<c:set var="dayDate" value="${ calUtil.yy(year) }/${ calUtil.two(month+1) }/${ calUtil.two(calCnt.count) }" />
			<c:set var="dayDate2" value="${ year }-${ calUtil.two(month+1) }-${ calUtil.two(calCnt.count) }" />
			<td class="day" data-eventDate="${ eventDate }" data-dayDate="${ dayDate }" data-dayDate2="${ dayDate2 }">
				<div>${ calCnt.count }</div>
				
				<c:set var="dayListCnt" value="0" />
				<c:set var="moreViewCnt" value="0" />
				<c:set var="moreView" value="false" />
				
				<!--	자신이 주최한 이벤트 리스트		-->
				<c:forEach var="event" items="${ eventList }" varStatus="eventCnt">
				
					<c:set var="sDateArr" value="${ fn:split(event.e_start_date, '-') }" />
					
					<c:forEach var="sDateText" items="${ sDateArr }" varStatus="sDateCnt">
						<c:choose>
						<c:when test="${ sDateCnt.count == 1 }">
							<c:set var="eventYear" value="${ sDateText }" />
						</c:when>
						<c:when test="${ sDateCnt.count == 2 }">
							<c:set var="eventMonth" value="${ sDateText }" />
						</c:when>
						<c:when test="${ sDateCnt.count == 3 }">
							<c:set var="eventDay" value="${ sDateText }" />
						</c:when>
						</c:choose>
					</c:forEach>
					
					<c:if test="${ eventYear == year 
								&& (eventMonth-1) == month 
								&& eventDay == calCnt.count }">
						
						<c:choose>
						<c:when test="${ dayListCnt < 3 }">
							<div class="event_title_wrap">
								<a href="event_detail.do?seq=${ event.e_seq }" style="font-size: 10pt;">
									<span><img src="image/event/calendar_list_symbol_02.png" 
									class="list_symbol" /></span>
									${ event.e_title }
								</a>
							</div>
							<c:set var="dayListCnt" value="${ dayListCnt + 1 }" />
						</c:when>
						
						<c:otherwise>
							
							<c:set var="dayListCnt" value="${ dayListCnt + 1 }" />
							<c:set var="moreViewCnt" value="${ moreViewCnt + 1 }" />
							
							<c:choose>
							<c:when test="${ moreView == false }">
								<div>
									&nbsp;
									<a href="#" id="event_more_view" 
									onclick="return false">${ moreViewCnt }개 더보기...</a>
								</div>
								<c:set var="moreView" value="true" />
							</c:when>
							
							<c:otherwise>
								<script type="text/javascript">
									$('#event_more_view').text('${ moreViewCnt }' + "개 더보기...");
								</script>
							</c:otherwise>
							</c:choose>
							
						</c:otherwise>
						</c:choose>
						
					</c:if>
				</c:forEach>
				<!-- // 자신이 주최한 이벤트 리스트		-->
				
				<!--	초대 받은 이벤트 리스트		-->
				<c:forEach var="eventInvite" items="${ eventInviteList }" varStatus="eventCnt">
				
					<c:set var="sDateArr" value="${ fn:split(eventInvite.e_start_date, '-') }" />
					
					<c:forEach var="sDateText" items="${ sDateArr }" varStatus="sDateCnt">
						<c:choose>
						<c:when test="${ sDateCnt.count == 1 }">
							<c:set var="eventYear" value="${ sDateText }" />
						</c:when>
						<c:when test="${ sDateCnt.count == 2 }">
							<c:set var="eventMonth" value="${ sDateText }" />
						</c:when>
						<c:when test="${ sDateCnt.count == 3 }">
							<c:set var="eventDay" value="${ sDateText }" />
						</c:when>
						</c:choose>
					</c:forEach>
					
					<c:if test="${ eventYear == year 
					&& (eventMonth-1) == month 
					&& eventDay == calCnt.count }">
						
						<c:choose>
						<c:when test="${ dayListCnt < 3 }">
							<div class="event_title_wrap">
								<i class="fa fa-envelope-square" aria-hidden="true"></i>
								<a href="event_detail.do?seq=${ eventInvite.e_seq }" style="font-size: 10pt;">
									&nbsp;${ eventInvite.e_title }
								</a>
							</div>
							<c:set var="dayListCnt" value="${ dayListCnt + 1 }" />
						</c:when>
						
						<c:otherwise>
							
							<c:set var="dayListCnt" value="${ dayListCnt + 1 }" />
							<c:set var="moreViewCnt" value="${ moreViewCnt + 1 }" />
							
							<c:choose>
							<c:when test="${ moreView == false }">
								<div>
									&nbsp;
									<a href="#" id="event_more_view" 
									onclick="return false">${ moreViewCnt }개 더보기...</a>
								</div>
								<c:set var="moreView" value="true" />
							</c:when>
							
							<c:otherwise>
								<script type="text/javascript">
									$('#event_more_view').text('${ moreViewCnt }' + "개 더보기...");
								</script>
							</c:otherwise>
							</c:choose>
							
						</c:otherwise>
						</c:choose>
						
					</c:if>
				</c:forEach>
				<!-- // 초대 받은 이벤트 리스트		-->
				
			</td>
		
			<!-- 달의 마지막 날이 일요일이면 행 추가를 막기 위해 'i.count != lastDay' 조건 추가 -->
			<c:if test="${ ((calCnt.count + startDay - 2) % 7 == 0) && calCnt.count != lastDay }">
				</tr><tr class="active" style="height: 130px;">
			</c:if>
			
		</c:forEach>
		<!-- // 시작 날 ~ 종료 날 표시 -->
		
		<!-- 종료 날 이후 표시 -->
		<c:forEach begin="1" end="${ (7 - (startDay + lastDay - 2) % 7) % 7 }">
			<td class="day"></td>
		</c:forEach>
		</tr>
		<!-- // 종료 날 이후 표시 -->
	
	</table>
	<br/><br/>
</div>

<input type="hidden" id="modal_day_event_open" data-toggle="modal" data-target="#modal_day_event" />

<!-- 	Modal	 -->
<div id="modal_day_event_wrap">
<div class="modal fade" id="modal_day_event" tabindex="-1" role="dialog" 
	aria-labelledby="myModalLabel"><!-- data-backdrop="static" -->
<div class="modal-dialog modal-dialog-invite" role="document">
<div class="modal-content modal-content-invite">
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h4 class="modal-title" id="myModalLabel"><span id="day_event_date"></span>&nbsp;일정</h4>
</div>
<div id="modal_day_event_body" class="modal-body modal-body-invite"></div>
<div class="modal-footer modal-footer-invite">
	<button type="button" id="btn_day_event_close" class="btn btn-default" data-dismiss="modal">닫기</button>
</div>
</div>
</div>
</div>
</div>
<!--  // Modal	 -->




<script type="text/javascript">
$('.day').off('click').on('click', function() {
	
	var eventDate = $(this).attr('data-eventDate');
	var dayDate = $(this).attr('data-dayDate');
	var dayDate2 = $(this).attr('data-dayDate2');
	
	$.ajax({
	//	url: 'event_day_list.do?dayDate=' + dayDate + "&eventDate=" + escape(encodeURIComponent(eventDate)),
		url: 'event_day_list.do?dayDate=' + dayDate + "&dayDate2=" + dayDate2,
		type: 'GET',
		async: false,
		cache: false,
		success: function(data) {
			console.log("data: " + data);
			
			$('#modal_day_event_body').empty();
			$('#modal_day_event_body').append(data);
			$('#day_event_date').text(eventDate);
			
			$('#modal_day_event_open').click();
		},
		error: function(data) {
			alert("실패...");
			alert(data);
		}
	});
});
</script>