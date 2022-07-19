<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<h3>---- 세션을 삭제하기 전 ----</h3>
<%
	String id = (String)session.getAttribute("userId");
	String pw = (String)session.getAttribute("userPw");
	
	out.println("설정된 세션의 속성값[1] " + id + "<br>");
	out.println("설정된 세션의 속성값[2] " + pw + "<br>");
	
	session.removeAttribute("userId");
%>

<h3>---- 세션을 삭제한 후 ----</h3>
<%
	id = (String)session.getAttribute("userId");
	pw = (String)session.getAttribute("userPw");
	
	out.println("설정된 세션의 속성값[1] " + id + "<br>");
	out.println("설정된 세션의 속성값[2] " + pw + "<br>");

%>