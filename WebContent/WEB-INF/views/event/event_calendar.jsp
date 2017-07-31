<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.Calendar" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:requestEncoding value="UTF-8"/>

<!-- <link rel="stylesheet" type="text/css" href="css/bootswatch.css"/> -->

<div id="_event_calendar_prev_month" class="event_calendar"></div>

<jsp:include page="form_calendar.jsp">
	<jsp:param name="year" value="${ year }"/>
	<jsp:param name="month" value="${ month }"/>
	<jsp:param name="day" value="${ day }"/>
</jsp:include>

<div id="_event_calendar_next_month" class="event_calendar"></div>

<!-- Script -->
<script type="text/javascript">

var prevYear = ${ year };
var prevMonth = ${ month };
var prevDay = ${ day };

var nextYear = ${ year };
var nextMonth = ${ month };
var nextDay = ${ day };

$(document).ready(function() {
	
	// 최초 화면 진입 시 '현재 달' 출력. 스크롤바가 없으면 '다음 달'도 출력
	var windowHeight = $(window).height();
	var documentHeight = $(document).height();
	
	if ( nextMonth == 11 ) {
		
		nextYear = nextYear + 1;
		nextMonth = 0;
		
	} else {
		nextMonth = nextMonth + 1;
	}
	
	if ( windowHeight <= documentHeight ) {
		
		$.ajax({
			url: 'form_calendar.do?year=' + nextYear + '&month=' + nextMonth + "&day=" + nextDay,
			type: 'GET',
			async: false,
			cache: false,
			success: function(data) {
				$('#_event_calendar_next_month').append(data);
			},
			error: function(data) {
				alert("실패...");
				alert(data);
			}
		});
	}
	
});

$(document).on('click', '.prev_month', function() {
	
	if ( prevMonth == 0 ) {
		
		prevYear = prevYear - 1;
		prevMonth = 11;
		
	} else {
		prevMonth = prevMonth - 1;
	}
	
	$.ajax({
		url: 'form_calendar.do?year=' + prevYear + '&month=' + prevMonth + "&day=" + prevDay,
		type: 'GET',
		async: false,
		cache: false,
		success: function(data) {
			$('#_event_calendar_prev_month').prepend(data);
		},
		error: function(data) {
			alert("실패...");
			alert(data);
		}
	});
});

$(document).scroll(function() {
	
	// 현재 스크롤 위치 + 스크롤바 높이
	var posScroll = $(window).scrollTop() + $(window).height();
	
	// 페이지 높이
	var maxHeight = $(document).height();
	
	if ( posScroll > (maxHeight - 200) ) {
		if ( nextMonth == 11 ) {
			
			nextYear = nextYear + 1;
			nextMonth = 0;
			
		} else {
			nextMonth = nextMonth + 1;
		}
		
		$.ajax({
			url: 'form_calendar.do?year=' + nextYear + '&month=' + nextMonth + "&day=" + nextDay,
			type: 'GET',
			async: false,
			cache: false,
			success: function(data) {
				$('#_event_calendar_next_month').append(data);
			},
			error: function(data) {
				alert("실패...");
				alert(data);
			}
		});
	}
});

</script>
