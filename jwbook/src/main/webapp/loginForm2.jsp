<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
</head>
<body>
	<form action="login2" method="post">
		<p>
			<label for="userid">아이디: </label>
			<input type="text" id="userid" name="userid">
		</p>
		<p>
			<label for="passwd">패스워드: </label>
			<input type="password" id="passwd" name="passwd">
		</p>
		<p><input type="hidden" name="phone" value="010-7979-3355">
		
		<p><input type="submit" value="전송"></p>
	</form>
</body>
</html>