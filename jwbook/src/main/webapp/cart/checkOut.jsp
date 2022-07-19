<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계산 하기</title>
<link rel="stylesheet" href="../resources/css/cart.css">
</head>
<body>
	<div id="container">
		<h2>계산하기</h2>
		<p>선택한 상품 목록</p>
		<hr>
		<%
			//세션 유지
			ArrayList<String> productList = (ArrayList)session.getAttribute("productList");
		
		    //상품 목록
		    for(String product : productList)
		    	out.println(product + "<br>");
		%>
	</div>
</body>
</html>