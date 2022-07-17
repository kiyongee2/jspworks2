<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//Header 정보 모두 가져오기
	//반복자 객체 얻기
	Enumeration<String> en = request.getHeaderNames();
	while(en.hasMoreElements()){ 
		String headerName = en.nextElement();    //headerName을 가져와서
		String headerValue = request.getHeader(headerName);  //headerName 값 요청
		out.print(headerName + ":" + headerValue + "<br>");
	}
%>

