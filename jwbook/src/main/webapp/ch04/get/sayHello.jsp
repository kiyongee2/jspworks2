<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿼리 스트링</title>
</head>
<body>
	<%
		int cnt = 10;
		if(request.getParameter("cnt") != null){
			cnt = Integer.parseInt(request.getParameter("cnt"));
		}
		//cnt가 null인경우 오류 발생
		//int cnt = Integer.parseInt(request.getParameter("cnt"));
	
		for(int i=0; i<cnt; i++){
			out.println("안녕~ JSP<br>");
		}
	%>
</body>
</html>