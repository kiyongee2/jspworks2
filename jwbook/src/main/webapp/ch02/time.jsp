<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시간이란...</title>
<script>
	setInterval(function(){
		var date = new Date();
		var now = date.toLocaleString();
		document.getElementById("watch").innerHTML = now;
	} , 1000);
</script>
</head>
<body>
	<h2>시간이란...</h2>
	<p>내일 죽을 것처럼 오늘을 살고<br>
	   영원히 살 것 처럼 꿈꾸어라</p>
	<img src = "../resources/images/time.jpg" alt="시간">
	<p id="watch"></p>
</body>
</html>