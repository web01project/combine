<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<div class="container">
<h2>숙소 리스트</h2>
	<div class="form-group text-right">
	<a href="hotelInsert"><button class="btn btn-secondary bt -sm">숙소 등록</button></a>
	</div>
		 <div class="row ">
			<c:forEach items="${hotels }" var="hotel">
			
				<div class="col-3 mb-3" style="width:400px">
				<div class="card" >
					<img class="card-img-top" 
						 src="/resources/img/${hotel.fileimage }" alt="Card image" style="width:100%">
						    
						    <div class ="card-body">
						     <h2 class="card-title">${hotel.h_name }</h2>
							      <span class="card-text" > 위치: ${hotel.location1}</span>
							      <p class="card-text"> 설명 : ${hotel.content }</p>
							      <p class="card-text"> 가격 : ${hotel.price }</p>
						     </div> <!--card-body  -->
					  </div> <!--card  -->
					 </div> <!-- col --> 
				</c:forEach>
</div> 
</div>


<%@ include file="../include/footer.jsp"%>
