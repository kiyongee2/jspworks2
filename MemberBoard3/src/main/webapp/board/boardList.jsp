<%@page import="com.repository.Board"%>
<%@page import="com.repository.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
						<th>번호</th><th>제목</th><th>글쓴이</th><th>작성일</th><th>조회수</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="board" items="${boardList}">
				<tr>
					<td><c:out value="${board.bnum}" /></td>
					<td><a href="./boardView.do?bnum=${board.bnum}"><c:out value="${board.title}" /></a></td>
					<td><c:out value="${board.memberId}" /></td>
					<td><fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
					<td><c:out value="${board.hit}" /> </td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
			<div style="margin-top: 10px; text-align:center">
				<!-- 시작 페이지가 1보다 작으면 시작 페이지로 설정 -->
			    <c:if test="${startPage > 1}">
					<a href="/boardList.do?pageNum=<c:out value="${startPage-1}" />">이전</a>
				</c:if>
			    <c:if test="${startPage <= 1}">
					<a href="/boardList.do?pageNum=<c:out value="${startPage}" />">이전</a>
				</c:if>
				<c:forEach var="i" begin="1" end="${endPage}">
					<!-- 현재 페이지가 i와 같으면 활성화(굵게) -->
				    <c:if test="${currentPage == i}">
						<a href="/boardList.do?pageNum=<c:out value="${i}" />"><b><c:out value="${i}" /></b></a>
					</c:if>
				    <c:if test="${currentPage != i}">
						<a href="/boardList.do?pageNum=<c:out value="${i}" />"><c:out value="${i}" /></a>
					</c:if>
				</c:forEach>
				<!-- 마지막 페이지가 시작 페이지보다 작으면 마지막 페이지로 설정 -->
				<c:if test="${endPage > startPage}">
					<a href="/boardList.do?pageNum=<c:out value="${startPage+1}" />">다음</a>
				</c:if>
				<c:if test="${endPage <= startPage}">
					<a href="/boardList.do?pageNum=<c:out value="${endPage }" />">다음</a>
				</c:if>
			</div>
			<div class="writeBtn">
				<a href="./writeForm.do"><button type="button">글쓰기</button></a>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>