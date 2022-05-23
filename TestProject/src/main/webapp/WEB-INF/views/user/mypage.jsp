<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>   
<link rel="stylesheet" href="/css/mypagestyle.css">
<title>마이페이지</title>


<div class="wrap">
  <div class="greenContainer">
    <div>
      <div class="grade">GOLD</div>
      <div class="name">KOREA</div>
    </div>
    <div class="modify">i</div>
  </div>
  <div class="summaryContainer">
    <div class="item">
        <div class="number">354</div>
        <div>단골상점</div>
      </div>
      <div class="item">
        <div class="number">354</div>
        <div>상품후기</div>
      </div>
      <div class="item">
        <div class="number">354</div>
        <div>적립금(BLCT)</div>
      </div>
  </div>  
  <div class="shippingStatusContainer">
    <div class="title">
      주문/배송조회
    </div>
    <div class="status">
      
      <div class="item">
        <div>
          <div class="green number">6</div>
          <div class="text">장바구니</div>
        </div>
        <div class="icon"> > </div>
      </div>     
      <div class="item">
        <div>
          <div class="number">0</div>
          <div class="text">결제완료</div>
        </div>
        <div class="icon"> > </div>
      </div>     
      <div class="item">
        <div>
          <div class="green number">1</div>
          <div class="text">배송중</div>
        </div>
        <div class="icon"> > </div>
      </div>     
      <div class="item">
        <div>
          <div class="green number">3</div>
          <div class="text">구매확정</div>
        </div>
      </div>     
      
    </div>
    
  </div>  
  <div class="listContainer">
    <a href="#" class="item">
        <div class="icon">ii</div>
        <div class="text">주문목록<span class="circle"></span></div>
        <div class="right"> > </div>
    </a>
    <a href="#" class="item">
        <div class="icon">ii</div>
        <div class="text">상품후기</div>
        <div class="right"> > </div>
    </a>
    <a href="#" class="item">
        <div class="icon">ii</div>
        <div class="text">상품문의</div>
        <div class="right"> > </div>
    </a>
    <a href="#" class="item">
        <div class="icon">ii</div>
        <div class="text">단골상점</div>
        <div class="right"> > </div>
    </a>
    <a href="#" class="item">
        <div class="icon">ii</div>
        <div class="text">찜한상품</div>
        <div class="right"> > </div>
    </a>
  </div>
  <div class="listContainer">
    <a href="#" class="item">
        <div class="icon">ii</div>
        <div class="text">
          <span>내지갑</span>
          <span class="smallLight">
            <span>|</span>
            <span>보유 적립금</span>
          </span>          
        </div>                
        <div class="right">
          <span class="blct">175 BLCT</span>
          > </div>
    </a>
    <a href="#" class="item">
        <div class="icon">ii</div>
        <div class="text">알림</div>
        <div class="right"> > </div>
    </a>
    <a href="#" class="item">
        <div class="icon">ii</div>
        <div class="text">설정</div>
        <div class="right"> > </div>
    </a>   
  </div>
  <div class="infoContainer" align="center">
		<a class="btn btn-secondary btn-sm" 
			href="/user/view/${principal.user.id }">회원수정</a>
  </div>
</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>