<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");	

	String realFolder = "C:\\Users\\kiyon\\git\\jspworks2\\jwbook\\src\\main\\webapp\\upload";
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, 5*1024*1024, 
			"utf-8", new DefaultFileRenamePolicy()); //5MB 한도
			
	//요청 파라미터 name(file name은 제외) 가져오기
	Enumeration<String> params = multi.getParameterNames();
	while(params.hasMoreElements()){
		String name = params.nextElement();
		String value = multi.getParameter(name);
		out.println(name + "=" + value + "<br>");
	}
	out.println("======================================<br>");
	
	//요청 파라미터 중 file name 가져옴
	Enumeration<String> files = multi.getFileNames();
	while(files.hasMoreElements()){
		String name = files.nextElement();
		String fileName = multi.getFilesystemName(name);
		String original = multi.getOriginalFileName(name);
		String type = multi.getContentType(name);
		File file = multi.getFile(name);
		
		out.println("요청 파라미터 이름: " + name + "<br>");
		out.println("저장 파일 이름: " + fileName + "<br>");
		out.println("실제 파일 이름: " + original + "<br>");
		out.println("파일 컨텐츠 유형: " + type + "<br>");
		
		if(file != null){
			out.println("파일 크기: " + file.length() + "B");
		}
%>
<p>이미지 보기</p>
<p><img src="C:\\Users\\kiyon\\git\\jspworks2\\jwbook\\src\\main\\webapp\\upload\\<%=fileName %>">
<% } %>  <!-- while 닫기 -->








