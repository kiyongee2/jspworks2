<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memberDAO" class="com.repository.MemberDAO"  scope="application" />
<%
	String memberId = request.getParameter("memberId"); //아이디 받기

	memberDAO.deleteMember(memberId);  //회원 삭제
	
	response.sendRedirect("./memberList.jsp"); //페이지 이동

%>