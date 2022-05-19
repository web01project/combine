<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<div class="container">
  <h2>회원리스트 선택</h2>
	 <button type="button" onclick="location.href='/ad/userList'"  class="btn btn-secondary btn-lg" id="ulist">일반회원리스트 </button>
	<button type="button" onclick="location.href='/ad/managerList'" class="btn btn-secondary btn-lg" id="mlist">관리자회원리스트 </button>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>