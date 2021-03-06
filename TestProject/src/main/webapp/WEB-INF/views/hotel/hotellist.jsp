

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
		<form class="form-inline" action="/hotel/hotellist" method="get">
		
			<input type="hidden" name='field' value="location1">
			
			<select name='field2' class="form-control mr-sm-1">
				<option value="price">금액</option>
			</select>
			
			<input type="text" name="word" value="${word }"/>
			<button class='btn btn-secondary'>정렬하기</button>
		</form>

	</div>


</section>
<Section>
	<div class="container">
		<h4>${count}개의예약가능한숙소가있습니다.</h4>
		<div class="form-group text-right"></div>
		<div class="row ">
			<c:forEach items="${hotels.content }" var="hotel">

				<div class="col-3 mb-3" style="width: 400px">
					<div class="card">
						<div style="position: relative;">
							<img class="card-img-top"
								src="/resources/img/${hotel.fileimage }" alt="Card image"
								width="100px" height="280px">
						</div>
						
						<div class="card-body">
							<h2 class="card-title">${hotel.h_name }</h2>
							<span class="card-text"> 위치: ${hotel.location1 }</span><br /> <span
								class="card-text">설명 : ${hotel.content }</span><br /> <span
								class="card-text">가격 : ${hotel.price }원</span><br /> <span
								class="card-text">등급 </span>

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
							<a href="/hotel/detail/${hotel.h_num }"><button
									class="button-19">선택하기</button></a>
						</div>
						<!--card-body  -->

					</div>
					<!--card  -->
				</div>
				<!-- col -->
			</c:forEach>
			<div class="d-flex justify-content-between mt-5 mr-auto">
				<ul class="pagination">
					<c:if test="${hotels.first==false }">
						<li class="page-item"><a class="page-link"
							href="?page=${hotels.number-1 }">이전</a></li>
					</c:if>
					<c:if test="${hotels.last ==false }">
						<li class="page-item"><a class="page-link"
							href="?page=${hotels.number+1 }">다음</a></li>
					</c:if>
				</ul>
				<div></div>
			</div>
</Section>
<script>
/* 	$(document).ready(function() {

		var heartval = $
		{
			heart
		}
		; 


		//좋아요 처리
		if (heartval > 0) {
			console.log(heartval);
			$("#heart").prop("src", "../resources/img/like2.png");
			$(".heart").prop('name', heartval)
		} else {
			console.log(heartval);
			$("#heart").prop("src", "../resources/img/like2.png");
			$(".heart").prop('name', heartval)
		}

		$(".heart").on("click", function() {
			
			alert($("heart").val());
		
			if(${empty principal.user}){
				alert("로그인하세요")
				location.href="/login"
				return
			}
			var that = $(".heart");

			var sendData = {
		            'h_num' : $(that).data("h_num"),
		            /* 'heart' : that.prop('data-name') */
		 /*            'h_like' : $(that).data("h_like")
		         };
			$.ajax({
				url : '/hotel/heart/' + $(that).data("h_num"),
				type : 'POST',
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify(sendData),

				success : function(data) {
					that.prop('name', data);
					if (data == 1) {
						$('#heart').prop("src", "../resources/img/like2.png");
					} else {
						$('#heart').prop("src", "../resources/img/like1.png");
					}
  
				}
			}); //ajax
		});
	}); //function */
</script>


<%@ include file="../include/footer.jsp"%>
