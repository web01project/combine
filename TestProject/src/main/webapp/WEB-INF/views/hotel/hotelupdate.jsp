<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>


  <div class="container">
  <h3> 숙소수정하기</h3>
					<table> 
						<tr>
							<td><label for="h_num">관리 번호</label>
							<td><input type="text" class="form-control" id="h_num"
								placeholder="Enter hnum" name="h_num" value="${hotel.h_num }" ></td>
						</tr>
						<tr>
							<td><label for="title">숙소 이름</label></td>
							<td><input type="text" class="form-control" id="h_name"
								placeholder="Enter title" name="h_name" value="${hotel.h_name }" ></td>
						</tr>
						<tr>
							<td>숙소 주소</td>
							<td><input type="text" class="form-control" id="location1"
								name="location1" value="${hotel.location1 }" readonly="readonly"  /></td>
						</tr>
						<tr>
							<td>상세 주소</td>
							<td><input type="text" class="form-control" id="location2"
								name="location2" value="${hotel.location2 }"/></td>
						</tr>
						<tr>
							<td>우편번호</td>
							<td><input type="text" class="form-control" id="zipcode"
								name="zipcode" value="${hotel.zipcode }" readonly="readonly"/></td>
						</tr>
						<tr>
							<td><label for="upload">숙소 사진</label></td>
							<td><input type="file" class="form-control" id="upload"
								placeholder="Enter File" name="upload" value="${hotel.upload }" ></td>
						</tr>
						<tr>
							<td><label for="content">숙소 등급</label></td>
							<td>
							<label id="star1"> <input type="radio"
									class="form-check-input" name="grade" value="STAR1"
									id="grade" checked="checked">1성급
							</label>
							<label id="star2"> <input type="radio"
									class="form-check-input" name="grade" value="STAR2"
									id="grade" checked="checked">2성급
							</label>
							<label id="star3"> <input type="radio"
									class="form-check-input" name="grade" value="STAR3"
									id="grade" checked="checked">3성급
							</label>
							</td>

						</tr>
						<tr>
							<td><label for="content">숙소 정보</label></td>
							<td><textarea class="form-control"  id="content"
									name="content" >${hotel.content }</textarea></td>

						</tr>
						<tr>
							<td><label for="title">전화번호</label></td>
							<td><input type="text" class="form-control" id="h_tel"
								placeholder="Enter tel" name="h_tel" value="${hotel.h_tel }"></td>
						</tr>
						<tr>
							<td><label for="price">금액</label></td>
							<td><input type="text" class="form-control" id="price"
								placeholder="Enter price" name="price" value="${hotel.price }"></td>
						</tr>
    </table>
    <div class="form-group text-right">
  		<button type="button" class="btn btn-secondary btn-sm" id="btnModify" >수정하기</button>
      </div>
      
     </div> 
<script> 
//수정
$("#btnModify").click(function(){
	if(!confirm("정말 수정 할까요?")) return false;
	data = {
			"h_num" : $("#h_num").val(),
			"h_name" : $("#h_name").val(),
			"location1" : $("#location1").val(),
			"location2" : $("#location2").val(),
			"zipcode" : $("#zipcode").val(),
			"grade" : $("#grade").val(),
			"upload" : $("upload").val(),
			"h_tel" : $("#h_tel").val(),
			"price" : $("#price").val(),
			"content" : $("#content").val()
	}
	 $.ajax({
		 type:"put",
		 url : "/hotel/update",
		 contentType : "application/json;charset=utf-8",
		 data : JSON.stringify(data),
		 success: function(resp){
			 alert("수정완료")
			 location.href="/hotel/hotellist";
		 },
		 error : function(e){
			 alert("수정실패 : " + e);
		 }
	 }) //ajax
}) 
</script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	window.onload = function() {
		document
				.getElementById("location1")
				.addEventListener(
						"click",
						function() { //주소입력칸을 클릭하면
							//카카오 지도 발생
							new daum.Postcode(
									{
										oncomplete : function(data) { //선택시 입력값 세팅
											document
													.getElementById("location1").value = data.address; // 주소 넣기
											document.getElementById("zipcode").value = data.zonecode; // 주소 넣기
											document.querySelector(
															"input[name=location2]")
													.focus(); //상세입력 포커싱
										}
									}).open();
						});
	}
	
	
</script>
<%@ include file="../include/footer.jsp"%>
