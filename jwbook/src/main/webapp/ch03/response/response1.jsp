<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>response 내장 객체</title>
</head>
<body>
	<p>이 페이지는 5초 마다 새로고침 됩니다.</p>
	<%
		response.setIntHeader("Refresh", 5);
	
		response.setCharacterEncoding("utf-8");
		
		response.setContentType("text/html; charset=UTF-8");
	%>
	<p><%= new Date() %>
	
	<p><%= response.getCharacterEncoding() %>
	<p><%= response.getContentType() %>
</body>
</html>