<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("userid");
	String pwd = request.getParameter("passwd");
	
	if(id.equals("admin") && pwd.equals("1234")){
		//loginSuccess 페이지로 이동 시킴
		response.sendRedirect("loginSuccess.jsp");  
	}else{
		response.sendRedirect("loginFail.jsp");
	}
%>

