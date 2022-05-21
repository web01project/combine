<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<div class="container">
<c:if test="${not empty errorMsg }">
   ${errorMsg}
</c:if>
	<h3>로그인</h3>
	<form action="/login" method="post">
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
		<button class="btn btn-primary">로그인</button>
	</div>
	</form>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>