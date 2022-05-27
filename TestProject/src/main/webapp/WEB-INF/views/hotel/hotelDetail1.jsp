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
		<div id="replyResult"></div>
	
	<div align="center">
		<textarea rows="3" cols="25" id="msg"></textarea>
		
		<button type="button" class="btn btn-secondary btn-sm" id="btnComment">리뷰쓰기</button>
		
	</div>
	<hr />
<form id ="frm" action="post">

</form>
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
	<a href="/hotel/reservationform/${hotel.h_num }">
	<button class="button-19" >예약하기</button>	
	</a>
	<button class="button-19" id="btnDelete">삭제하기</button>
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
			"h_num": ${hotel.h_num }
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
</script>
<%@ include file="../include/footer.jsp"%>