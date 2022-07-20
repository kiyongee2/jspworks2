<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유효성 검사</title>
<script type="text/javascript">
	function checkLogin(){
		let form = document.loginForm;  //폼 이름 변수 할당
		
		if(form.userid.value == ""){ //아이디 입력 값이 없으면
			alert("아이디를 입력해주세요");
			form.userid.focus();
			return false;
		}else if(form.passwd.value == ""){
			alert("비밀번호를 입력해주세요");
			form.passwd.focus();
			return false;
		}else{
			form.submit();  //폼을 전송함
		}
	}
</script>
</head>
<body>
	<form action="loginProcess2.jsp" method="post" name="loginForm">
		<p>
			<label for="userid">아이디: </label>
			<input type="text" id="userid" name="userid">
		</p>
		<p>
			<label for="passwd">패스워드: </label>
			<input type="password" id="passwd" name="passwd">
		</p>
		<p><input type="button" value="로그인" onclick="checkLogin()"></p>
	</form>
</body>
</html>