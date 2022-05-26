<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>   
<link rel="stylesheet" href="/css/mypagestyle.css">
<title>내 예약</title>

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
	<!-- ↑마이페이지 헤더 -->
	준비
	
	
	
	
</div>


<%@ include file="/WEB-INF/views/include/footer.jsp"%>