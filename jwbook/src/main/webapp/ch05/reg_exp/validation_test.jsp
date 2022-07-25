<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<script>
	function checkMember(){
		
		let form = document.Member;  //폼 변수
		//입력 양식 값 변수 할당
		let id = form.id.value;
		let pw = form.passwd.value;
		let name = form.name.value; 
		
		if(id == ""){
			alert("아이디를 입력해 주세요");
			form.id.focus();
			return false;
		}
		if(pw == ""){
			alert("비밀번호를 입력해 주세요");
			form.id.focus();
			return false;
		}
		if(pw.search(id) > -1){
			alert("비밀번호는 아이디를 포함할 수 없습니다.");
			form.pw.select();
			return false;
		}
		if(name == ""){
			alert("이름을 입력해 주세요");
			form.name.focus();
			return false;
		} 
		form.submit();  //폼을 서버 페이지로 전송
	}
</script>
</head>
<body>
	<h3>회원 가입</h3>
	<form action="test_process.jsp" method="post" name="Member">
		<p>아이디: <input type="text" name="id">
		<p>비밀번호: <input type="password" name="passwd">
		<p>이 름: <input type="text" name="name">
		<p> <button type="button" onclick="checkMember()">가입하기</button>
	</form>
</body>
</html>
