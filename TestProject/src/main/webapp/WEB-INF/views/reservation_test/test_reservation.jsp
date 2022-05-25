<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<div class="row row-space">
	<div class="col-2">
		<div class="input-group">
			<label class="label">체크인</label> <input
			class="input--style-1" type="text" name="depart"
			placeholder="YYYY-MM-DD" id="CheckIn" 
			onclick="javascript:a_datepicker(this);" readonly="readonly">
		</div>
	</div>
	<div class="col-2">
		<div class="input-group">
			<label class="label">체크아웃</label> <input
			class="input--style-1" type="text" name="return"
			placeholder="YYYY-MM-DD" id="CheckOut" 
			onclick="javascript:a_datepicker(this);" readonly="readonly">
		</div>
	</div>
</div>


user id : <input type="text" id="userid" value="${principal.user.id }"/>
hotel id : <input type="text" id="hotelid">
인원수 : <input type="text" id="people">
<br/>
<button type="button" class="btn btn-secondary btn-sm" id="btnReservation" >예약</button>
<br/>

<input type="text" value="${datepicker}"/>
<br/>

<c:forEach items="${reservation}" var="rsv">
	<fmt:formatDate var="rsvInDt" value="${rsv.check_in}" 
	pattern="yyyy-MM-dd"/>
	<fmt:formatDate var="rsvOutDt" value="${rsv.check_out}" 
	pattern="yyyy-MM-dd"/>
	
	체크인 : ${rsvInDt}<br/>
	체크아웃 : ${rsvOutDt}<br/>
	<!-- 체크인을 체크아웃과 같아질때까지 증가시키면서
		 datepicker 해당날짜 비활성화하기
	 -->
<!-- 
		for (var d = new Date(startdate); d <= new Date(enddate); d.setDate(d.getDate() + 1)) {
			dateRange.push($.datepicker.formatDate('yy-mm-dd', d));
		}
		return [dateRange.indexOf(dateString) == -1];
-->
	<br/>
</c:forEach>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>

<script>
/* 
function disableDate(date){
	var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
	for(i = 0; i< rsv.length; i++){
		
	}

	var dateRange = [];
	var startdate = ${rsvInDt};
	var enddate = ${rsvOutDt}
	
	for (var d = new Date(startdate); d <= new Date(enddate); d.setDate(d.getDate() + 1)) {
		dateRange.push($.datepicker.formatDate('yy-mm-dd', d));
	}
	return [dateRange.indexOf(dateString) == -1];
}
 */

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
	if(!confirm("예약 하시겠습니까?")) return false;
	data={
			"check_in" : $("#CheckIn").val(),
			"check_out" : $("#CheckOut").val(),
			"people" : $("#people").val(),
			"u_num" : $("#userid").val(),
			"h_num" : $("#hotelid").val()
	}
	$.ajax({
		type:"post",
		url:"/user/reservation",
		contentType : "application/json;charset=utf-8",
		data : JSON.stringify(data),
		success:function(resp){
			alert("예약완료")
			location.href="/user/test";
		},
		error : function(e){
			alert("예약실패 : "+e)
		}
	})
})

</script>