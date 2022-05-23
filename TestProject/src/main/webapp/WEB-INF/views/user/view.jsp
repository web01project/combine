<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<title>회원수정</title>
<input type="hidden" value="${user.id}" id="id">
<header class="normal">
	<div class="container position-relative">
		<div class="row justify-content-center">
			<div class="panel" align="center">
				<table>
					<h4>회원수정</h4>
					<tr>
						<td>이메일(Email)</td>
						<td><input type="text" class="form-control" id="useremail"
							placeholder="Enter email" name="useremail" value="${user.useremail}" readonly="readonly"></td>
					</tr>					
					<tr>
						<td>이름(Name)</td>
						<td><input type="text" class="form-control" id="name"
							placeholder="Enter name" name="name" value="${user.name}" ></td>
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
							name="pwd_check" value="${user.password}"></td>
					</tr>
					<tr>
						<td>나이(Age)</td>
						<td><input type="text" class="form-control" id="age"
							placeholder="Enter age" name="age" value="${user.age}"></td>
					</tr>
					<tr>
						<td>전화번호(Tel)</td>
						<td><input type="text" class="form-control" id="tel"
							placeholder="Enter tel" name="tel" value="${user.tel}"></td>
					</tr>
					<c:if test="${user.role == 'ROLE_MANAGER' }">
						<tr>
							<td>사업자번호</td>
							<td>
								<input type="text" class="form-control" id="businessnum"
								placeholder="Enter business" name="businessnum" value="${user.businessnum }">
							</td>
						</tr>
					</c:if>
				</table>
				<button class="btn btn-secondary" id="btnModify">수정</button>
				<button class="btn btn-danger" id="btnDelete">회원탈퇴</button>
		</div>
	</div>
</div>
</header>

<script>
$("#btnModify").click(function(){
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
	if(!confirm("정말 수정 할까요?")) return false;
	data={
		"id":$("#id").val(),
		"name":$("#name").val(),
		"useremail":$("#useremail").val(),
		"password":$("#password").val(),
		"age":$("#age").val(),
		"tel":$("#tel").val(),
		"businessnum":$("#businessnum").val()
	}
	$.ajax({
		type:"put",
		url:"/user/update",
		contentType:"application/json;charset=utf-8",
		data:JSON.stringify(data)
	})
	.done(function(resp){
		if(resp=="success"){
			alert("수정성공")
			location.href="/logout"
		}else{
			alert("수정오류")
		}
	})
	.fail(function(){
		alert("수정실패")
	})
})

$("#btnDelete").click(function(){
	if(!confirm("정말 탈퇴하시겠습니까?")) return false;
	$.ajax({
		type:"delete",
		url:"/user/delete/${user.id}"
	})
	.done(function(resp){
		if(resp=="success"){
			alert("탈퇴완료")
			location.href="/logout"
		}else{
			alert("탈퇴오류")
		}
	})
	.fail(function(){
		alert("탈퇴실패")
	})
})

</script>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>