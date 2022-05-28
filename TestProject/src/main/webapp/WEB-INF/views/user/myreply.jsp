<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<div class="wrap">
	<div class="blueContanier">
		<div>
			<c:if test="${principal.user.role == 'ROLE_ADMIN' }">
				<div class="grade" style="font-size: x-large;">ADMIN</div>
			</c:if>
			<c:if test="${principal.user.role == 'ROLE_MANAGER' }">
				<div class="grade" style="font-size: x-large;">MANAGER</div>
			</c:if>
			<c:if test="${principal.user.role == 'ROLE_USER' }">
				<div class="grade" style="font-size: x-large;">USER</div>
			</c:if>
			<div class="name">${principal.user.name } 님</div>
		</div>
		<div class="modify">
			<a class="btn btn-secondary btn-sm" 
				href="/user/view/${principal.user.id }">회원수정</a>
		</div>
	</div>
	
	
	
	
	
</div>
<%@ include file="../include/footer.jsp"%>