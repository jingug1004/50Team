<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="utf-8"/>

<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/st.js"></script>
<!-- <script src="../javascript/friends.js"></script> -->
<script type="text/javascript">
function infriends(){
	alert("친구검색");
	var textValue = document.getElementById('searchtext').value;
	layerID.style.visibility="visible"; 
	_resulttable.style.visibility="visible";
	_originflist.style.visibility="hidden"; 
	document.erer.searchword.value=textValue;
	
	//location.href="friendlist.do";

}
</script>
</head>
<body>

<h1>친구 리스트 - 친구 내 검색</h1>

<form name="erer">
<p>
	<input type="text" name="searchword" value="">
</p>
</form>
<c:out value="${param.searchword}"></c:out>

<%-- <p>searchword: ${param.searchword }, $(paramValues.searchword)</p> --%>

<!-- 검색 --> <!-- (0908) 실시간 검색을 만들경우, 이 부분이 나중에 header로 올라감. 그리고 ~.do를 실행시켜서 content에 결과 출력하는 방식으로 만들거임 -->
<form class="navbar-form navbar-left" role="search">
	<div class="form-group">
		<input class="form-control" type="text" placeholder="이름" id="searchtext">
	</div>
		<button class="btn btn-default" type="button" onclick="infriends()">검색</button>	<!-- submit으로 하면 안됌. 다른페이지로 넘기는 형태이므로.새로고침하는셈 -->
</form>

<br><br>

<!-- 검색 버튼을 눌러야지만 보여짐 -->
<form name="resulttable" action="">
<table id="_resulttable" style="visibility: hidden;">
	<tr>
		<td style="background: orange">1</td>
		<td >2</td>
		<td >3</td>
		<td >4</td>
	</tr>
	<c:set var="searchword" value=""/>	<!-- 검색버튼 클릭누르면 textfield값이 searchword의 value로 들어옴 -->
	<%-- <tr><td colspan="4">searchword : ${searchword }</td></tr> --%>
	<!-- <tr><td colspan="4"><input type="text" name="searchword" value=""></td></tr> -->
	<tr>
		<c:set var="myindex" value="${0 }"/>
		<c:forEach items="${finformlist}" var="finform" varStatus="vsinform">
			<c:if test="${finformlist.value.m_name eq searchword}">
			<%-- <c:set var="pathone" value="${imgpath }\\${finform.value.m_profile }"/> --%>
			<c:set var="pathone" value="upload/${finform.value.m_profile }"/>
			<td>
				<c:set var="myindex" value="${value+1 }"/>
				<div class="row text-center">
	            	<div class="col-md-3 col-sm-6 hero-feature">
		                <div class="thumbnail">
		                  <!-- (수정할거:0905)사진 크기에 따라 변하면 안됌.  -->
		                    <img src="${pathone }" alt="이미지없음" width="300px" height="200px"> 
		                    <div class="caption">
		                       <h3>${finform.value.m_name }<font size="1px">(${finform.value.m_nickname })</font></h3>	<!-- (수정할점0908)id로 출력됨 => 이름(nickname)으로 출력해야함 -->
		                       <p>${finform.value.m_content}</p>
		                       <p>
		                       <c:forEach items="${flist}" var="f" varStatus="vs">
		                       	<c:if test="${f.f_id eq finform.value.m_id }"> 
			                       	<c:if test="${f.f_accept eq 1}">
			                       		<a href="#" class="btn btn-primary">친구 끊기</a>
			                       		<a href="#" class="btn btn-default">차단 하기</a>
			                       	</c:if> 
			                       	<c:if test="${f.f_accept eq 2}">
			                       		<a href="#" class="btn btn-primary">팔로우 끊기</a>
			                       	</c:if> 
		                       	</c:if>
		                       </p>
		                       </c:forEach>
		                    </div>
		                </div>
		            </div>
				 </div>
			</td>
			</c:if>
			<c:if test="${myindex%4 eq 0}">
				</tr><tr>
			</c:if>
		</c:forEach>
	</tr>
	<%-- </c:if> --%>
	<c:if test="${searchword eq null || myindex eq 0}">	<!--  입력값이 null, 혹은, 일치하는 친구가 없을경우 -->
		<tr>
			<td colspan="4" style="text-align: center; vertical-align: center">검색된 친구가 없습니다.</td>
		</tr>
	</c:if>
</table>
</form>

<br><br>

<form name="originflist" action="">	<!-- 검색 버튼을 누르면, 기존의 table은 사라지고 검색 table 보여줌 -->
<table id="_originflist" style="width: 100%; visibility: visible;">
	<%-- <colgroup>
		<col width="25%"><col width="25%"><col width="25%"><col width="25%">
	</colgroup> --%>
	<tr>
		<td style="background: red">1</td>
		<td >2</td>
		<td >3</td>
		<td >4</td>
	</tr>
	<tr>
	<c:forEach items="${finformlist}" var="finform" varStatus="vsinform"> <!-- (수정할점0908) 이름으로 order by 해야함-->
		<%-- <c:set var="pathone" value="${imgpath }\\${finform.value.m_profile }"/> --%>
		<c:set var="pathone" value="upload/${finform.value.m_profile }"/>
		<%-- <c:if test="${vsinform.count%5 eq 0}"> --%>
		<c:if test="${vsinform.index%4 eq 0}">
			</tr><tr>	
		</c:if> <!-- (0906수정할거) 친구목록이 없으면 "친구가 없습니다"문구 띄우기 -->
		<td>
			<div class="row text-center">
	            <div class="col-md-3 col-sm-6 hero-feature">
	                <div class="thumbnail">
	                  <!-- (수정할거:0905)사진 크기에 따라 변하면 안됌.  -->
	                    <img src="${pathone }" alt="이미지없음" width="300px"> 
	                    <div class="caption">
	                       <h3>${finform.value.m_name }</h3>	<!-- (수정할점0908)id로 출력됨 => 이름(nickname)으로 출력해야함 -->
	                       <p>${finform.value.m_content}</p>
	                       <p>
	                       <c:forEach items="${flist}" var="f" varStatus="vs">
	                       	<c:if test="${f.f_id eq finform.value.m_id }"> 
		                       	<c:if test="${f.f_accept eq 1}">
		                       		<a href="#" class="btn btn-primary">친구 끊기</a>
		                       		<a href="#" class="btn btn-default">차단 하기</a>
		                       	</c:if> 
		                       	<c:if test="${f.f_accept eq 2}">
		                       		<a href="#" class="btn btn-primary">팔로우 끊기</a>
		                       	</c:if> 
	                       	</c:if>
	                       </p>
	                       </c:forEach>
	                    </div>
	                </div>
	            </div>
			 </div>
		 </td> 
	</c:forEach>
	</tr>
</table>
</form>




<!-- ex -->
<table id="layerID" style="visibility:hidden;">

  <tr>
    <td>안녕하세요</td>
  </tr>
</table>

<script>
function LayerView()
{
     layerID.style.visibility="visible"; 
	//$("#layerID").attr("style", "visibility.visible");
}

function LayerHiding()
{
     layerID.style.visibility="hidden"; 
    //$("#layerID").attr("style", "visibility.hidden");
}
</script>

<a href="Javascript:LayerView();">테이블 보이기 </a>
<a href="Javascript:LayerHiding();">테이블 숨기기 </a>

</body>
