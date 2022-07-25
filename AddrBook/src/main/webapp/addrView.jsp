<%@page import="com.dao.AddrBook"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록 상세 보기</title>
<link rel="stylesheet" href="./resources/css/addrbook.css">
</head>
<jsp:useBean id="abDAO" class="com.dao.AddrBookDAO" scope="application"/>
<body>
	<div id="container">
		<h2>상세 보기</h2>
		<hr>
		<table id="tbl_view">
		<%
			int num = Integer.parseInt(request.getParameter("num")); //username 속성 값 가져오기	
			if(session.getAttribute("sessionId") != null){
				AddrBook addrBook = abDAO.getOne(num); //dao에서 메소드 호출
		%>
			<tr>
				<td>이름</td><td><%=addrBook.getUsername() %>
			</tr>
			<tr>
				<td>전화번호</td><td><%=addrBook.getTel() %>
			</tr>
			<tr>
				<td>이메일</td><td><%=addrBook.getEmail() %>
			</tr>
			<tr>
				<td>성별</td><td><%=addrBook.getGender() %>
			</tr>
		<%
			}else{
				response.sendRedirect("./loginForm.jsp"); 
			}
		%>
		</table>
	</div>
</body>
</html>