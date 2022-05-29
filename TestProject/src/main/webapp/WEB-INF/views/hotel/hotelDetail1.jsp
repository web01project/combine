<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<link href="/css/detail.css" rel="stylesheet" />
<div id="wapper">
	<!--헤더시작-->

	<header>
		<h3>${hotel.h_name }</h3>

		<button type="button" id="mapBtn">
			<span id="span_detail">지도에서 보기</span>

		</button>
		<span>${hotel.location1 } </span><span>${hotel.location2 } </span>
	</header>
	<!--네비게이션-->
	<div class="total">
		<nav id="nav_detail">
			<div id="mapView"></div>
			<div id="map" style="width: 100%; height: 100%;">맵정보</div>
			<div id="clickLatlng"></div>
		</nav>

		<!--콘텐츠부분-->
		<section id="section_detail">

			<img class="center" src="/resources/img/${hotel.fileimage }">
 
		</section>
		<!--사이드바-->
		<aside id="aside_detail">

			<p>리뷰</p>
			<ul>
				<li><a href="">${reply.count}개의 리뷰후기</a></li>
				
			</ul>
			<div id="replyResult"></div>
	<td><label for="content">리뷰 평점</label></td>
			<td><label id="star1"> <input type="radio"
				class="form-check-input" name="point" value="1" id="point"
				>1개
			</label> <label id="star2"> <input type="radio"
				class="form-check-input" name="point" value="2" id="point"
				>2개
			</label> <label id="star3"> <input type="radio"
				class="form-check-input" name="point" value="3" id="point"
				>3개
			</label> <label id="star3"> <input type="radio"
				class="form-check-input" name="point" value="4" id="point"
				>4개
			</label> <label id="star3"> <input type="radio"
				class="form-check-input" name="point" value="5" id="point"
				checked="checked">5개
			</label></td>
			<div id="replyResult"></div>

			<div align="center">
				<textarea rows="3" cols="25" id="msg"></textarea>

				<button type="button" class="btn btn-secondary btn-sm"
					id="btnComment">리뷰쓰기</button>

			</div>
			<hr />
			<form id="frm" action="post"></form>
			<div class="d-flex justify-content-between mt-5 mr-auto">
				<ul class="pagination">
					<c:if test="${hotels.first==false }">
						<li class="page-item"><a class="page-link"
							href="?page=${reviews.number-1 }">이전</a></li>
					</c:if>
					<c:if test="${hotels.last ==false }">
						<li class="page-item"><a class="page-link"
							href="?page=${reviews.number+1 }">다음</a></li>
					</c:if>
				</ul>
				<div></div>
			</div>
		</aside>
	</div>


</div>
<div class="parent">
	<div class="child">금액:${hotel.price }</div>
	<div class="child2">설명:${hotel.content }</div>
	<div class="child">전화번호:${hotel.h_tel }</div>
	<div class="child">
		<a href="/hotel/reservationform/${hotel.h_num }">
		<button	class="button-19">예약하기</button></a>
	</div>
</div>



<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6fa928439db918e52edfb39bd62d69f5&libraries=services,clusterer,drawing"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder
			.addressSearch(
					'${hotel.location1 }',
					function(result, status) {

						// 정상적으로 검색이 완료됐으면 
						if (status === kakao.maps.services.Status.OK) {

							var coords = new kakao.maps.LatLng(result[0].y,
									result[0].x);
							var message = 'latlng: new kakao.maps.LatLng('
									+ result[0].y + ', ';
							message += result[0].x + ')';

							var resultDiv = document
									.getElementById('clickLatlng');
							/* resultDiv.innerHTML = message; */

							// 결과값으로 받은 위치를 마커로 표시합니다
							var marker = new kakao.maps.Marker({
								map : map,
								position : coords
							});

							// 인포윈도우로 장소에 대한 설명을 표시합니다
							var infowindow = new kakao.maps.InfoWindow(
									{
										content : '<div style="width:150px;text-align:center;padding:6px 0;">${hotel.h_name}</div>'
									});
							infowindow.open(map, marker);

							// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							map.setCenter(coords);
						}
					});
	var init = function(){
		$.ajax({
			type:"get",
			url : "/reply/list/${hotel.h_num }"
		}) //ajax
		.done(function(resp){
		
			   var str="<table class='table table-hover' >"
			   $.each(resp, function(key, val){
					
				   str+="<tr>"
				    str+="<td>"+val.user.name+"</td>"
				   str+="<td>"+val.content+"</td>"
				   str+="<td>"+val.regdate+"</td>"
				   str+="<td>"+val.point+"점</td>"
				    if("${principal.user.id}"==val.user.id){
					   str+="<td><a href='javascript:fdel("+val.review_num+")'>삭제</a></td>"
				   } 
				   str+="</tr>" 
			   })
			   str +="</table>"
				  $("#replyResult").html(str);
		})  //done

	} //init
	//댓글삭제
	function fdel(review_num){
		$.ajax({
			type:"delete",
			url : "/reply/delete/"+review_num
		})
		.done(function(resp){
			alert(resp+" 번 글 삭제 성공")
			init()
		})
		.fail(function(){
			alert("댓글 삭제 실패")
		})
	}
	//지도에서 보기 클릭
	$(document).ready(function(){
	$("#mapBtn").click(function(){
		var offset = $('#mapView').offset();
		 $('html').animate({scrollTop : offset.top}, 400);
		 
	});
	});
	
	$("#btnComment").click(function() {
		if(${empty principal.user}){
			alert("로그인하세요")
			location.href="/login"
			return
		}
		if ($("#msg").val() == "") {
			alert("댓글 입력하세요")
			return;
		}
		data = {
			"content" : $("#msg").val(),
			"point" : $("input[name=point]:checked").val()
		}
		$.ajax({
			type : "post",
			url : "/reply/insert/${hotel.h_num }",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data)
		}).done(function() {
			alert("댓글추가");
			init();
		}).fail(function() {
			alert("댓글 추가 실패")
		})
	})
	$("#btnDelete").click(function(){
	if(!confirm("정말 삭제할까요?")) return
	
	$.ajax({
		type:"delete",
		url : "/hotel/delete/${hotel.h_num}",
		success: function(resp){
			if(resp=="success"){
				alert("삭제성공")
				location.href="/hotel/hotellist"
			}
		},//success
		error :function(e){
			alert("삭제실패 : " + e)
		}
	}) 
	})
	init();

</script>
<%@ include file="../include/footer.jsp"%>