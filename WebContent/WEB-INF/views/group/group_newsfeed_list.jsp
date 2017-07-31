<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 -->
 <style>
.profile{
}
.c_profile {
width: 25px;
height: 25px;
margin-bottom: 3px;
margin-top: 2px;
}
.profile_flied{
width: 10%;
margin-left: 1px;
}
.c_name{
margin-left: 3px;
width: 10%;
text-align: left;
}
.c_content{
text-align: left;
width: 60%;
}
</style>
<c:if test="${!empty g_n_list }">
<table style="width: 100%;" class="table table-hover" >
   <tr>
      <td>
   <c:forEach items="${g_n_list }" var="g_nlist" varStatus="i">
   <br>
   <table style="width: 100%;"class="table table-bordered" >
   <!-- 기본 사항 -->
         <tr>
            <td rowspan="2" style="width: 50px;">
<%--          
            <c:if test="${g_nlist.m_profile eq null}">
            <img class="profile" alt="프로필" src="image/basic_profile.jpg">
            </c:if>
            <c:if test="${g_nlist.m_profile ne null}">
            <img class="profile" alt="프로필" src="upload/${g_nlist.m_profile}">
            </c:if> 
--%>
            <c:if test="${g_nlist.m_profile eq 'member_basic.jpg'}">
               <img alt="사진없음" src="image/${g_nlist.m_profile}" height="50px" width="50px">
              </c:if>
               <c:if test="${g_nlist.m_profile ne 'member_basic.jpg'}">
               <img alt="사진없음" src="upload/${g_nlist.m_profile}" height="50px" width="50px">
               </c:if>      
            </td>
            <td align="left">작성자 : ${g_nlist.m_name}</td>
         </tr>
         <tr>
            <td align="left">${g_nlist.n_wdate}</td>
         </tr>
   <!-- 작성 내용 -->
         <tr>
            <td colspan="2" align="left">
            <pre>${g_nlist.n_content}</pre>
            </td>
         </tr>
         
   <!-- 일반,사진일때 -->      
      <c:if test="${g_nlist.n_form_num eq 1 }">
         <script type="text/javascript">
         $(document).ready(function() {
            var a = ${g_nlist.n_seq};
            $.ajax({
               type: 'POST',
               url: 'group_newsfeed_p_form.do?n_seq='+a,
               async: false,
               cache: false,
               timeout: 10000,
               success: function(data) {
                  $('#photodiv'+a).append(data); 
               },
               error: function(data) {
                  alert("실패...");
               }
            });
         });
         </script>
         <tr>
            <td colspan="2">
               <div id="photodiv${g_nlist.n_seq}">
               </div>
            </td>
         </tr>
      </c:if>
   <!-- 동영상 일떄  -->
      <c:if test="${g_nlist.n_form_num eq 2 }">
         <script type="text/javascript">
         $(document).ready(function() {
            var a =${g_nlist.n_seq};
            
            $.ajax({
               type: 'POST',
               url: 'group_newsfeed_v_form.do?n_seq='+a,
               async: false,
               cache: false,
               timeout: 10000,
               success: function(data) {
                  $('#videodiv'+a).append(data); 
               },
               error: function(data) {
                  alert("실패...");
               }
            });
         });
         </script>
         <tr>
            <td colspan="2">
               <div id="videodiv${g_nlist.n_seq}">
               </div>
            </td>
         </tr>
      </c:if>
   <!-- 투표 일떄 -->
      <c:if test="${g_nlist.n_form_num eq 4 }">
         <script type="text/javascript">
         $(document).ready(function() {
            var a =${g_nlist.n_seq};
            var b =${g_nlist.n_vote_seq};
            $.ajax({
               type: 'POST',
               url: 'group_newsfeed_b_form.do?n_vote_seq='+b,
               async: false,
               cache: false,
               timeout: 10000,
               success: function(data) {
                  $('#vote'+a).append(data); 
               },
               error: function(data) {
                  alert("실패...");
               }
            });
         });
      </script>
         <tr>
            <td colspan="2">
               <div id="vote${g_nlist.n_seq}">
               </div>
            </td>
         </tr>
      </c:if>
   <!-- 태그 정보 -->
         <tr>
            <td colspan="2">
               <c:if test="${g_nlist.n_tag_where ne NULL}">
                  <strong>${g_nlist.n_tag_where}</strong>&nbsp;에서
               </c:if>
               <c:if test="${g_nlist.n_tag_friend ne NULL}">
                  &nbsp;&nbsp;&nbsp;<strong>${g_nlist.n_tag_friend}</strong>&nbsp;님과 함께
               </c:if>
               
               <c:if test="${g_nlist.n_tag_feel ne NULL}">
                  &nbsp;&nbsp;&nbsp;나는 지금
               <c:choose>
                  <c:when test="${g_nlist.n_tag_feel eq 1}">
                     <strong>기뻐요</strong><img src="image/happy.jpg" width="5px" height="5px">
                  </c:when>
                  <c:when test="${g_nlist.n_tag_feel eq 2}">
                     <strong>슬퍼요</strong><img src="image/sad.jpg">
                  </c:when>
                  <c:otherwise>
                     <strong>피곤해요</strong><img src="image/tired.jpg">
                  </c:otherwise>
               </c:choose>
               </c:if>   
            </td>
         </tr>
   <!-- 좋아요, 댓글 -->
         <tr>
            <td colspan="2"  align=left>
               <i class="fa fa-thumbs-o-up" id="like_btn${g_nlist.n_seq }"  aria-hidden="true" onclick="like_btn_second(${g_nlist.n_seq })"  style="color: black"></i> 
               <a id="like_btn_second${g_nlist.n_seq }"  onclick="like(${g_nlist.n_seq },'${g_nlist.m_id }')" style="color: black">좋아요</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <i class="fa fa-comment-o" aria-hidden="true" onclick="showComment(${g_nlist.n_seq })"></i> 
               <a onclick="showComment(${g_nlist.n_seq })" style="color: black">댓글달기</a>
            </td>
         </tr>
   <!-- 좋아요 누른사람 확인 -->
      <tr id="show_like_member${g_nlist.n_seq }" style="display: none">
         <td colspan="3"  align=left>
            <div id="like_member">
               [ 좋아요 누른 사람들 ]
            </div>
            <div id="like_member${g_nlist.n_seq }">
            </div>
         </td>
      </tr>
   <!-- 댓글입력 -->
      <tr id ="show_comment${g_nlist.n_seq }" style="display: none;">
         <td>
            <%-- <c:if test="${!empty login.m_profile }">
               <img class="m_profile" alt="프로필" src="upload/${login.m_profile }">
            </c:if>
            <c:if test="${empty login.m_profile }">
               <img class="m_profile" alt="프로필" src="image/basic_profile.jpg">
            </c:if> --%>
            <c:if test="${login.m_profile eq 'member_basic.jpg'}">
               <img alt="사진없음" src="image/${login.m_profile}" height="50px" width="50px">
               </c:if>
               <c:if test="${login.m_profile ne 'member_basic.jpg'}">
               <img alt="사진없음" src="upload/${login.m_profile}" height="50px" width="50px">
               </c:if>      
         </td>
         <td colspan="2">
            <input type="text" style="width:100%;" id="n_content${g_nlist.n_seq }" name="n_content" onkeydown="onKeyDown_comment('${g_nlist.n_seq }')">
         </td>
      </tr>
   <!-- 댓글 더보기 -->
       <script type="text/javascript">
         $(document).ready(function() {
            var a =${g_nlist.n_seq};
            var b =${g_nlist.n_vote_seq};
            
             $("#look_coment"+a).click(function(){
                $("#look_coment"+a).hide();
                  $.ajax({
                     type: 'POST',
                     url: 'group_coment.do?l_num=10&n_parent='+a,
                     async: false,
                     cache: false,
                     timeout: 10000,
                     success: function(data) {
                        $('#coment'+a).append(data); 
                     },
                     error: function(data) {
                        alert("실패...");
                     }
                  }); 
             });
      
         });
      </script>
      <tr>
         <td colspan="2">
            <a href="#none" id="look_coment${g_nlist.n_seq }">댓글 보기</a>
            <div id="coment${g_nlist.n_seq}" style="width: 100%;">
            
            </div>
         </td>      
      </tr>
      </table>
   </c:forEach>
   </td>
   </tr>
</table>



<script type="text/javascript">


function like(val, val2){
   var now_like_member
      $.ajax({
      type: 'GET',
      url:'Like.do',
      data:{'seq':val , 'm_id':'${login.m_id}'},
      async: false ,
      cache: false,
      success: function(data) {
         now_like_member=data;
       },
       error: function(data) {
         alert("like error");
       } 
   }); 

   status = $("#like_btn"+val).css("color");
   if(status=="rgb(255, 0, 0)"){
      $(" #like_btn"+val).css("color","black");
      $(" #like_btn_second"+val).css("color","black");
      $("#show_like_member"+val).css("display","none");
      
   }else{
      $(" #like_btn"+val).css("color","red");
      $(" #like_btn_second"+val).css("color","red");
      $("#show_like_member"+val).show();
      $("#like_member"+val).text(now_like_member);
   };
}

function showComment(val){
    status = $("#show_comment"+val).css("display");
    if(status=="none"){
      $(".comment2"+val).show();
      $(".comment3"+val).show();
      $("#show_comment"+val).show();
    }else{
       $(".comment2"+val).hide();
       $(".comment3"+val).hide();
       $("#show_comment"+val).hide();
    }
}

function updateShow(val){
    $.ajax({
      type: 'GET',
      url:'updateShow.do',
      data:{'val':val},
    })
   
}

function changeShow(val,val2){
   if(val2=="1"){
      $("#dropdown-menu-"+1+"-"+val).css("color","red");
      $("#dropdown-menu-"+2+"-"+val).css("color","black");
      $("#dropdown-menu-"+3+"-"+val).css("color","black");
   }else if(val2=="2"){
      $("#dropdown-menu-"+1+"-"+val).css("color","black");
      $("#dropdown-menu-"+2+"-"+val).css("color","red");
      $("#dropdown-menu-"+3+"-"+val).css("color","black");
   }else if(val2=="3"){
      $("#dropdown-menu-"+1+"-"+val).css("color","black");
      $("#dropdown-menu-"+2+"-"+val).css("color","black");
      $("#dropdown-menu-"+3+"-"+val).css("color","red");
   }
}

function removeNews(val){
    $.ajax({
         type: 'GET',
         url:'deleteNews.do',
         data:{'val':val},
          success: function(data) {
             $(".newsfeed_list_table"+val).hide();
             $(".newsfeed_list_table2"+val).hide();
          },
            error: function(data) {
               alert("removeNews error");
            }
       });
}

function onKeyDown_comment(val)
{

    if(event.keyCode == 13)
   {
      
      
       
    var s = "<h6>";
	s+= "<table style='width: 100%; margin-bottom: 10px;'><tr>";
	s+="<td class='profile_flied'>";
	s+="<c:if test="${login.m_profile eq 'member_basic.jpg' }">";
	s+=" <img alt='사진없음' src='image/${login.m_profile}' height='25px' width='25px'>";
	s+="</c:if><c:if test="${login.m_profile ne 'member_basic.jpg'}">";
	s+="<img alt='사진없음' src='upload/${login.m_profile}' height='25px' width='25px'>";
	s+="</c:if></td><td class='c_name'>${login.m_id } :</td>";
	s+="<td class='c_content'>"+$("#n_content"+val).val()+"</td>";
	s+="<td class='c_time'>방금전</td></tr></table>";
	s+="</h6>";
       
       
       
       $("#coment"+val).prepend(s);  
      
      var content = $("#n_content"+val).val();
          $.ajax({
            type: 'GET',
            data:{'n_seq':val, 'n_content':content, 'm_id':'${login.m_id }'},
            url:'writeComment.do',
          });
         
         $("#n_content"+val).val("");
   }
}


/* function add_coment(val1,val2) {

   
$.ajax({
   type: 'POST',
   url: 'group_add_coment.do?l_num='+val2+'&n_parent='+val1,
   async: false,
   cache: false,
   timeout: 10000,
   success: function(data) {
      $('#coment'+val1).append(data); 
   },
   error: function(data) {
      alert("실패...");
   }
}); 
}  */


</script>
</c:if>