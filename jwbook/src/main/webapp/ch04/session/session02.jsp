<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("userId");
	String pwd = (String)session.getAttribute("userPw");
	
	out.println("설정된 세션의 속성값[1] " + id + "<br>");
	out.println("설정된 세션의 속성값[2] " + pwd + "<br>");
%>