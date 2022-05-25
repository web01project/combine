<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<link href="/css/detail.css" rel="stylesheet" />

<div id="wapper">
	<!--헤더시작-->

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
		<h3 style="font-size:1rem; margin :0 0 0 0;">${hotel.h_name }</h3>
		<span id="span_detail">${hotel.location1 }</span>
		<span id="span_detail">지도에서 보기</span>
		<article id="article_detail">
			<div>
				<img class="card-img-top" src="/resources/img/${hotel.fileimage }">
			</div>
			<div>
			${hotel.content }
			</div>
		</article>
	</section> 
	<!--사이드바-->
	<aside id="aside_detail">
		
			<!-- 지도를 표시할 div 영역 -->
			<div class="side_menu" id="map" style="width: 100%; height: 100%;"></div>
		
	</aside>
</div>
<div id="wrapper">
<span class="price_tag">금액</span><button class="button-19">예약하기</button>
</div>



<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6fa928439db918e52edfb39bd62d69f5"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};

	//지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);


</script>
<%@ include file="../include/footer.jsp"%>
