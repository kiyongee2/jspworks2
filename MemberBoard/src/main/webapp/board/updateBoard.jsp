<%@page import="com.repository.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="boardDAO" class="com.repository.BoardDAO" scope="application" />
<%
	request.setCharacterEncoding("utf-8");	

	String bnum = request.getParameter("bnum");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	Board board = new Board();
	board.setBnum(Integer.parseInt(bnum));
	board.setTitle(title);
	board.setContent(content);
	
	boardDAO.updateBoard(board);
	
	if(session.getAttribute("sessionId") != null){
		boardDAO.updateBoard(board);
		out.println("<script>");
		out.println("alert('나의 정보를 수정했습니다.')");
		out.println("location.href='./boardList.jsp'");
		out.println("</script>");
	}else{
		response.sendRedirect("./loginMember.jsp");
	}
%>