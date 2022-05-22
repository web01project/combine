<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<title>숙박 예약 사이트</title>
<!-- Masthead-->
<header class="masthead">
	<div class="container position-relative">
		<div class="row justify-content-center">
			<div class="col-xl-6">
				<div class="text-center text-white">
					<!-- Page heading-->
					<h1 class="mb-5">여행지를 검색해 보세요!</h1>
					<!-- 숙소 검색하기 -->
					<div class="search-bar">
						<i class="fas fa-search"></i> <input class="search-bar__input"
							type="search" placeholder="검색" />
					</div>
				</div>
			</div>
		</div>
	</div>
</header>




<!-- 프로모션 광고판 -->
<section></section>
<!-- Image Showcases-->
<section class="showcase">
	<div class="container-fluid p-0">
		<div class="row g-0">
			<div class="col-lg-6 order-lg-2 text-white showcase-img"
				style="background-image: url('assets/img/bg-seoul.png')"></div>
			<div class="col-lg-6 order-lg-1 my-auto showcase-text">
				<h2>Seoul</h2>
				<p class="lead mb-0">과거와 현재가 공존하며 하루가 다르게 변하는 서울을 여행하는 일은 매일이
					새롭다. 도시 한복판에서 600년의 역사를 그대로 안고 있는 아름다운 고궁들과 더불어 대한민국의 트렌드를 이끌어나가는
					예술과 문화의 크고 작은 동네들을 둘러볼 수 있는 서울은 도시 여행에 최적화된 장소다.</p>
			</div>
		</div>
		<div class="row g-0">
			<div class="col-lg-6 text-white showcase-img"
				style="background-image: url('assets/img/bg-busan.png')"></div>
			<div class="col-lg-6 my-auto showcase-text">
				<h2>Busan</h2>
				<p class="lead mb-0">우리나라 제2의 수도 부산광역시. 부산 대표 관광지로 손꼽히는 해운대는 밤에는
					마린시티의 야경이 더해져 더욱 화려한 해변이 된다. 감천문화마을은 사진 찍기에 좋으며, 매해 가을마다 개최되는 아시아
					최대 규모의 영화제인 부산국제영화제와 함께 부산의 구석구석을 즐겨보는 것도 좋다. 전통시장 투어가 있을 만큼 먹거리가
					가득한 부산의 맛기행은 필수!</p>
			</div>
		</div>
		<div class="row g-0">
			<div class="col-lg-6 order-lg-2 text-white showcase-img"
				style="background-image: url('assets/img/bg-jeju.png')"></div>
			<div class="col-lg-6 order-lg-1 my-auto showcase-text">
				<h2>Jeju</h2>
				<p class="lead mb-0">섬 전체가 하나의 거대한 관광자원인 제주도. 에메랄드빛 물빛이 인상적인 협재
					해수욕장은 제주 대표 여행지며, 파도가 넘보는 주상절리와 바다 위 산책로인 용머리 해안은 제주에서만 볼 수 있는 천혜의
					자연경관으로 손꼽힌다. 드라마 촬영지로 알려진 섭지코스는 꾸준한 사랑을 받고 있으며 한라봉과 흑돼지, 은갈치 등은 제주를
					대표하는 음식이다.</p>
			</div>
		</div>
	</div>
</section>

<section>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</section>


<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<!-- * *                               SB Forms JS                               * *-->
<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</html>
