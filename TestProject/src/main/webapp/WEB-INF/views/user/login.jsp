<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<div class="container">
  <h3>로그인</h3>
	<div class="form-group">
		<label for="username">아이디:</label> <input type="text"
			class="form-control" id="username" placeholder="Enter email"
			name="username">
	</div>
	<div class="form-group">
		<label for="password">비밀번호:</label> <input type="password"
			class="form-control" id="password" placeholder="Enter password"
			name="password">
	</div>
	<div class="form-group" align="right">
		<button type="button" class="btn btn-primary" id="btnLogin">로그인</button>
	</div>
	<script>
		$("#btnLogin").click(function(){
			$.ajax({
				type : "post",
				url : "/login",
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify({
					"username" : $("#username").val(),
					"password" : $("#password").val()
				})//ajax
			}).done(function(resp) {
				if (resp == "no") {
					alert("회원이 아닙니다. 회원가입하세요");
					location.href = "join";
				} else if (resp == "success") {
					alert("로그인 성공")
					location.href = "/list"
				} else {
					alert("비밀번호를 확인하세요")
				}
			}) //done
		}) //btnLogin
	</script>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>