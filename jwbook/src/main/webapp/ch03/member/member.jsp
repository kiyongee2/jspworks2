<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>useBean 액션 태그</title>
</head>
<body>
	<jsp:useBean id="member" class="bean.MemberBean" scope="request" />
	<p>아이디: <%=member.getId() %></p>
	<p>이름: <%=member.getName() %>
</body>
</html>