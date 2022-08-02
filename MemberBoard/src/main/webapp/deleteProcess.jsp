<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memberDAO" class="com.repository.MemberDAO"  scope="application" />
<%
	String memberId = request.getParameter("memberId");

	memberDAO.deleteMember(memberId);
	response.sendRedirect("./memberList.jsp");

%>