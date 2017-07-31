<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE>
<%request.setCharacterEncoding("UTF-8"); %>
<script type="text/javascript">
$(document).ready(function() {
	var a = ${vodto.n_vote_seq };
	$(".rbtn"+a).hide();
	
	$(".chk_vote"+a).click(function() {
		$(".chk_vote"+a).not(this).prop("checked",false);
	});
	
	$("#vbtn"+a).click(function() {
		var name= $('input:checkbox[class="chk_vote'+a+'"]:checked').val();
		if (name == null) {
			alert("투표 항목을 선택해주세요");
		} else {
			name = escape(encodeURIComponent(name));
			$.ajax({
				 type:"POST",
				 contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
				url: "vote.do?n_vote_seq="+a+"&g_vote="+name,
				 success: function(result){
					$("#vp"+a).text("투표 하였습니다");
					$("#vbtn"+a).hide();
					$(".rbtn"+a).show();
				 }, error: function(){
			    	alert(result);
			    }
			});
		}
	});
	$("#rbtn"+a).click(function() {
		/* alert("실행"); */
		$.ajax({
			type:"POST",
			url: "vote_result.do?n_vote_seq="+a,
			success: function(data){
			$("#v_result_div").empty();
			$("#v_result_div").append(data); 
			}, error: function(){
		    	alert(data);
		    }
		});
	});
});
</script>

<table class="table table-bordered" style="width: 100%; height: auto;" >
<tr>
<td>
<c:if test="${empty find}">
<p id="vp${vodto.n_vote_seq}">투표 가능</p>

</c:if>
<c:if test="${!empty find}">
<p>이미 투표 하였습니다.</p>
</c:if>
<div class="votediv">
<c:if test="${!empty vodto.vote1 }">
<input class="chk_vote${vodto.n_vote_seq }" type="checkbox" value="${vodto.vote1 }">${vodto.vote1 }<br>
</c:if>
<c:if test="${!empty vodto.vote2 }">
<input class="chk_vote${vodto.n_vote_seq }" type="checkbox" value="${vodto.vote2 }">${vodto.vote2 }<br>
</c:if>
<c:if test="${!empty vodto.vote3 }">
<input class="chk_vote${vodto.n_vote_seq }" type="checkbox" value="${vodto.vote3 }">${vodto.vote3 }<br>
</c:if>
<c:if test="${!empty vodto.vote4 }">
<input class="chk_vote${vodto.n_vote_seq }" type="checkbox" value="${vodto.vote4 }">${vodto.vote4 }<br>
</c:if>
<c:if test="${!empty vodto.vote5 }">
<input class="chk_vote${vodto.n_vote_seq }" type="checkbox" value="${vodto.vote5 }">${vodto.vote5 }<br>
</c:if>
<c:if test="${!empty vodto.vote6 }">
<input class="chk_vote${vodto.n_vote_seq }" type="checkbox" value="${vodto.vote6 }">${vodto.vote6 }<br>
</c:if>
<c:if test="${!empty vodto.vote7 }">
<input class="chk_vote${vodto.n_vote_seq }" type="checkbox" value="${vodto.vote7 }">${vodto.vote7 }<br>
</c:if>
<c:if test="${!empty vodto.vote8 }">
<input class="chk_vote${vodto.n_vote_seq }" type="checkbox" value="${vodto.vote8 }">${vodto.vote8 }<br>
</c:if>
<c:if test="${!empty vodto.vote9 }">
<input class="chk_vote${vodto.n_vote_seq }" type="checkbox" value="${vodto.vote9 }">${vodto.vote9 }<br>
</c:if>
<c:if test="${!empty vodto.vote10 }">
<input class="chk_vote${vodto.n_vote_seq }" type="checkbox" value="${vodto.vote10 }">${vodto.vote10 }<br>
</c:if>
</div>
<c:if test="${empty find}">
<a data-toggle="modal" data-target="#Modalaaa">
<img  alt="결과보기" src="image/result.jpg" class="rbtn${vodto.n_vote_seq}"  id="rbtn${vodto.n_vote_seq }">
</a>
<br/>
<button id="vbtn${vodto.n_vote_seq }"  class="btn btn-danger">투표하기</button>
</c:if>
<c:if test="${!empty find}">
<a data-toggle="modal" data-target="#Modalaaa">
<img  alt="결과보기" src="image/result.jpg"  id="rbtn${vodto.n_vote_seq }">
</a>
</c:if>
</td>
</tr>
</table>


