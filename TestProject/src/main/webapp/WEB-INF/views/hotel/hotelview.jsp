
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<link href="/css/list.css" rel="stylesheet" />
<header class="normal">
	<div class="container position-relative">
		<div class="row justify-content-center">
			<div class="panel" align="center">
				<h4>숙소상세보기</h4>
					<table>
						<tr>
							<td><label for="h_num">관리 번호</label>
							<td><input type="text" class="form-control" id="h_num"
								 name="h_num" value="${hotel.h_num }" readonly="readonly"></td>
						</tr>
						<tr>
							<td><label for="name">숙소 이름</label></td>
							<td><input type="text" class="form-control" id="h_name"
								 name="h_name" value="${hotel.h_name }" readonly="readonly"></td>
						</tr>
						<tr>
							<td>숙소 주소</td>
							<td><input type="text" class="form-control" id="location1"
								name="location1" value="${hotel.location1 }" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>상세 주소</td>
							<td><input type="text" class="form-control" id="location2"
								name="location2" value="${hotel.location2 }" readonly="readonly"/></td>
						</tr>
						<tr>
							<td>우편번호</td>
							<td><input type="text" class="form-control" id="zipcode"
								name="zipcode" value="${hotel.zipcode }" readonly="readonly" /></td>
						</tr>
						<%-- <tr>
							<td><label for="upload">숙소 사진</label></td>
							<td><input type="image" class="form-control" id="upload"
								placeholder="Enter File" name="upload" value="${hotel.upload }"></td>
						</tr> --%>
						<tr>
							<td><label for="content">숙소 등급</label></td>
							<td><input type="text" class="form-control"  value="${hotel.grade }" readonly="readonly"></td>

						</tr>
						<tr>
							<td><label for="content">숙소 정보</label></td>
							<td>
							<textarea class="form-control" id="content" name="content"
								readonly="readonly">${hotel.content }</textarea>
						</td>
						</tr>
						<tr>
							<td><label for="title">전화번호</label></td>
							<td><input type="text" class="form-control" id="h_tel"
								 name="h_tel" value="${hotel.h_tel }" readonly="readonly"></td>
						</tr>
						<tr>
							<td><label for="price">금액</label></td>
							<td><input type="text" class="form-control" id="price"
								 name="price" value="${hotel.price }" readonly="readonly"></td>
						</tr>
			
			</table>
				
				<a href="/hotel/update/${hotel.h_num }"><button type="button" class="btn btn-primary btn-sm" >수정하기</button></a>
				<button type="button" class="btn btn-danger btn-sm" id="btnDelete">삭제</button>
			</div>
			</div>	
		
		</header>
			
	
	
	<br />
	<br />
	<br />
	<br />
	
	
	
	<div id="replyResult"></div>
	
	<div align="center">
		<textarea rows="3" cols="50" id="msg"></textarea>
		
		<button type="button" class="btn btn-secondary btn-sm" id="btnComment">리뷰쓰기</button>
		
	</div>
	<hr />
<form id ="frm" action="post">

</form>


<script>
var init = function(){
	$.ajax({
		type:"get",
		url : "/reply/list/"+$("#review_num").val()
	}) //ajax
	.done(function(resp){
		   var str="<table class='table table-hover' >"
		   $.each(resp, function(key, val){
			   str+="<tr>"
			   str+="<td>"+val.u_num+"</td>"
			   str+="<td>"+val.content+"</td>"
			   str+="<td>"+val.regdate+"</td>"
			   if("${principal.user.id}"==val.user.id){
				   str+="<td><a href='javascript:fdel("+val.cnum+")'>삭제</a></td>"
			   }
			   str+="</tr>"
		   })
		   str +="</table>"
	  $("#replyResult").html(str);
	})  //done

} //init
//댓글삭제
function fdel(cnum){
	$.ajax({
		type:"delete",
		url : "/reply/delete/"+review_num
	})
	.done(function(resp){
		alert(resp+" 번 글 삭제 성공")
		init()
	})
	.fail(function(){
		alert("댓글 삭제 실패")
	})
}

$("#btnComment").click(function() {
	if(${empty principal.user}){
		alert("로그인하세요")
		location.href="/login"
		return
	}
	if ($("#msg").val() == "") {
		alert("댓글 입력하세요")
		return;
	}
	data = {
		"review_num" : $("#review_num").val(),
		"content" : $("#msg").val(),
		
		
	}
	$.ajax({
		type : "post",
		url : "/reply/insert/${hotel.h_num }",
		contentType : "application/json;charset=utf-8",
		data : JSON.stringify(data)
	}).done(function() {
		alert("댓글추가");
		init();
	}).fail(function() {
		alert("댓글 추가 실패")
	})
})

$("#btnDelete").click(function(){
	if(!confirm("정말 삭제할까요?")) return
	$.ajax({
		type:"delete",
		url : "/hotel/delete/${hotel.h_num}",
		success: function(resp){
			if(resp=="success"){
				alert("삭제성공")
				location.href="/hotel/hotellist"
			}
		},//success
		error :function(e){
			alert("삭제실패 : " + e)
		}
	})
	})
</script>



<%@ include file="../include/footer.jsp"%>
