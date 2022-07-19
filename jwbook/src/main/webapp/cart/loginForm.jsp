<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="../resources/css/cart.css">
</head>
<body>
	<div id="container">
		<h2>로그인</h2>
		<hr>
		<!-- 사용자 이름 전송 -->
		<form action="selProduct.jsp" method="post">
			<p>
			   <input type="text" name="username">
		       <input type="submit" value="로그인">
		    </p>
		</form>
	</div>
</body>
</html>