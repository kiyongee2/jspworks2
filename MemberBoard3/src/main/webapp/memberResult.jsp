<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<link rel="stylesheet" href="./resources/css/common.css">
</head>
<body>
	<jsp:include page="./menu.jsp" />
	<div id="container">
		<div class="title">
			<h1>회원 정보</h1>
		</div>
		<div>
			<c:choose>
				<c:when test="${loginResult eq '0'}">
					<script>alert("아이디가 틀립니다."); history.go(-1);</script>
				</c:when>
				<c:when test="${loginResult eq '-1'}">
					<script>alert("비밀번호가 틀립니다."); history.go(-1);</script>
				</c:when>
				<c:when test="${loginResult eq '-2'}">
					<script>alert("데이터베이스 오류입니다."); history.go(-1);</script>
				</c:when>
			</c:choose>
		</div>
		<div class="msg">
			<c:choose>
				<c:when test="${msg eq 'register'}">
					<h2>회원 가입을 축하합니다.</h2>
				</c:when>
				<c:when test="${msg eq 'login'}">
					<h2><c:out value="${name}" />님 환영합니다.</h2>
				</c:when>
				<c:when test="${msg eq 'update'}">
					<h2>회원 정보가 수정되었습니다.</h2>
				</c:when>
				
			</c:choose>
		</div>
	</div>
	<jsp:include page="./footer.jsp" />
</body>
</html>