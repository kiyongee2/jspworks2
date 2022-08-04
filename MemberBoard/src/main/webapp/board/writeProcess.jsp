<%@page import="com.repository.Board"%>
<%@page import="com.repository.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="boardDAO" class="com.repository.BoardDAO"  scope="application" />
<%
	request.setCharacterEncoding("utf-8");

	//세션 처리
	String sessionId = null;
	if(session.getAttribute("sessionId") != null){
		sessionId = (String)session.getAttribute("sessionId");
	}

	//폼 데이터 수집
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	//객체 생성
	Board board = new Board();
	board.setTitle(title);
	board.setContent(content);
	board.setMemberId(sessionId);
	
	//글쓰기 처리 
	boardDAO.insertBoard(board);
	
	response.sendRedirect("./boardList.jsp");  //화면 이동
%>
