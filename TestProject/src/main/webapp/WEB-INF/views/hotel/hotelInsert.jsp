<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<header class="normal">
	<div class="container position-relative">
		<div class="row justify-content-center">

			<div class="panel" align="center">

				<h4>숙소등록</h4>

				<form action="hotelInsert" method="post"
					enctype="multipart/form-data">
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
							<td><input type="text" class="form-control" id="location1"
								name="location1" readonly="readonly"/></td>

						</tr>
						<tr>
							<td>상세 주소</td>
							<td><input type="text" class="form-control" id="location2"
								name="location2" /></td>
						</tr>
						<tr> <!-- 위도 경도 -->
							<td><input type="text" name="x"> <input
								type="text" name="y"></td>
						</tr>
						<tr>
							<td>우편번호</td>
							<td><input type="text" class="form-control" id="zipcode"
								name="zipcode" readonly="readonly" /></td>
						</tr>
						<tr>
							<td><label for="upload">숙소 사진</label></td>
							<td><input type="file" class="form-control" id="upload"
								placeholder="Enter File" name="upload"></td>
						</tr>
						<tr>
							<td><label for="content">숙소 등급</label></td>
							<td><label id="star1"> <input type="radio"
									class="form-check-input" name="grade" value="STAR1" id="grade"
									checked="checked">1성급
							</label> <label id="star2"> <input type="radio"
									class="form-check-input" name="grade" value="STAR2" id="grade"
									checked="checked">2성급
							</label> <label id="star3"> <input type="radio"
									class="form-check-input" name="grade" value="STAR3" id="grade"
									checked="checked">3성급
							</label></td>

						</tr>
						<tr>
							<td><label for="content">숙소 정보</label></td>
							<td><textarea class="form-control" rows="5" id="content"
									name="content"></textarea></td>

						</tr>
						<tr>
							<td><label for="title">전화번호</label></td>
							<td><input type="text" class="form-control" id="h_tel"
								placeholder="Enter tel" name="h_tel"></td>
						</tr>
						<tr>
							<td><label for="price">금액</label></td>
							<td><input type="text" class="form-control" id="price"
								placeholder="Enter price" name="price"></td>
						</tr>
 

					</table>
					<button type="submit" class="btn btn-primary btn-sm">등록하기</button>
				</form>
			</div>
		</div>
	</div>
</header>
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
