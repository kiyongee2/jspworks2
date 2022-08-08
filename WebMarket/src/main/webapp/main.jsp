<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Web Market</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" 
	  integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
</head>
<body>
	<%@ include file = "menu.jsp" %>
	<%! String greeting = "웹 쇼핑몰에 오신 것을 환영합니다.";
		String tagline = "Welcome to Web Market!";
	%>
	<div class = "jumbotron">
		<div class = "container">
			<h1 class="display-3"><%= greeting %></h1>
		</div>
	</div>
	
	<div class = "container">
		<div class="text-center">
			<h3><%= tagline %></h3>
			<%
				Date day = new java.util.Date();
			    String am_pm;
			    int hour = day.getHours();
			    int minute = day.getMinutes();
			    int second = day.getSeconds();
			    
			    if(hour / 12 == 0){
			    	am_pm = "AM";
			    }else{
			    	am_pm = "PM";
			    	hour = hour - 12;
			    }
			    
			    String CT = hour + ":" + minute + ":" + second + " " + am_pm;
			    out.println("현재 접속 시각: " + CT);
			    
			    //5초마다 페이지 갱신
			    response.setIntHeader("Refresh", 5);
			%>
		</div>
	</div>
	<%@ include file = "footer.jsp" %>
</body>
</html>







