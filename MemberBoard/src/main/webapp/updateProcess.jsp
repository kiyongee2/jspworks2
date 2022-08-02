<%@page import="com.repository.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memberDAO" class="com.repository.MemberDAO"  scope="application" />
<%
	request.setCharacterEncoding("utf-8");

	String memberId = request.getParameter("memberId");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	
	Member member = new Member();
	member.setMemberId(memberId);
	member.setPasswd(passwd);
	member.setName(name);
	member.setGender(gender);
	
	if(session.getAttribute("sessionId") != null){
		memberDAO.updateMember(member);
		out.println("<script>");
		out.println("alert('나의 정보를 수정했습니다.')");
		out.println("location.href='./memberView.jsp'");
		out.println("</script>");
	}else{
		response.sendRedirect("./loginMember.jsp");
	}
%>