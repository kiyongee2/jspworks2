<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="abDAO" class="com.dao.AddrBookDAO" scope="application"/>
<%
	int num = Integer.parseInt(request.getParameter("num"));

	if(session.getAttribute("sessionId") != null){
    	abDAO.deleteAddress(num);
    	response.sendRedirect("./addrList.jsp");
	}else{
		response.sendRedirect("./loginForm.jsp");
	}
%>

