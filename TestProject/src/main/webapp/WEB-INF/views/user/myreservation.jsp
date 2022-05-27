<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>   
<link rel="stylesheet" href="/css/mypagestyle.css">
<title>내 예약</title>
<!-- ↑마이페이지 헤더 -->
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

	<div class="container">
	<!-- 내예약리스트 -->
	<table class="table table-hover">
		<thead>
			<tr align="center">
				<th colspan="3"><h2>내 예약 목록</h2></th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${reservations }" var ="rev" varStatus="st">
			<tr>
				<td ><img class="card-img-top"
								src="/resources/img/${rev.hotel.fileimage }" alt="Card image"
								width="" height="200px"/></td>
				<td><font size="5em" >${rev.hotel.h_name }</font><br/>
						주소 : ${rev.hotel.location1}<br/>
						전화번호 : ${rev.hotel.h_tel}<br/>
						체크인 시간 : ${rev.check_in}<br/>
						체크아웃 시간 : ${rev.check_out}<br/>
						인원 : ${rev.people }<br/>
						금액 : ${rev.hotel.price }<br/>
						좋아요 : ${rev.hotel.h_like }
				</td>
				<td align="center">
				<div>
				<button class="btn btn-secondary btn-sm">자세히보기</button>
				</div>
				<div>
				좋아요 : ${rev.hotel.h_like }
				</div>
				</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</div>


<%@ include file="/WEB-INF/views/include/footer.jsp"%>