<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<div class="container">
<h2>숙소 리스트</h2>
	<div class="form-group text-right">
	<a href="fileInsert"><button class="btn btn-secondary bt -sm">파일 글쓰기</button></a>
	</div>
		 <div class="row ">
				<c:forEach items="${files }" var="fboard">
				    <div class="col-3 mb-3" style="width:400px">
					  <div class="card">
						    <img class="card-img-top" 
						    src="/resources/img/${fboard.fileimage }" alt="Card image" style="width:100%">
						    <div class="card-body">
							      <h4 class="card-title">title : ${fboard.title }</h4>
							      <p class="card-text"> writer : ${fboard.writer }</p>
							      <p class="card-text"> content : ${fboard.content }</p>
						     </div> <!--card-body  -->
					  </div> <!--card  -->
					 </div> <!-- col --> 
				</c:forEach>

</div>
</div>


<%@ include file="/WEB-INF/views/include/footer.jsp"%>