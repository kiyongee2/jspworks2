<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 폼</title>
<style type="text/css">
	h2{
		background-color: green;
		text-align: center;
		padding: 15px 0;
		border-radius: 5px;
		color: #eee;
	}
	#regform{
		width: 50%;
		margin: 0 auto;
		background-color: lightgreen;
		padding: 15px 20px;
		border-radius: 10px;
	}
</style>
<script type="text/javascript">
	function signUp(){
		alert("정말로 가입하시겠습니까?");
		document.getElementById("regform").style.display = "none";
		document.getElementById("rname").innerHTML = document.form1.name.value;
		document.getElementById("rmail").innerHTML = document.form1.email.value;
		document.getElementById("result").setAttribute("style", 
					"display:block; background: lightgreen; padding: 5px 20px;")
	}
</script>
</head>
<body>
	<h2>회원 가입</h2>
	<hr>
	<div id="regform">
		<form name="form1" action="" method="post">
			<label>이름</label><br>
			<input type="text" name="name" size="40">
			<hr>
			<label>이메일</label><br>
			<input type="text" name="email" size="40"><br>
			<p><button type="button" onclick="signUp()">가입</button></p>
		</form>
	</div>
	
	<div id="result">
		<h3>가입 정보</h3>
		<hr>
		<p>이름: <span id="rname"></span></p>
		<p>이메일: <span id="rmail"></span></p>
	</div>
</body>
</html>
