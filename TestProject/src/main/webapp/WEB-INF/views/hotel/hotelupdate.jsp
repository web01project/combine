<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>


  <div class="container">
  <h3>{hotel.h_name} 숙소수정하기</h3>
  <input type="hidden" name="num" id="num" value="${hotel.h_num }" />
					<table>
						<tr>
							<td><label for="h_num">관리 번호</label>
							<td><input type="text" class="form-control" id="h_num"
								placeholder="Enter hnum" name="h_num"></td>
						</tr>
						<tr>
							<td><label for="title">숙소 이름</label></td>
							<td><input type="text" class="form-control" id="h_name"
								placeholder="Enter title" name="h_name"></td>
						</tr>
						<tr>
							<td>숙소 주소</td>
							<td><input type="text" class="form-control" id="location" name="location"
								readonly /></td>
						</tr>
						<tr>
							<td>상세 주소</td>
							<td><input type="text" class="form-control" name="address2" /></td>
						</tr>
						<tr>
							<td><label for="upload">숙소 사진</label></td>
							<td><input type="file" class="form-control" id="upload"
								placeholder="Enter File" name="upload"></td>
						</tr>
						<tr>
							<td><label for="content">숙소 정보</label></td>
							<td><textarea class="form-control" rows="5" id="content"
									name="content"></textarea></td>

						</tr>
						<tr>
							<td><label for="price">금액</label></td>
							<td><input type="text" class="form-control" id="price"
								placeholder="Enter price" name="price"></td>
						</tr>
    	
    <div class="form-group text-right">
      <button type="submit" class="btn btn-primary btn-sm" id="btnModify">수정하기</button>
      </div>
      </table>
     </div> 
  </form>
</div>
<script>
//수정
$("#btnModify").click(function(){
	data = {
			"num" : $("#h_num").val(),
			"name" : $("#h_name").val(),
			"location" : $("#location").val(),
			"upload" : $("#upload").val(),
			"price" : $("#price").val()
	}
	 $.ajax({
		 type:"put",
		 url : "/hotel/hotelupdate",
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
})  //btnModify

</script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	window.onload = function() {
		document
				.getElementById("location")
				.addEventListener(
						"click",
						function() { //주소입력칸을 클릭하면
							//카카오 지도 발생
							new daum.Postcode(
									{
										oncomplete : function(data) { //선택시 입력값 세팅
											document
													.getElementById("location").value = data.address; // 주소 넣기
											document
													.querySelector(
															"input[name=address2]")
													.focus(); //상세입력 포커싱
										}
									}).open();
						});
	}
	
</script>
<%@ include file="../include/footer.jsp"%>
