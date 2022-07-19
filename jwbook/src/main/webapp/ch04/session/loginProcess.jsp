<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리</title>
</head>
<body>
	<h2>로그인 처리 페이지</h2>
	<%
		Boolean isLogin = false;
		if(session.getAttribute("login") != null){
			isLogin = (Boolean)session.getAttribute("login");
		}
	
		if(isLogin == true){
			out.print("로그인 성공!!");
		}else{
			out.print("로그인 실패!!");
		}
	%>
</body>
</html>