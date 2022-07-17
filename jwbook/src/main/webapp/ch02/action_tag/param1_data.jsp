<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>param 액션 태그</title>
</head>
<body>
	<p>아이디: <%= request.getParameter("id") %></p>
	<p>패스워드: <%= request.getParameter("pwd") %></p>
</body>
</html>