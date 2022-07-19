<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = request.getParameter("id");
    String userPw = request.getParameter("passwd");
    
    if(userId.equals("corona") && userPw.equals("2019")){
    	session.setAttribute("userId", userId);
    	session.setAttribute("userPw", userPw);
    	out.println("세션 설정이 성공했습니다.");
    }else{
    	out.println("<script>");
    	out.println("alert('아이디나 비밀번호가 일치하지 않습니다.')");
    	out.println("history.go(-1)");
    	out.println("</script>");
    }
%>

<p><%=session.getAttribute("userId") %>님이 로그인한 상태입니다.