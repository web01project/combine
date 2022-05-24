

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<link href="/css/list.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<section class="filters">
	<h2>category filter</h2>
	<div class="category_menu">
		<form class="form-inline" action="/hotellist" method="get">
			<select name='field' class="form-control mr-sm-1">
				<option value="price">금액</option>
				<option value="grade">평점</option>
			</select>
			<button class='btn btn-secondary'>정렬하기</button>
		</form>

	</div>


</section>
<Section>
	<div class="container">
		<h4>${count}개의 예약가능한 숙소가 있습니다.</h4>
		<div class="form-group text-right"></div>
		<div class="row ">
			<c:forEach items="${hotels }" var="hotel">

				<div class="col-3 mb-3" style="width: 400px">
					<div class="card">
						 <img class="card-img-top"
							src="/resources/img/${hotel.fileimage }" alt="Card image"
							width="100px" height="280px">

						<div class="card-body">
							<h2 class="card-title">${hotel.h_name }</h2>
							<span class="card-text"> 위치: ${hotel.location1 }</span><br/>
							<span class="card-text">설명 : ${hotel.content }</span><br/>
							<span class="card-text">가격 : ${hotel.price }원</span><br/>
							<span class="card-text">등급 </span>
							<c:if test="${hotel.grade=='STAR1' }">
							<span><i class="fa-solid fa-star"></i></span>
							</c:if>
							<c:if test="${hotel.grade=='STAR2' }">
							<span><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i></span>
							</c:if>
							<c:if test="${hotel.grade=='STAR3' }">
							<span><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i></span>
							</c:if>
							
					
							<c:if test="${principal.user.role == 'ROLE_MANAGER'}">
								<a href="/hotel/view/${hotel.h_num }"><button
										class="button-19">수정하기</button></a>
							</c:if>
						</div>
						<!--card-body  -->
					</div>
					<!--card  -->
				</div>
				<!-- col -->
			</c:forEach>
		</div>
	</div>
</Section>
<script>
<a class="btn btn-secondary btn-sm" 
    href="javascript:udel(${hotel.h_num })">삭제
function udel(uid){
if(!confirm("정말 삭제 할까요?")) return false;
$.ajax({
		type:"get",
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


<%@ include file="../include/footer.jsp"%>
