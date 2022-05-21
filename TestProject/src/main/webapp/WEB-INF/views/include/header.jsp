<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>숙박 예약 사이트</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" type="text/css" />
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/css/styles.css" rel="stylesheet" />
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<body>
	<!-- Navigation-->
	<nav class="navbar navbar-light bg-light static-top">
		<div class="container">
			<div >
<!-- 왼쪽 -->
				<ul class="navbar-nav text-uppercase left py-4 py-lg-0">
					<li class="nav-item"><a class="nav-link" href="/">홈</a></li>
					<li class="nav-item"><a class="nav-link" href="/ad/listForm">회원리스트</a></li>
				</ul>
			</div>
			<!-- 오른쪽  -->
			<div>
				<ul class="navbar-nav text-uppercase py-4 py-lg-0">
					<sec:authorize access="isAnonymous()">
						<a class="btn btn-primary" href="/login">로그인</a>
						<a class="btn btn-primary" href="/register">회원가입</a>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<li class="nav-item">${principal.user.useremail}님 반갑습니다</li>
						<li class="nav-item"><a class="navbar-brand"
							href="/hotel/hotelInsert">숙소등록</a></li>
						<li class="nav-item"><a class="navbar-brand" href="/logout">
								로그아웃 </a></li>
						<li class="nav-item"><a class="navbar-brand" href="/hotel/hotellist">
								숙소리스트 </a></li>
					</sec:authorize>
				</ul>
			</div>

		</div>
	</nav>