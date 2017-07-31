<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<fmt:requestEncoding value="UTF-8"/>

<jsp:useBean id="calUtil" class="sist.co.util.CalendarUtil" />

<c:set var="sDateArr" value="${ fn:split(event.e_start_date, '-') }" />

<div>
<table border="1" style="width: 100%; height:100%;">
	<col style="width: 10%;" /><col style="width: 60%;" /><col style="width: 20%;" />
	<tr>
		<td>
			<span class="event_date">
				<span style="font-size: 9pt;">
					${ calUtil.toOne(fn:substring(event.e_start_date, 5, 7)) }월
				</span>
				<br/>
				<span style="font-size: 14pt; font-weight: 800;">
					${ calUtil.toOne(fn:substring(event.e_start_date, 8, 10)) }일
				</span>
			</span>
		</td>
		<td style="text-align: left;">
			<div class="newsfeed_event_title">${ event.e_title }</div>
			<br/>
			<c:if test="${ calUtil.toOne(fn:substring(event.e_start_date, 11, 13)) <= 12 }">
				오전 ${ calUtil.toOne(fn:substring(event.e_start_date, 11, 13)) }시&nbsp;
			</c:if>
			
			<c:if test="${ calUtil.toOne(fn:substring(event.e_start_date, 11, 13)) > 12 }">
				오후 ${ calUtil.toOne(sDateArr[3]) - 12 }시&nbsp;
			</c:if>
			${ calUtil.toOne(fn:substring(event.e_start_date, 14, 16)) }분
		</td>
		<td>
			<div class="btn-group">
				<a href="#" id="event_join_decision" class="btn btn-default dropdown-toggle" 
					data-toggle="dropdown" aria-expanded="false">
					<span class="event_join_type_img"></span>
					<font id="event_join_decision_text">결정</font>
					<span class="caret"></span>
				</a>
				<ul class="dropdown-menu">
					<li>
						<a href="#" class="event_join_type" chk="0" 
							onclick="return false"><span class="event_join_type_img"></span>
							&nbsp;참석</a>
					</li>
					<li>
						<a href="#" class="event_join_type" chk="0" 
							onclick="return false"><span class="event_join_type_img"></span>
							&nbsp;불참</a>
					</li>
					<li>
						<a href="#" class="event_join_type" chk="0" 
							onclick="return false"><span class="event_join_type_img"></span>
									&nbsp;모르겠음</a>
					</li>
				</ul>
			</div>
		</td>
	</tr>
</table>
</div>

<script type="text/javascript">

$(document).ready(function() {
	// 이벤트 참석 여부 결정
	$('.event_join_type').click(function() {
		var targetChk = $(this).attr('chk');
		var choiceText = $(this).text();
		var imgTag = "<i id='join_check_img' class='fa fa-check' aria-hidden='true'></i>";
		
		if ( targetChk == 0 ) {
			$(this).attr('chk', '1').find('.event_join_type_img').html(imgTag);
			$('.event_join_type').not(this).attr('chk', '0').find('i').remove();
			
		} else {
			$(this).not(this).attr('chk', '0').find('.event_join_type_img').find('i').remove();
		}
		
		$('#event_join_decision').find('#event_join_decision_text').text(choiceText);
		$('#event_join_decision').find('.event_join_type_img').html(imgTag);
	});
});

</script>
