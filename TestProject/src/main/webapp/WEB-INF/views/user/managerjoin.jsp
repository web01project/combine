<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<div class="container">
<h3>숙소 관리자 회원가입폼</h3>
	<input type="hidden" value="ROLE_MANAGER" id="role" name="role">
	<div class="form-group">
		<label for="name">이름:</label> <input type="text" class="form-control"
			id="name" placeholder="Enter name" name="name">
	</div>
	<div class="form-group">
		<label for="email">아이디(이메일):</label> <input type="text"
			class="form-control" id="email" placeholder="Enter email"
			name="email">
	</div>

	<div class="form-group">
		<label for="password">비밀번호:</label> <input type="password"
			class="form-control" id="password" placeholder="Enter password"
			name="password">
	</div>
	<div class="form-group">
		<label for="pwd_check">비밀번호 확인</label> <input type="password"
			class="form-control" id="pwd_check"
			placeholder="Enter password_check" name="pwd_check">
	</div>
	<div class="form-group">
		<label for=businessnum >사업자번호:</label> <input type="text" class="form-control"
			id="businessnum" placeholder="Enter Business Number" name="businessnum">
	</div>
	<div class="form-group">
		<label for="age">나이:</label> <input type="text" class="form-control"
			id="age" placeholder="Enter age" name="age">
	</div>
	<div class="form-group">
		<label for="tel">전화번호:</label> <input type="text" class="form-control"
			id="tel" placeholder="Enter tel" name="tel">
	</div>
	<button class="btn btn-secondary" id="btnJoin">회원가입</button>
</div>
	<script>
	//회원가입버튼
		$("#btnJoin").click(function() {
			var exp = /^[0-9]{3}-[0-9]{4}-[0-9]{4}$/
			
			if ($("#name").val() == "") {
				alert("이름을 입력하세요")
				$("#name").focus();
				return false;
			}
			if ($("#email").val() == "") {
				alert("아이디를 입력하세요")
				$("#email").focus();
				return false;
			}
			if ($("#password").val() == "") {
				alert("비밀번호 입력하세요")
				$("#password").focus();
				return false;
			}
			if ($("#password").val() != $("#pwd_check").val()) {
				alert("비밀번호가 일치하지 않습니다.")
				$("#pwd_check").focus();
				return false;
			}
			if ($("#age").val() == "") {
				alert("나이를 입력하세요")
				$("#age").focus();
				return false;
			}
			if ($("#tel").val() == "") {
				alert("전화번호를 입력하세요")
				$("#tel").focus();
				return false;
			}
			if (!$("#tel").val().match(exp)) {
				alert("전화번호 양식이 아닙니다");
				$("#tel").focus();
				return false;
			}
			
			var dataParam = {
				"name" : $("#name").val(),
				"username" : $("#username").val(),
				"password" : $("#password").val(),
				"age" : $("#age").val(),
				"tel" : $("#tel").val(),
			}
			$.ajax({
				type : "POST",
				url : "/join",
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify(dataParam)
			})//done
			.done(function(resp) {
				if (resp == "success") {
					alert("회원 가입 성공")
					location.href = "/login";

				} else if (resp == "fail") {
					alert("아이디 중복")
					$("#username").val("")
				}
			}).fail(function() {
				alert("회원가입실패")
			})//fail
		})//btn
	</script>


<%@ include file="/WEB-INF/views/include/footer.jsp"%>