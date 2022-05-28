<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>   
<link rel="stylesheet" href="/css/mypagestyle.css">
<title>마이페이지</title>


<div class="wrap">
	<div class="blueContanier">
		<div>
			<c:if test="${principal.user.role == 'ROLE_ADMIN' }">
				<div class="grade" style="font-size: x-large;">ADMIN</div>
			</c:if>
			<c:if test="${principal.user.role == 'ROLE_MANAGER' }">
				<div class="grade" style="font-size: x-large;">MANAGER</div>
			</c:if>
			<c:if test="${principal.user.role == 'ROLE_USER' }">
				<div class="grade" style="font-size: x-large;">USER</div>
			</c:if>
			<div class="name">${principal.user.name } 님</div>
		</div>
		<div class="modify">
			<a class="btn btn-secondary btn-sm" 
				href="/user/view/${principal.user.id }">회원수정</a>
		</div>
	</div>
	<div class="summaryContainer">
		<div class="item">
			<a href="#" >
			<div class="number">0</div>
			<div>단골호텔</div>
			</a>
		</div>	
		<div class="item">
			<a href="#" >
			<div class="number">0</div>
			<div>호텔후기</div>
			</a>
		</div>
		<div class="item">
			<a href="#" >
			<div class="number">0</div>
			<div>찜한호텔</div>
			</a>
		</div>
	</div>  
	
	<div class="shippingStatusContainer">
	    <div class="title">
	      장바구니/예약조회
	    </div>
	    
    	<div class="status">
			<div class="item">
				<a href="#" >
				<div>
					<div class="green number">0</div>
					<div class="text">장바구니</div>
				</div>
				</a>
		</div>
		
		<div class="icon" style="font-size: 25px;"> ＞ </div>
		
		<div class="item">
			<a href="/user/reserlist/${principal.user.id}" >
			<div>
				<div class="number">${count }</div>
				<div class="text">결제완료</div>
			</div>
			</a>
		</div>
		
		<div class="icon" style="font-size: 25px;"> > </div>
		
		<div class="item">
			<a href="#" >
			<div>
				<div class="green number">0</div>
				<div class="text">호텔후기</div>
			</div>
			</a>
		</div>
		
		</div>
	</div>  
	<div class="listContainer">
		<a href="/user/reserlist/${principal.user.id}" class="item">
	        <div class="icon">ii</div>
	        <div class="text">예약목록<span class="circle"></span></div>
	        <div class="right"> > </div>
		</a>
	    <a href="#" class="item">
	        <div class="icon">ii</div>
	        <div class="text">호텔후기</div>
	        <div class="right"> > </div>
	    </a>
	    <a href="#" class="item">
	        <div class="icon">ii</div>
	        <div class="text">찜한호텔</div>
	        <div class="right"> > </div>
	    </a>
	    <c:if test="${principal.user.role == 'ROLE_MANAGER' }">
	    <a href="/user/myhotel/${principal.user.id }" class="item">
	        <div class="icon">ii</div>
	        <div class="text">호텔관리</div>
	        <div class="right"> > </div>
	    </a>
	    </c:if>
	</div>
	
	<div class="listContainer">
		<a href="/user/reserlist/${principal.user.id}" class="item">
			<div class="icon">ii</div>
			<div class="text">
				<span>내지갑</span>
				<span class="smallLight">
					<span>|</span>
					<span>결제내역</span>
				</span>
			</div>
			<div class="right">
			<span class="blct">&#8361; ${price }</span>
			> </div>
		</a>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>