function Movefriendsmain(val){
	location.href="NewsFeedList2.do?m_id="+val+"&link=people";
}

function Searchingin() {
	document.idCheckForm.action = "infriendssomeone.do";
	document.idCheckForm.submit();
}

function Searchingone(){
	document.searchvalues.action = "outfriendssearch.do";
	document.searchvalues.submit();
}

function Subinform(val){
	alert(val+" : " + val["m_id"]);
	document.getElementById("testone").innerHTML=val["m_id"];
}

function stranger(param, inpid, login_id){
	
	if($("#"+param).val()=="친구 끊기"){
		
		$.ajax({
			type:"POST",
			url:"stranger.do",
			data:{"m_id":login_id, "f_id":inpid},
			success: function(response){
				$("#"+param).attr({"value":"차단 하기", "class":"btn btn-default"});		
			},error: function(request, status, error){
				alert("error  code:"+request.status+"\n"+"error:"+error);
			}
			
		});
		
	}else if($("#"+param).val()=="차단 하기"){
		
		$.ajax({
			type:"POST",
			url:"block.do",
			data:{"m_id":login_id, "f_id":inpid},
			success: function(response){
				$("#"+param).attr({"value":"차단 완료" , "disabled":true});		
			},error: function(request, status, error){
				alert("error  code:"+request.status+"\n"+"error:"+error);
			}
			
		});
		
	}
	
}
function cancleblock(param, val, login_id){
	
	$.ajax({
		type:"POST",
		url:"cancle.do",
		data:{"m_id":login_id, "f_id":val},
		success: function(response){
			$("#"+param).attr({"value":"차단 해제 완료", "class":"btn btn-default", "disabled":true});		
		},error: function(request, status, error){
			alert("error  code:"+request.status+"\n"+"error:"+error);
		}
		
	});
	
}
function mytest(event, inpid, login_id){
	
	var chooseword = event.target.innerHTML;
	var num = 0;
	var groupimgpath = "image/friend/friend.jpg";
	alert(chooseword);
	
	if(chooseword=="가족"){
		num = 0;
		groupimgpath = "image/friend/family.jpg";
	}else if(chooseword=="친한 친구"){
		num = 1;
		groupimgpath = "image/friend/bestfriend.jpg";
	}else if(chooseword=="아는 친구"){
		num = 2;
		groupimgpath = "image/friend/friend.jpg";
	}else if(chooseword=="친구 끊기"){
		num = 3;
	}else if(chooseword=="차단 하기"){
		num = 4;
	}else if(chooseword=="친구 요청"){
		num = 5;
	}
	
	if(num < 3){
		
		$.ajax({
			type:"POST",
			url:"changegroup.do",
			data:{"m_id":login_id, "f_id":inpid, "f_group":num},
			success: function(response){
				$("#myicon"+response).attr("src", groupimgpath);
				$("#_mywh"+response).html(chooseword);
			},error: function(request, status, error){
				alert("error  code:"+request.status+"\n"+"error:"+error);
			}
			
		});
		
	}else if(num == 3){	// 친구끊기 => 리스트에서 '가족', '친한친구', '아는친구' 삭제 후, '차단 하기'와 '친구요청'을 삽입. 단, 버튼엔 '친구 끊기 완료'문구 띄움
		
		$.ajax({
			type:"POST",
			url:"stranger.do",
			data:{"m_id":login_id, "f_id":inpid},
			success: function(response){
				$("#mywh"+response).text("친구 끊기 완료");
				$("#mywh"+response).attr({"href":"#", "onclick":"return false;"});
				$("#onet"+response).empty();
				$("#onet"+response).append("<li><a>친구 요청</a></li>");
				$("#onet"+response).append("<li><a>차단 하기</a></li>");
			},error: function(request, status, error){
				alert("error  code:"+request.status+"\n"+"error:"+error);
			}
			
		});
		
	}else if(num == 4){	// 차단 하기 == '친구끊기' 해야만, 리스트에 '차단 하기'뜸.
		
		$.ajax({
			type:"POST",
			url:"block.do",
			data:{"m_id":login_id, "f_id":inpid},
			success: function(response){
				$("#mywh"+response).text("차단 완료");
				$("#onet"+response).empty();
				$("#onet"+response).append("<li><a>친구 요청</a></li>");
			},error: function(request, status, error){
				alert("error  code:"+request.status+"\n"+"error:"+error);
			}
			
		});
		
	}else if(num == 5){	// 친구 요청  == '친구끊기' 해야만, 리스트에 '친구 요청'뜸.
	
		$.ajax({
			type:"POST",
			url:"befriends.do",
			data:{"m_id":login_id, "f_id":inpid},
			success: function(response){
				if(response == "fail"){ 
					alert("친구 요청을 할 수 없습니다");	// 상대방이 해당 회원을 차단한경우
				}
				$("#mywh"+response).text("친구 요청 완료");
				$("#onet"+response).empty();
				$("#onet"+response).append("<li><a>차단 하기</a></li>");
			},error: function(request, status, error){
				alert("error  code:"+request.status+"\n"+"error:"+error);
			}
			
		});

	}
	
	
	
}


/*
function befriends(val) {
	alert("친구맺기1"+val);
	
	$(val).attr({"target":"_self", "action":"befriends.do"}).submit();
	
	//document.val.
	//location.href="befriends.do";
}
*/
/*$("#_btnAdd").click(function() {
//	alert("글쓰기");
	$("#_frmForm").attr({"target":"_self", "action":"bbswrite.do"}).submit();
});
*/
/* window.onload=function(){
	var t = "${choosekeyword.m_name}";
	//alert(t);
	
	document.getElementById("words").innerHTML='${choosekeyword.m_name}';
}
function dd(val){
	var t = val;
	
	if('${num}'=="2"){
		alert("${num}");
		document.getElementById("testone").innerHTML=val;
		//document.getElementById("test"+'${fsschfS.count }').innerHTML='${num}';
	}
} */
