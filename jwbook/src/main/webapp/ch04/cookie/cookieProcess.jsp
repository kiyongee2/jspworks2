<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 생성</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
	
		if(id.equals("admin") && passwd.equals("0000")){
			Cookie cookieID = new Cookie("userID", id);
			Cookie cookiePW = new Cookie("userPW", passwd);
			
			//응답 헤더에 쿠기를 추가함
			response.addCookie(cookieID);
			response.addCookie(cookiePW);
			
			out.println("쿠키 생성이 성공했습니다.");
		}else{
			out.println("쿠키 생성이 실패했습니다.");
		}
	%>
</body>
</html>