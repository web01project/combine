<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>   
<title>마이페이지</title>
<div align="right">
	<a class="btn btn-secondary btn-sm" 
		href="/user/view/${principal.user.id }">회원수정</a>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>