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
							<td><label for="location">숙소 위치</label></td>
							<td><input type="text" class="form-control" id="location"
								placeholder="Enter location" name="location">
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


					</table>
					<button type="submit" class="btn btn-primary btn-sm">등록하기</button>	
				</form>
			</div>
		</div>
	</div>
</header>
<%@ include file="../include/footer.jsp"%>
