<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Validation</title>
<script>
	function checkForm(){
		//이름은 숫자로 시작할 수 없음
		let str = document.frm.name.value;   //입력 양식 값 변수 할당
		let regExp = /^[a-zA-Z가-힣]/;  //정규표현식 변수 선언(시작 - ^사용)
		
		if(!regExp.test(str)){
			alert("이름은 숫자로 시작할 수 없습니다.");
			return false;
		}
	}
</script>
</head>
<body>
	<form action="" method="post" name="frm">
		<p>이름: <input type="text" name="name">
		<input type="submit" value="전송" onclick="checkForm()">
	</form>
</body>
</html>
