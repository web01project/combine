<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>


<div class="container">
<!-- 사업자회원리스트 -->
<h3>사업자회원리스트</h3>
<table class="table table-hover">
	<thead>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>이메일</th>
			<th>비밀번호</th>
			<th>전화번호</th>
			<th>나이</th>
			<th>사업자번호</th>
		</tr>
	</thead>
	
	<tbody>
		<c:forEach items="${managers }" var ="manager" varStatus="st">
		<tr>
			<td>${manager.mnum }</td>
			<td>${manager.m_name }</td>
			<td>${manager.manageremail } </td>
			<td>${manager.m_password }</td>
			<td>${manager.m_tel }</td>
			<td>${manager.m_age }
			<td>${manager.m_businessnum }
		</tr>
		</c:forEach>
	</tbody>
</table>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>