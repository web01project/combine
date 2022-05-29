<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>   
<link rel="stylesheet" href="/css/mypagestyle.css">
<link href="/css/list.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
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
			<div class="name">
			<a href="/user/mypage/${principal.user.id }" style="color: white;">
			${principal.user.name } 님
			</a>
			</div>
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
			<c:forEach items="${myhotel }" var ="hotel">
			<tr>			
				<td style="width: 200px; height: 200px;">
				<a href="/hotel/detail/${hotel.h_num}">
					<img class="card-img-top" style="width: 200px; height: 200px;"
					src="/resources/img/${hotel.fileimage }" alt="Card image"/>
				</a>
				</td>
				
				<td>
			
				<a href="/hotel/detail/${hotel.h_num}">
				<font size="6em" >${hotel.h_name }
				</font><br/>
				</a>
						<font size ="5em">금액 : &#8361;${hotel.price }</font><br/><br/>
						등급 
						<c:if test="${hotel.grade=='STAR1' }">
							<span><i class="fa-solid fa-star"></i></span>
							<br />
						</c:if>
						<c:if test="${hotel.grade=='STAR2' }">
							<span><i class="fa-solid fa-star"></i><i
								class="fa-solid fa-star"></i></span>
							<br />
						</c:if>
						<c:if test="${hotel.grade=='STAR3' }">
							<span><i class="fa-solid fa-star"></i><i
								class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i></span>
							<br />
						</c:if>
						주소 : ${hotel.location1}<br/>
						전화번호 : ${hotel.h_tel}<br/>
						좋아요 : ${hotel.h_like }
				</td>
				<td align="right">
					<div>
					<a href="/hotel/view/${hotel.h_num }">
					<button class="btn btn-secondary btn-sm">수정하기</button>
					</a>
					</div>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>