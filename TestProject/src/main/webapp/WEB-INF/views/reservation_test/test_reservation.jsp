<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<div class="row row-space">
	<div class="col-2">
		<div class="input-group">
			<label class="label">체크인</label> <input
			class="input--style-1" type="text" name="depart"
			placeholder="YYYY-MM-DD" id="datepicker" 
			onclick="javascript:a_datepicker(this);" readonly="readonly">
		</div>
	</div>
	<div class="col-2">
		<div class="input-group">
			<label class="label">체크아웃</label> <input
			class="input--style-1" type="text" name="return"
			placeholder="YYYY-MM-DD" id="datepicker2" 
			onclick="javascript:a_datepicker(this);" readonly="readonly">
		</div>
	</div>
</div>

<c:forEach var="rsv" items="${reservation}">
	<fmt:formatDate var="rsvInDt" value="${rsv.check_in}" 
	pattern="YYYY-MM-dd"/>
	<fmt:formatDate var="rsvOutDt" value="${rsv.check_out}" 
	pattern="YYYY-MM-dd"/>
	
	체크인 : ${rsvInDt}<br/>
	체크아웃 : ${rsvOutDt}<br/>
	var startdate = "${rsvInDt}"<br/>
	var enddate = "${rsvOutDt}";<br/>

	for (var d = new Date(startdate); d <= new Date(enddate); d.setDate(d.getDate() + 1)) {
		dateRange.push($.datepicker.formatDate('yy-mm-dd', d));
	}
	return [dateRange.indexOf(dateString) == -1];
	<br/>
</c:forEach>

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

function disableDates(){
	
}
</script>