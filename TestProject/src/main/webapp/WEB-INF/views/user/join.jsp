<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<title>회원 가입</title>
<header class="normal">
	<div class="container position-relative">
		<div class="row justify-content-center">

			<div class="panel" align="center">
				<table>
					<h4>회원가입</h4>
					<tr>
						<td><input type="radio" class="form-check-input" name="role"
							value="ROLE_USER" id="role" checked>일반회원 <input
							type="radio" class="form-check-input" name="role"
							value="ROLE_MANAGER" id="role">관리자
							<!-- <input type="radio" class="form-check-input" name="role"
							value="ROLE_ADMIN" id="role">사이트관리자 -->
						</td>
					</tr>
					<tr>
						<td>이름(Name)</td>
						<td><input type="text" class="form-control" id="name"
							placeholder="Enter name" name="name"></td>
					</tr>
					<tr>
						<td>이메일(Email)</td>
						<td><input type="text" class="form-control" id="useremail"
							placeholder="Enter email" name="useremail"></td>
					</tr>

					<tr>
						<td>비밀번호(Password)</td>
						<td><input type="password" class="form-control" id="password"
							placeholder="Enter password" name="password"></td>
					</tr>
					<tr>
						<td>비밀번호(Password Check)</td>
						<td><input type="password" class="form-control"
							id="pwd_check" placeholder="Enter password_check"
							name="pwd_check"></td>
					</tr>
					<tr>
						<td>나이(Age)</td>
						<td><input type="text" class="form-control" id="age"
							placeholder="Enter age" name="age"></td>
					</tr>
					<tr>
						<td>전화번호(Tel)</td>
						<td><input type="text" class="form-control" id="tel"
							placeholder="Enter tel" name="tel"></td>
					</tr>


				</table>
				<button class="btn btn-secondary" id="btnJoin">회원가입</button>
			</div>
		</div>
	</div>
	</div>
	</div>


</header>
<script>
	//회원가입버튼
	$("#btnJoin")
			.click(
					function() {
						//전화번호 정규식
						var regTel = /^[0-9]{3}-[0-9]{4}-[0-9]{4}$/
						//이메일 정규식
						var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/
						if ($("#name").val() == "") {
							alert("이름을 입력하세요")
							$("#name").focus();
							return false;
						}
						if ($("#useremail").val() == "") {
							alert("아이디를 입력하세요")
							$("#useremail").focus();
							return false;
						}
						if (!$("#useremail").val().match(regEmail)) {
							alert("이메일 양식이 아닙니다");
							$("#useremail").focus();
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
						if (!$("#tel").val().match(regTel)) {
							alert("전화번호 양식이 아닙니다");
							$("#tel").focus();
							return false;
						}
						var dataParam = {
							"name" : $("#name").val(),
							"useremail" : $("#useremail").val(),
							"password" : $("#password").val(),
							"age" : $("#age").val(),
							"tel" : $("#tel").val(),
							"businessnum" : $("#businessnum").val(),
							"role" : $("input[name=role]:checked").val()
						}
						$.ajax({
							type : "POST",
							url : "register",
							contentType : "application/json;charset=utf-8",
							data : JSON.stringify(dataParam)
						})
						//done
						.done(function(resp) {
							if (resp == "success") {
								alert("회원 가입 성공")
								location.href = "/login";
							} else if (resp == "fail") {
								alert("아이디 중복")
								$("#useremail").val("")
							}
						}).fail(function() {
							alert("회원가입실패")
						})//fail
					})//btn
</script>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>