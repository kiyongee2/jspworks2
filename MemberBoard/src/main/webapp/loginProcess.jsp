<%@page import="com.repository.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memberDAO" class="com.repository.MemberDAO"  scope="application" />
<%
	//데이터 넘겨 받기
	String memberId = request.getParameter("memberId");
	String passwd = request.getParameter("passwd");
	
	Member member = new Member();
	member.setMemberId(memberId);
	member.setPasswd(passwd);
	
	//로그인 객체 받기
	boolean result = memberDAO.checkLogin(member);
	
	if(result){
		session.setAttribute("sessionId", memberId);  //세션 발급
		out.println("<script>");
		out.println("alert('" + memberId +  "님 환영합니다.')");
		out.println("location.href = './main.jsp' ");
		out.println("</script>");
	}else{
		out.println("<script>");
		out.println("alert('아이디나 비밀번호를 확인해주세요')");
		out.println("history.go(-1)");
		out.println("</script>");
	}
%>