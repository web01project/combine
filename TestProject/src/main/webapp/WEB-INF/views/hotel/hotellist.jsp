

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<link href="/css/list.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
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
		<h4>${count}개의예약가능한숙소가있습니다.</h4>
		<div class="form-group text-right"></div>
		<div class="row ">
			<c:forEach items="${hotels }" var="hotel">

				<div class="col-3 mb-3" style="width: 400px">
					<div class="card">
						<div style="position: relative;">
							<img class="card-img-top"
								src="/resources/img/${hotel.fileimage }" alt="Card image"
								width="100px" height="280px">
						</div>
						<!-- hotel like -->
						<div style="position: relative; left: 10px; top: -70px;">
							
							<button type="button" class="btn btn-secondary btn-sm"
								id="btnLike">숙소 좋아요</button>
						</div>
						<div class="card-body">
							<h2 class="card-title">${hotel.h_name }</h2>
							<span class="card-text"> 위치: ${hotel.location1 }</span><br /> <span
								class="card-text">설명 : ${hotel.content }</span><br /> <span
								class="card-text">가격 : ${hotel.price }원</span><br /> <span
								class="card-text">등급 </span>
							
							<c:if test="${hotel.grade=='STAR1' }">
								<span><i class="fa-solid fa-star"></i></span><br/>
							</c:if>

							<c:if test="${hotel.grade=='STAR2' }">
								<span><i class="fa-solid fa-star"></i><i
									class="fa-solid fa-star"></i></span><br/>
							</c:if>
							<c:if test="${hotel.grade=='STAR3' }">
								<span><i class="fa-solid fa-star"></i><i
									class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i></span><br/>
							</c:if>
							<span class="card-text"> 좋아요 : ${hotel.h_like }</span> <a
								href="/hotel/detail/${hotel.h_num }"><button
									class="button-19">선택하기</button></a>
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
</Section>
<script>

 //좋아요 증가
 $("#btnLike").click(function(){
	 if(${empty principal.user}){
			alert("로그인하세요")
			location.href="/login"
			return
		}
	 data = {
		"h_like" :$("#h_like").val(),
		"h_num" :$("#h_num").val(),
	 }
	 $.ajax({
		 type:"post",
		 url : "/hotel/like/?",
		 contentType : "application/json;charset=utf-8",
		 data : JSON.stringify(data)
		}).done(function() {
			alert("댓글추가");
			init();
		}).fail(function() {
			alert("댓글 추가 실패")
		})
 }//btnlike
    
</script>


<%@ include file="../include/footer.jsp"%>
