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
	if(pageNum == null){
		pageNum = "1";
	}
	int currentPage = Integer.parseInt(pageNum);  //현재 페이지
	
	int pageSize = 10;
	
	//(1page -> 1번(start)), (2 -> 11), (3 -> 21)
	int startRow =(currentPage-1)*pageSize + 1;   //첫 행
	
	//게시글 총수
	int total = boardDAO.getBoardCount();
	
	/*마지막 페이지
		13 -> 2, 23 -> 3, 33 -> 4
		13/10 -> 1.3 -> ceil(1.3) -> 2.0(올림)
		23/10 -> 2.3 -> ceil(2.3) -> 3.0(올림)
	*/
	//out.println((double)total/10);
	int endPage = (int)Math.ceil((double)total/10);
	
%>
<body>
	<jsp:include page="../menu.jsp" />
	<div id="container">
		<div class="title">
			<h1>Board</h1>
		</div>
		<div>
			<div style="margin-bottom: 10px; text-align: left; margin-left: 30%">
			     게시글 총수: <%=total %>
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
					//out.print("<a href='boardList.jsp?pageNum="+i+"'>"+i+" ");
			%>
				<a href="boardList.jsp?pageNum=<%=i%>"><%=i%></a>
			<% 
				}
			%>
			</div>
			<div class="writeBtn">
				<a href="./writeForm.jsp"><button type="button">글쓰기</button></a>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>