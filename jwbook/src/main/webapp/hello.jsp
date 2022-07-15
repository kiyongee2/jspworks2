<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello~ World</title>
</head>
<body>
	<h2>안녕~  JSP</h2>
	<hr>
	<p>현재 날짜와 시간은 <%=new Date().toLocaleString() %>입니다.</p>
</body>
</html>
