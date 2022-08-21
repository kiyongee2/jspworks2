<%@page import="com.repository.Board"%>
<%@page import="com.repository.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<link rel="stylesheet" href="../resources/css/common.css">
</head>
<jsp:useBean id="boardDAO" class="com.repository.BoardDAO"  scope="application" />
<%
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){ //파라미터로 전달된 값이 없으면
		pageNum = "1";
	}
	//현재 페이지
	int currentPage = Integer.parseInt(pageNum);  
	
	//페이지당 게시글 수
	int pageSize = 10;
	
	/* 게시글 첫 행 
	  1page -> 1번(start)), (2 -> 11), (3 -> 21) */
	int startRow =(currentPage-1)*pageSize + 1; 
	
	//게시글 총수(dao의 getBoardCount() 호출)
	int total = boardDAO.getBoardCount();
	
	//시작 페이지
	int startPage = startRow / pageSize + 1;
	
	/* 마지막 페이지
		13 -> 2, 23 -> 3, 33 -> 4
		13/10 -> 1.3 -> ceil(1.3) -> 2.0(올림)
		23/10 -> 2.3 -> ceil(2.3) -> 3.0(올림) */
	//out.println((double)total/10);
	int endPage = (int)Math.ceil((double)total/pageSize);
%>
<body>
	<jsp:include page="../menu.jsp" />
	<div id="container">
		<div class="title">
			<h1>Board</h1>
		</div>
		<div>
			<div style="margin-bottom: 10px; text-align: left; margin-left: 30%">
			     게시글 총수: <%=total %> <%-- <%=startPage %> --%>
			</div>
			<table class="tbl_list">
				<thead>
					<tr>
						<th>번호</th><th>제목</th><th>글쓴이</th><th>작성일</th>
					</tr>
				</thead>
				<tbody>
				<%
					for(int i=0; i<boardDAO.getListAll(startRow, pageSize).size(); i++){
						Board board = boardDAO.getListAll(startRow, pageSize).get(i);
				%>
				<tr>
					<td><%=board.getBnum() %> </td>
					<td><a href="./boardView.jsp?bnum=<%=board.getBnum() %>"><%=board.getTitle() %></a></td>
					<td><%=board.getMemberId() %> </td>
					<td><%=board.getRegDate() %> </td>
				</tr>
				<% } %>
				</tbody>
			</table>
			<div class="pageList" style="margin-top: 10px; text-align:center">
			<% if(startPage > 1){ %>
			    <!-- 이전 패이지가 없으면 시작 페이지로 설정 -->
				<a href="boardList.jsp?pageNum=<%=startPage-1 %>">이전</a>
			<% }else{ %>
			    <a href="boardList.jsp?pageNum=<%=startPage %>">이전</a>
			<% } %>
			<%
			    /*페이지 처리
			    	1 ~ 10 
			    	  1page
			    	11 ~ 20 
			    	  1 2
			    	21 ~ 30 
			    	  1 2 3
			    */
				for(int i=1; i<=endPage; i++){
			%>
				<% if(currentPage == i){ %>
				    <!-- 현재 클릭한 페이지는 활성화(굵게 처리) -->
					<a href="boardList.jsp?pageNum=<%=i %>"><b><%=i %></b></a>
				<% }else{ %>
					<a href="boardList.jsp?pageNum=<%=i %>"><%=i %></a>
				<% } %>
			<% 
				}
			%>
			<% if(endPage > startPage+1){ %>
				<!-- 다음 패이지가 없으면 마지막 페이지로 설정 -->
				<a href="boardList.jsp?pageNum=<%=startPage+1 %>">다음</a>
			<% }else{ %>
			    <a href="boardList.jsp?pageNum=<%=endPage %>">다음</a>
			<% } %>	
			</div>
			<div class="writeBtn">
				<a href="./writeForm.jsp"><button type="button">글쓰기</button></a>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>