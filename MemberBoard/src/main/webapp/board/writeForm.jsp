<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<link rel="stylesheet" href="../resources/css/common.css">
</head>
<%
	if(session.getAttribute("sessionId") == null){
		out.println("<script>");
		out.println("alert('로그인 해주세요')");
		out.println("location.href='../loginMember.jsp'");
		out.println("</script>");
	}
%>
<body>
	<jsp:include page="../menu.jsp" />
	<div id="container">
		<div class="title">
			<h1>글쓰기</h1>
		</div>
		<div>
			<form action="./writeProcess.jsp" method="post" name="writeForm">
			<table class="tbl_write">
				<tr>
					<td><input type="text" name="title" class="w_title" 
					   placeholder="글 제목" required></td>
				</tr>
				<tr>
					<td>
						<textarea rows="20" cols="60" name="content" 
						   placeholder="글 내용" required></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="글쓰기" >
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>