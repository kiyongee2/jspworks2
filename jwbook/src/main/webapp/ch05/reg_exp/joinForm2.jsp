<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<script>
	function checkMember(){
		//정규 표현식 변수 할당
		let regExpId = /^[a-zA-Zㄱ-ㅎ가-힣]/;
		let regExpPasswd1 = /[A-Za-z0-9]/;
		let regExpPasswd2 = /[~!@#$%^&*+-/_]/;
		
		let form = document.Member;  //폼 변수
		//입력 양식 값 변수 할당
		let id = form.id.value;
		let pw = form.passwd.value;
		let name = form.name.value; 
		
		if(id == "" || !regExpId.test(id)){
			alert("아이디는 문자로 시작해주세요!");
			form.id.select();
			return false;
		}
		if(pw.length < 8 || pw.length > 12 || !regExpPasswd1.test(pw) 
				|| !regExpPasswd2.test(pw)){
			alert("비밀번호는 영문자, 숫자, 특수문자 포함 8~12자로 입력해주세요");
			return false;
		}
		if(name == ""){
			alert("이름을 입력해주세요!");
			return false;
		} 
		form.submit();  //폼을 서버 페이지로 전송
	}
</script>
</head>
<body>
	<h3>회원 가입</h3>
	<form action="validation_process.jsp" method="post" name="Member">
		<p>아이디: <input type="text" name="id">
		<p>비밀번호: <input type="password" name="passwd">
		<p>이 름: <input type="text" name="name">
		<p> <button type="button" onclick="checkMember()">가입하기</button>
	</form>
</body>
</html>
