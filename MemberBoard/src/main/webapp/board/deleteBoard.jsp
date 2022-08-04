<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="boardDAO" class="com.repository.BoardDAO" scope="application" />
<%

	int bnum = Integer.parseInt(request.getParameter("bnum"));

	boardDAO.deleteBoard(bnum);
	
	response.sendRedirect("./boardList.jsp");

%>