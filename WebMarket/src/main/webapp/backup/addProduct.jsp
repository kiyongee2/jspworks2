<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" 
	  integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="./resources/js/validation.js"></script>
</head>
<body>
	<%@ include file = "menu.jsp" %>
	<div class = "jumbotron">
		<div class = "container">
			<h1 class="display-3">상품 등록</h1>
		</div>
	</div>
	<div class="container">
		<form name="newProduct" action="./processAddProduct.jsp" 
			  class="form-horizontal" method="post">
			  <div class="form-group row">
			  	<label class="col-sm-2">상품 코드</label>
				<div class="col-sm-3">
					<input type="text" id="productId" name="productId" class="form-control">
				</div>
			  </div>
			  <div class="form-group row">
			  	<label class="col-sm-2">상품명</label>
				<div class="col-sm-3">
					<input type="text" id="pname" name="pname" class="form-control">
				</div>
			  </div>
			  <div class="form-group row">
			  	<label class="col-sm-2">가격</label>
				<div class="col-sm-3">
					<input type="text" id="unitPrice" name="unitPrice" class="form-control">
				</div>
			  </div>
			  <div class="form-group row">
			  	<label class="col-sm-2">상품 설명</label>
				<div class="col-sm-5">
					<textarea id="description" name="description" cols="50" rows="2" 
					 class="form-control"></textarea>
				</div>
			  </div>
			  <div class="form-group row">
			  	<label class="col-sm-2">제조사</label>
				<div class="col-sm-3">
					<input type="text" id="manufacturer" name="manufacturer" class="form-control">
				</div>
			  </div>
			  <div class="form-group row">
			  	<label class="col-sm-2">분류</label>
				<div class="col-sm-3">
					<input type="text" id="category" name="category" class="form-control">
				</div>
			  </div>
			  <div class="form-group row">
			  	<label class="col-sm-2">재고 수</label>
				<div class="col-sm-3">
					<input type="text" id="unitsInStock" name="unitsInStock" class="form-control">
				</div>
			  </div>
			  <div class="form-group row">
			  	<label class="col-sm-2"></label>
				<div class="col-sm-5">
					<input type="radio" name="condition" value="New "> 신규 제품
					<input type="radio" name="condition" value="Old "> 중고 제품
					<input type="radio" name="condition" value="Refurbished ">재생 제품
				</div>
			  </div>
			  <div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="등록">
				</div>
			  </div>
		</form>
	</div>
</body>
</html>