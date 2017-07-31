<%@ page contentType="text/html; charset=UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<fmt:requestEncoding value="utf-8"/>
<script type="text/javascript" src="js/friend.js"></script>

<!-- <h4>right_friendssearch</h4> -->
<h4>친구 검색</h4>
<table class="table table-striped">
	<tr>
		<td>
			<form class="form-horizontal" name="searchvalues" action="Searchingone()">
			  <fieldset>
			    <legend>친구 검색</legend>
			    <p>새로운 친구를 찾아보세요</p>
			    <div class="form-group">
			      <label class="col-lg-2 control-label" for="inputName">이름</label>
			      <div class="col-lg-10">
			        <input class="form-control" id="inputName" name="inputname" type="text" placeholder="Name" onkeypress="if(event.keyCode==13) {Searchingone(); return false;}">
			      </div>
			    </div>
			     <div class="form-group">
			      <label class="col-lg-2 control-label" for="inputNickname">닉네임</label>
			      <div class="col-lg-10">
			        <input class="form-control" id="inputNickname" name="inputnickname" type="text" placeholder="Nickname" onkeypress="if(event.keyCode==13) {Searchingone(); return false;}">
			      </div>
			     </div>    
			    <div class="form-group">
			      <label class="col-lg-2 control-label" for="inputPhone">핸드폰번호</label>
			      <div class="col-lg-10">
			        <input class="form-control" id="inputPhone" name="inputphone" type="text" placeholder="01012345678" onkeypress="if(event.keyCode==13) {Searchingone(); return false;}">
			      </div>
			    </div>    
			    <div class="form-group">
			      <label class="col-lg-2 control-label" for="inputEmail">Email</label>
			      <div class="col-lg-10">
			        <input class="form-control" id="inputEmail" name="inputemail" type="text" placeholder="Email" onkeypress="if(event.keyCode==13) {Searchingone(); return false;}">
			      </div>
			    </div>
			    <div class="form-group">
			      <label class="col-lg-2 control-label" for="inputAddress">거주지</label>
			      <div class="col-lg-10">
			        <input class="form-control" id="inputAddress" name="inputaddress" type="text" placeholder="Address" onkeypress="if(event.keyCode==13) {Searchingone(); return false;}">
			      </div>
			    </div>    
			    <div class="form-group">
			      <label class="col-lg-2 control-label" for="inputHighschool">고등학교</label>
			      <div class="col-lg-10">
			        <input class="form-control" id="inputHighschool" name="inputhighschool" type="text" placeholder="Highschool" onkeypress="if(event.keyCode==13) {Searchingone(); return false;}">
			      </div>
			    </div>    
			    <div class="form-group">
			      <label class="col-lg-2 control-label" for="inputUniversity">대학교</label>
			      <div class="col-lg-10">
			        <input class="form-control" id="inputUniversity" name="inputuniversity" type="text" placeholder="university" onkeypress="if(event.keyCode==13) {Searchingone(); return false;}">
			      </div>
			    </div>    
			    <div class="form-group">
			      <label class="col-lg-2 control-label" for="inputOffice">직장</label>
			      <div class="col-lg-10">
			        <input class="form-control" id="inputOffice" name="inputoffice" type="text" placeholder="office" onkeypress="if(event.keyCode==13) {Searchingone(); return false;}">
			      </div>
			    </div>    
			    <div class="form-group">
			      <div class="col-lg-10 col-lg-offset-2">
			      	<!-- <button class="btn btn-primary" type="submit">검색</button> -->
			      	<a href="javascript:Searchingone()" class="btn btn-primary">검색</a>
			        <button class="btn btn-default" type="reset">리셋</button>
			      </div>
			    </div>
			  </fieldset>
			</form>
		</td>
	</tr>
</table>
