<%@page import="com.repository.Board"%>
<%@page import="com.repository.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<link rel="stylesheet" href="../resources/css/common.css">
</head>
<jsp:useBean id="boardDAO" class="com.repository.BoardDAO"  scope="application" />
<body>
	<jsp:include page="../menu.jsp" />
	<div id="container">
		<div class="title">
			<h1>Board</h1>
		</div>
		<div>
			<table class="tbl_list">
				<thead>
					<tr>
						<th>번호</th><th>제목</th><th>글쓴이</th><th>작성일</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="board" items="${boardList}">
				<tr>
					<td><c:out value="${board.bnum}" /></td>
					<td><c:out value="${board.title}" /></td>
					<td><c:out value="${board.memberId}" /></td>
					<td><c:out value="${board.regDate}" /></td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
			<div class="writeBtn">
				<a href="./writeForm.do"><button type="button">글쓰기</button></a>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>