<%@ page import="bean.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>useBean 액션 태그</title>
</head>
<body>
	<%
		MemberBean member = new MemberBean();
	
	    /* out.println(member.getId());
	    out.println(member.getName()); */
	%>
	
	<p>아이디: <%= member.getId() %> </p>
	<p>이름: <%= member.getName() %> </p>
</body>
</html>