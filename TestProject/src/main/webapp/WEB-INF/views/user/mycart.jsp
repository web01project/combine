<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>   
<link rel="stylesheet" href="/css/mypagestyle.css">
<link href="/css/list.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>장바구니</title>
<!-- ↑마이페이지 헤더 -->
<div class="wrap">
	<div class="blueContanier">
		<div>
			<a href="/user/mypage/${principal.user.id }">
			<c:if test="${principal.user.role == 'ROLE_ADMIN' }">
				<div class="grade" style="font-size: x-large;">ADMIN</div>
			</c:if>
			<c:if test="${principal.user.role == 'ROLE_MANAGER' }">
				<div class="grade" style="font-size: x-large;">MANAGER</div>
			</c:if>
			<c:if test="${principal.user.role == 'ROLE_USER' }">
				<div class="grade" style="font-size: x-large;">USER</div>
			</c:if>
			<div class="name">
			<font style="color: white;">
				${principal.user.name } 님
			</font>	
			</a>
			</div>
		</div>
		<div class="modify">
			<a class="btn btn-secondary btn-sm" 
				href="/user/view/${principal.user.id }">회원수정</a>
		</div>
	</div>
	
	<div class="container">
	<!-- 내예약리스트 -->
	<table class="table table-hover">
		<thead>
			<tr align="center">
				<th colspan="3"><h2>내 장바구니 목록</h2></th>
			</tr>
		</thead>
			
		<tbody>
			<c:forEach items="${cart }" var ="cart" >
			<fmt:formatDate var="rsvInDt" value="${cart.check_in}" 
			pattern="yyyy-MM-dd"/>
			<fmt:formatDate var="rsvOutDt" value="${cart.check_out}" 
			pattern="yyyy-MM-dd"/>
			<tr>
				
				<td style="width: 200px; height: 200px;">
				<a href="/hotel/detail/${cart.hotel.h_num}">
					<img class="card-img-top" style="width: 200px; height: 200px;"
					src="/resources/img/${cart.hotel.fileimage }" alt="Card image"/>
				</a>				
				</td>
				
				<td>
			
				<a href="/hotel/detail/${cart.hotel.h_num}">
				<font size="6em" >${cart.hotel.h_name }(${rsvInDt} ~ ${rsvOutDt})
				</font><br/>
				</a>
						<font size ="5em">금액 : &#8361;${cart.hotel.price }</font><br/><br/>
						등급 
						<c:if test="${cart.hotel.grade=='STAR1' }">
							<span><i class="fa-solid fa-star"></i></span>
							<br />
						</c:if>
						<c:if test="${cart.hotel.grade=='STAR2' }">
							<span><i class="fa-solid fa-star"></i><i
								class="fa-solid fa-star"></i></span>
							<br />
						</c:if>
						<c:if test="${cart.hotel.grade=='STAR3' }">
							<span><i class="fa-solid fa-star"></i><i
								class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i></span>
							<br />
						</c:if>
						주소 : ${cart.hotel.location1}<br/>
						전화번호 : ${cart.hotel.h_tel}<br/>
						인원 : ${cart.people }<br/>
				</td>
				<td align="center">
				<div>
				<a href="javascript:cartreser(${cart.cart_num})">
				<button type="button" class="btn btn-primary">예약하기</button>
				</a>
				<a href="javascript:cartdel(${cart.cart_num })">
				<button type="button" class="btn btn-danger">삭제하기</button>
				</a>
				<br/>좋아요 : ${cart.hotel.h_like }
				</div>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<script>

function cartdel(cartnum){
	if(!confirm("정말 삭제할까요?")) return;
	$.ajax({
		type:"delete",
		url:"/user/mycartdel/"+cartnum
	})
	.done(function(resp){
		alert(resp + "번 장바구니 삭제 성공")
		location.href="/user/mycart/${principal.user.id}";
	})
	.fail(function(){
		alert("장바구니 삭제 실패")
	})
}
function cartreser(cartnum){
	if(!confirm("정말 예약할까요?")) return;
	$.ajax({
		type:"post",
		url:"/user/cartreservation/"+cartnum,
		success:function(resp){
			if(resp=="success"){
				alert("예약성공")//내예약리스트
				location.href="/user/reserlist/${principal.user.id}"
			}else{
				alert("예약중복입니다 다른날을 선택해주세요")
			}
		},
		error:function(e){
			alert("예약실패 : " + e)
		}
	})
}

</script>



<%@ include file="/WEB-INF/views/include/footer.jsp"%>