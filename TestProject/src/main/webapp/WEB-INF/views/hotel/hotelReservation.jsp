<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link href="/css/main.css" rel="stylesheet" />
<input type="hidden" value="${hotel.h_num}" id=""/>
<input type="hidden" value= "${principal.user.id }" id="userid">

<header class="masthead">
	<div class="container position-relative">
		<div class="page-wrapper bg-img-3 p-t-240 p-b-120">
			<div class="wrapper wrapper--w900">
				<div class="card card-6">
					<div class="card-body">
						<form method="" action="/hotel/hotellist">
<div class="row row-space">
	<div style="width: 100%; display: table;">
	<!-- 체크인달력 -->
		<div style="display: table-row; height: 100px; border: solid;">
		<div style="width: 50%; display: table-cell;">
			<div class="col-1">
				<div class="input-group">
					<label class="label">체크인</label> <input
					class="input--style-1" type="text" name="depart"
					placeholder="YYYY-MM-DD" id="CheckIn" 
					onclick="javascript:a_datepicker(this);" readonly="readonly">
				</div>
			</div>
			<br/>
			<!-- 체크아웃달력 -->
			<div class="col-1">
				<div class="input-group">
					<label class="label">체크아웃</label> <input
					class="input--style-1" type="text" name="return"
					placeholder="YYYY-MM-DD" id="CheckOut" 
					onclick="javascript:a_datepicker(this);" readonly="readonly">
				</div>
			</div>	
			<br/>
			<!-- 인원수넣기 -->
			<div class="col-1">
				<div class="input-group">
					<label class="label">인원수</label><input
					class="input--style-1" id="people">
					
				</div>
			</div>
			<br/>
			<div class="col-1">
				<button class="btn-submit m-b-0" type="button" id="btnReservation" >예약</button>
			</div>
		</div>

		<div style="display: table-cell;">
				<h1 style="color: white;">${hotel.h_name }</h1><br/>
				<h2 style="color: white;">예약 현황</h2><br/>
			<font color="white" size="5">
				<!-- 체크인 체크아웃 확인 -->
				<c:forEach items="${reservation}" var="rsv">
					<fmt:formatDate var="rsvInDt" value="${rsv.check_in}" 
					pattern="yyyy-MM-dd"/>
					<fmt:formatDate var="rsvOutDt" value="${rsv.check_out}" 
					pattern="yyyy-MM-dd"/>
					
					예약일 : ${rsvInDt} ~ ${rsvOutDt}
				<br/>
				</c:forEach>
			</font>
		</div>
		</div>
	</div>
</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>

<script>

function a_datepicker(obj){
	$(obj).datepicker({
		changeMonth: true,
		dayNames:['월요일','화요일','수요일','목요일','금요일','토요일','일요일'],
		dayNamesMin:['월','화','수','목','금','토','일'],
		monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		changeYear:true,
		buttonText:"Select date",
		nextText:'다음 달',
		prevText:'이전 달',
		showButtonPanel:true,
		currentText:'오늘 날짜',
		closeText:'닫기',
		dateFormat:'yy-mm-dd'
	}).datepicker("show");
}

$("#btnReservation").click(function(){
	if($("#userid").val()==""){
		alert("로그인하세요");
		location.href="/login";
		return false;
	}
	if($("#CheckIn").val() == ""){
		alert("체크인날짜를 선택하세요.")
		return false;
	}
	if($("#CheckOut").val() == ""){
		alert("체크아웃날짜를 선택하세요.")
		return false;
	}
	if($("#CheckIn").val() > $("#CheckOut").val()){
		alert("체크인 체크아웃 날짜를 확인하세요")
		return false;
	}
	if($("#poeple").val() == ""){
		alert("인원을 체크하세요")
		return false;
	}
	if(!confirm("예약 하시겠습니까?")) return false;
	
	data={
			"check_in" : $("#CheckIn").val(),
			"check_out" : $("#CheckOut").val(),
			"people" : $("#people").val()
	}
	$.ajax({
		type:"post",
		url:"/hotel/reservation/${hotel.h_num}",
		contentType : "application/json;charset=utf-8",
		data : JSON.stringify(data)
	})
	.done(function(resp){
		if(resp == "success"){
			alert("예약 성공")
			location.href="/hotel/reservationform/${hotel.h_num}";
		}else{
			alert("예약 중복")
		}
	})
	.fail(function(){
		alert("예약 오류")
	})
})

</script>