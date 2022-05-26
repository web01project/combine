<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<link href="/css/detail.css" rel="stylesheet" />
<div id="wapper">
	<!--헤더시작-->
	<header>
	<h3>${hotel.h_name }</h3>

		<span id="span_detail">지도에서 보기</span>
	</header>
	<!--네비게이션-->
	<nav id="nav_detail">
		<p>리뷰</p>
		<ul>
			<li><a href="">${reply.count}개의 리뷰후기</a></li>
			<li><a href="">link</a></li>
			<li><a href="">link</a></li>
		</ul>
	</nav>
	 
	<!--콘텐츠부분-->
	<section id="section_detail">
		<article id="article_detail">
			<div>
				<img class="center" src="/resources/img/${hotel.fileimage }">
			</div>
			<p>숙소 상세정보</p>
			<div> ${hotel.content }</div>
		</article>
	</section>
	<!--사이드바-->
	<aside id="aside_detail">
		<div id="map" style="width: 100%; height: 100%;">맵정보</div>
		<div id="clickLatlng"></div>
	</aside>
</div>
<div id="wrapper">
	<span class="price_tag">금액:${hotel.price }</span>
	
	<button class="button-19">예약하기</button>
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
</script>
<%@ include file="../include/footer.jsp"%>