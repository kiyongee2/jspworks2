<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>param 액션 태그</title>
</head>
<body>
	<%
		String title = request.getParameter("title");
	%>
	<%-- <h3><%= request.getParameter("title") %></h3> --%>
	<h3><%= URLDecoder.decode(title) %></h3>
	<p>Today is: <%= request.getParameter("date") %>
</body>
</html>