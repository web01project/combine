<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<div class="container">
<!-- 일반회원리스트 -->
<h3>일반회원리스트</h3>
<table class="table table-hover">
	<thead>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>이메일</th>
			<th>비밀번호</th>
			<th>전화번호</th>
			<th>나이</th>
		</tr>
	</thead>
	
	<tbody>
		<c:forEach items="${users }" var ="user" varStatus="st">
		<tr>
			<td>${user.u_num }</td>
			<td>${user.username }</td>
			<td>${user.u_email } </td>
			<td>${user.u_password }</td>
			<td>${user.u_tel }</td>
			<td>${user.age }
		</tr>
		</c:forEach>
	</tbody>
</table>
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>