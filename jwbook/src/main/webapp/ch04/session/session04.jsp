<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<h3>---- 모든 세션 삭제 ----</h3>
<%
	String id = (String)session.getAttribute("userId");
	String pw = (String)session.getAttribute("userPw");
	
	out.println("설정된 세션의 속성값[1] " + id + "<br>");
	out.println("설정된 세션의 속성값[2] " + pw + "<br>");
	
	session.invalidate();
%>
