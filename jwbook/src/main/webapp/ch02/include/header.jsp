<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header 페이지</title>
</head>
<body>
	<!-- <h4>헤더 페이지 영역입니다.</h4> -->
	<%!
		int pageCount = 0;
	    
	    // 1증가하는 메소드 선언
	    void addCount(){
	    	pageCount++;
	    }
	%>
	
	<%
		addCount();  //메소드 호출
	%>
	
	<p>이 사이트 방문은 <%=pageCount %>번째 입니다.</p>
</body>
</html>