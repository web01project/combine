
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

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
							<textarea class="form-control" id="content" name="content"
								readonly="readonly">${hotel.content }</textarea>

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
					<button type="button" class="btn btn-primary btn-sm" >수정하기</button>
				</form>
			</div>
		</div>
	</div>
</header>
<script>
var init = function(){
	$.ajax({
		type:"get",
		url : "/hotel/hotellist/"+$("#h_num").val()
	}) //ajax
	.done(function(resp){
		   var str="<table class='table table-hover' >"
		   $.each(resp, function(key, val){
			   str+="<tr>"
			   str+="<td>"+val.h_name+"</td>"
			   str+="<td>"+val.content+"</td>"
			   str+="<td>"+val.price+"</td>"
			   if("${principal.username}"==val.username){
				   str+="<td><a href='javascript:fdel("+val.cnum+")'>삭제</a></td>"
			   }
			   str+="</tr>"
		   })
		   str +="</table>"
	  $("#replyResult").html(str);
	})  //done 

}
</script>


<%@ include file="../include/footer.jsp"%>
