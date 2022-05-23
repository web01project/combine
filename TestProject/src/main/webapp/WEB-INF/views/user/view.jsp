<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<title>회원수정</title>
<header class="normal">
	<div class="container position-relative">
		<div class="row justify-content-center">
			<div class="panel" align="center">
				<table>
					<h4>회원수정</h4>
					<tr>
						<td>이름(Name)</td>
						<td><input type="text" class="form-control" id="name"
							placeholder="Enter name" name="name" value="${user.name}"></td>
					</tr>
					<tr>
						<td>이메일(Email)</td>
						<td><input type="text" class="form-control" id="useremail"
							placeholder="Enter email" name="useremail" value="${user.useremail}"></td>
					</tr>

					<tr>
						<td>비밀번호(Password)</td>
						<td><input type="password" class="form-control" id="password"
							placeholder="Enter password" name="password" value="${user.password}"></td>
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
				<button class="btn btn-secondary" id="btnJoin">수정</button>
		</div>
	</div>
</div>
</header>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>