<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<div class="container">
<!-- 일반회원리스트 -->
<h3>회원리스트</h3>
<table class="table table-hover">
	<thead>
		<tr>
			<th>유저번호</th>
			<th>이름</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>나이</th>
			<th>권한</th>
			<th></th>
		</tr>
	</thead>
	
	<tbody>
		<c:forEach items="${users }" var ="user" varStatus="st">
		<tr>
			<td>${user.id }</td>
			<td>${user.name }</td>
			<td>${user.useremail } </td>
			<td>${user.tel }</td>
			<td>${user.age }</td>
			<td>${user.role }</td>
			<td><a class="btn btn-secondary btn-sm" 
					href="javascript:udel(${user.id })">삭제</a>
			</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
</div>
<script>
function udel(uid){
	if(!confirm("정말 삭제 할까요?")) return false;
	$.ajax({
		type:"delete",
		url:"/ad/delete/"+uid
	})
	.done(function(resp){
		alert("삭제성공")
		location.href="/ad/userList";
	})
	.fail(function(e){
		alert("삭제실패 : "+e)
	})
}
</script>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>