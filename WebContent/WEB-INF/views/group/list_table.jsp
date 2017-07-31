<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    


 <div id="list_div" style="margin-left: 15%; margin-right: 15%; margin-top: 5%; margin-bottom: 5%; ">
	<c:if test="${re_list.size()>0 && re_list.size() ne 1 }">
		<table style="width: 100%;" class="table table-bordered">
			<tr>
				<c:forEach items="${re_list }" var="list" varStatus="i">
					<td style="width: 50%; height: 250px;">
						<div style="width: 100%; height: 100%;">
							<table style="width: 100%; height: 100%;">
								<tr>
									<c:if test="${empty list.g_photo}">
									<td style="height:80%; width: 100%;" colspan="2"><img style="width: 99%; max-height: 200px; margin: 2px;" alt="그룹 이미지" src="image/g_img_basic.jpg"></td>
									</c:if>
									<c:if test="${!empty list.g_photo }">
									<td style="height:80%; width: 100%;" colspan="2"><img style="width: 99%; max-height: 200px; margin: 2px;" alt="그룹 이미지" src="upload/${list.g_photo }"></td>
									</c:if>
								</tr>
								<tr>
									<td style="width: 80%; height: 20%;"><h4><a href="group_detail.do?g_seq=${list.g_seq}">${ list.g_name}</a></h4></td>
									<td style="width: 20%; height: 20%;"><img alt="가입" id="g_join${list.g_seq}" class="g_join" data-set="${list.g_seq}" manager="${list.g_manager}" src="image/g_join.jpg"></td>
								</tr>
							</table>
						</div>
					</td>
				<c:if test="${i.count%2 eq 0 }">
			</tr>
			<tr>
				</c:if>
				</c:forEach>
			</tr>
		</table>
	</c:if>
	
</div>