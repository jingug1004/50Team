<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <!-- 넘겨받은 리스트 길이구하는데 사용 -->
<fmt:requestEncoding value="utf-8"/>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/st.js"></script>
<script src="js/friend.js"></script>

<style>
.myicon{
	width: 20px;
}
.mywh{
	display: inline-block;
}
</style>

<!-- <h1>in_friend_search</h1> -->
<h1>아는 친구 검색</h1>


<form name="originflist" action="">	<!-- 검색 버튼을 누르면, 기존의 table은 사라지고 검색 table 보여줌 -->
<!-- <table id="_originflist" style="width: 100%; visibility: visible;"> -->
<div class="row text-center" style="margin: 10px;">
	<c:if test="${fn:length(finformlist) eq 0}">
		<p>친구가 없습니다</p>
	</c:if>
	<c:if test="${fn:length(finformlist) ne 0}">	
		<c:forEach items="${finformlist}" var="finform" varStatus="vsinform"> <!-- (수정할점0908) 이름으로 order by 해야함-->
			<%-- <c:set var="pathone" value="${imgpath }\\${finform.value.m_profile }"/> --%>
			<c:set var="pathone" value="upload/${finform.value.m_profile }"/>
			<c:if test="${vsinform.index%4 eq 0}">
				<br>
			</c:if>
	        <div class="col-sm-6 hero-feature"> <!-- 크기관련 문제부분 : 한 열에 2개 출력(col-sm-6).  한 열에 2개 출력(col-md-3).-->
	            <div class="thumbnail">
	              <!-- (수정할거:0905)사진 크기에 따라 변하면 안됌.  -->
			<img src="${pathone }" alt="이미지없음" width="200px"> 
			<div class="caption">
				<h3><a href="javascript:Movefriendsmain('${finform.key}')">${finform.value.m_name }</a></h3>		
				<p>${finform.value.m_content}</p>
				<p>
				<c:forEach items="${flist}" var="f" varStatus="vs">
					<c:if test="${f.f_id eq finform.value.m_id }"> 
						<div class="btn-group ">
							<!-- <div class="btn-group btn-group-justified"> -->	
							<a class="btn btn-default" href="#" style="height: 40px" onclick="return false;">
								<p class="mywh" id="mywh${f.f_id }">
									<c:if test="${f.f_group eq 0}">
										<img src="image/friend/family.jpg" alt="이미지없음" id="myicon${f.f_id }" class="myicon"><span id="_mywh${f.f_id }">가족</span>
									</c:if>
									<c:if test="${f.f_group eq 1}">
										<img src="image/friend/bestfriend.jpg" alt="이미지없음" id="myicon${f.f_id }" class="myicon"><span id="_mywh${f.f_id }">친한 친구</span>
									</c:if>
									<c:if test="${f.f_group eq 2}">
										<img src="image/friend/friend.jpg" alt="이미지없음" id="myicon${f.f_id }" class="myicon"><span id="_mywh${f.f_id }">아는 친구</span>
									</c:if>
								</p>
							</a>
							<!-- 	</div> -->
							
							<%-- <input type="button" id="ifs_${f.f_id }" class="btn btn-primary" value="친구 끊기" onclick="stranger(id, '${f.f_id}', '${login_id }')"> --%>
							<a class="btn btn-default dropdown-toggle" aria-expanded="false" href="#" data-toggle="dropdown" style="height: 40px"><span class="caret"></span></a>
							<ul class="dropdown-menu" id="onet${f.f_id }" onclick="mytest(event, '${f.f_id}', '${login_id}')">
								<li><a>가족</a></li>
								<li><a>친한 친구</a></li>
								<li><a>아는 친구</a></li>
								<li class="divider"></li>
								<li><a>친구 끊기</a></li>
							</ul>
							
						</div>
					</c:if>
				</p>
				</c:forEach>
				</div>
	            </div>
	         </div>
		</c:forEach>
	</c:if>
</div>
<!-- </table> -->
</form>
