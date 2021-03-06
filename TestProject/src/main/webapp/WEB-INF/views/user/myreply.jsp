<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" href="/css/mypagestyle.css">
<div class="wrap">
	<div class="blueContanier">
		<div>
			<a href="/user/mypage/${principal.user.id }">
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
			<font style="color: white;">
				${principal.user.name } 님
			</font>	
			</a>
			</div>
			
		</div>
		<div class="modify">
			<a class="btn btn-secondary btn-sm" 
				href="/user/view/${principal.user.id }">회원수정</a>
		</div>
	</div>
	<!-- 내 후기 리스트 -->
	<div class="container">
	<!-- 내예약리스트 -->
	<table class="table table-hover">
		<thead>
			<tr align="center">
				<th colspan="3"><h2>내 후기 목록</h2></th>
			</tr>
		</thead>
			
		<tbody>
			<c:forEach items="${myreply }" var ="review">
			<tr>			
				<td style="width: 200px; height: 200px;">
				<a href="/hotel/detail/${review.hotel.h_num}">
					<img class="card-img-top" style="width: 200px; height: 200px;"
					src="/resources/img/${review.hotel.fileimage }" alt="Card image"/>
				</a>
				</td>
				
				<td>
			
				<a href="/hotel/detail/${review.hotel.h_num}">
				<font size="6em" >${review.hotel.h_name }
				</font><br/>
				</a>
						<font size ="5em">${review.content }</font><br/><br/>
				</td>
				<td align="right">
					<div>
					<a href="javascript:fdel(${review.review_num })">
						<button type="submit" class="btn btn-danger btn-sm">삭제하기</button>
					</a>
					</div>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	
</div>

<script>
function fdel(review_num){
	if(!confirm("정말 삭제할까요?")) return;
	$.ajax({
		type:"delete",
		url : "/reply/delete/"+review_num
	})
	.done(function(resp){
		alert(resp+" 번 글 삭제 성공")
		location.href="/user/myreply/${principal.user.id}"
	})
	.fail(function(){
		alert("댓글 삭제 실패")
	})
}
</script>

<%@ include file="../include/footer.jsp"%>