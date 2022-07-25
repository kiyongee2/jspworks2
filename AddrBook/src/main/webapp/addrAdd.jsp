<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소 추가</title>
<link rel="stylesheet" href="./resources/css/addrbook.css">
</head>
<jsp:useBean id="addrBook" class="com.dao.AddrBook" />
<jsp:setProperty property="num" name="addrBook"/>
<jsp:setProperty property="username" name="addrBook"/>
<jsp:setProperty property="tel" name="addrBook"/>
<jsp:setProperty property="email" name="addrBook"/>
<jsp:setProperty property="gender" name="addrBook"/>
<jsp:setProperty property="joinDate" name="addrBook"/>
<jsp:useBean id="abDAO" class="com.dao.AddrBookDAO" scope="application" />
<%
	if(session.getAttribute("sessionId") != null){
		abDAO.addAddress(addrBook);
	}else{
		response.sendRedirect("./loginForm.jsp");
	}
%>
<body>
	<div id="container">
		<h3><%= addrBook.getUsername() %>님이 등록되었습니다.</h3>
		<a href="./addrList.jsp">목록 보기</a>
	</div>
</body>
</html>






