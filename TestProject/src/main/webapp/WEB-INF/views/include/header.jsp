<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

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

<!-- principal로 유저정보 연결 -->
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>

</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 달력 -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<body>
	<!-- Responsive navbar-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-black">
		<div class="container">
			<a class="navbar-brand" href="/">Home</a>
			<c:if test="${principal.user.role == 'ROLE_ADMIN'}" >
				<a class="navbar-brand" href="/ad/userList">회원리스트</a>
			</c:if>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<sec:authorize access="isAnonymous()">
						<li class="nav-item"><a class="nav-link" href="/login">로그인</a></li>
						<li class="nav-item"><a class="nav-link" href=" /register">회원가입</a></li>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<c:if test="${principal.user.role == 'ROLE_MANAGER'}" >
							<li class="dropdown"><a class="nav-link"
							href="/hotel/hotelInsert">숙소등록</a></li>
						</c:if>
						<li class="nav-item"><a class="nav-link"
							href="/hotel/hotellist"> 숙소리스트 </a></li>
						<li class="nav-item"><a class="nav-link" href="/logout">
								로그아웃 </a></li>
						<li class="nav-item"><a class="nav-link"
							href="/user/mypage">${principal.user.name}님 반갑습니다!</a></li>
					</sec:authorize>
				</ul>
			</div>
		</div>
	</nav>