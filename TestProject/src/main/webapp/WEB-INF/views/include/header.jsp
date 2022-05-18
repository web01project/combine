<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
</head>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>
<body>
	<div class="jumbotron text-center" style="margin-bottom: 0">
		<h1>Hotel ManageSystem</h1>
	</div>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark mb-3">
		<div class="container">
			<!--왼쪽 -->
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="navbar-brand" href="/board/list">HOME</a>
				</li>
				<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				 <form class="form-inline" action="#">
				 <input class="form-control" type="text" placehoder="검색어">
				 <button class="btn btn-success" type="submit">찾기</button>
				 </form>
				</nav>
				
			</ul>
			<!-- 오른쪽 -->
			<ul class="navbar-nav">
				<sec:authorize access="isAnonymous()">
					<li class="nav-item"><a class="navbar-brand" href="/join">회원가입</a></li>
					<li class="nav-item"><a class="navbar-brand" href="/login">로그인</a></li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<li class="nav-item"><a class="navbar-brand" href="/logout">
							로그아웃(${principal.user.username}) /<sec:authentication
								property="principal.user.username" />
					</a></li>
				</sec:authorize>
			</ul>
//

		</div>
	</nav>