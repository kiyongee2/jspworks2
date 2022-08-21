<%@page import="com.repository.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="boardDAO" class="com.repository.BoardDAO" scope="application" />
<%
	request.setCharacterEncoding("utf-8");	//한글 인코딩 요청

	String bnum = request.getParameter("bnum");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	//객체에 자료 넣기(set)
	Board board = new Board();
	board.setBnum(Integer.parseInt(bnum));
	board.setTitle(title);
	board.setContent(content);
	
	boardDAO.updateBoard(board);  //수정 처리
	
	if(session.getAttribute("sessionId") != null){
		boardDAO.updateBoard(board);
		out.println("<script>");
		out.println("alert('게시글을 수정했습니다.')");
		out.println("location.href='./boardList.jsp'");
		out.println("</script>");
	}else{
		response.sendRedirect("./loginMember.jsp");
	}
%>