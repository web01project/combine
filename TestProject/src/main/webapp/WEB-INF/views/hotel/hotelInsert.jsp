<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<header class="normal">
  <div class="container">
  <h3>숙소등록</h3>
  <form action="hotelInsert" method="post" enctype="multipart/form-data">
<div class="form-group">
      <label for="h_num">업주 번호:</label>
      <input type="text" class="form-control" id="h_num"  readonly="readonly" name="h_num">
    </div>    
<div class="form-group">
      <label for="title">숙소 이름:</label>
      <input type="text" class="form-control" id="h_name" placeholder="Enter title" name="h_name">
    </div>
    <div class="form-group">
      <label for="location">숙소 위치:</label>
      <input type="text" class="form-control" id="location" 
      placeholder="Enter location" name="location" >
    </div>
    <div class="form-group">
      <label for="upload">숙소 사진:</label>
      <input type="file" class="form-control" id="upload" 
      placeholder="Enter File" name="upload">
    </div>
      <div class="form-group">
      <label for="content">숙소 정보</label>
     <textarea class="form-control" rows="5" id="content" name="content"></textarea>
    </div>
<div class="form-group">
      <label for="price">금액:</label>
      <input type="text" class="form-control" id="price" 
      placeholder="Enter price" name="price" >
    </div>
    	
    <div class="form-group text-right">
      <button type="submit" class="btn btn-primary btn-sm">등록하기</button>
     </div> 
  </form>
</div>
</header>
<%@ include file="../include/footer.jsp"%>
