<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link rel="stylesheet" href="./resources/css/common.css">
<script src="./resources/js/checkMember.js"></script>
<!-- <script type="text/javascript">
	function checkMember(){
		let form = document.regForm;
		let id = form.memberId.value;
		let pwd1 = form.passwd.value;
		let pwd2 = form.passwd_confirm.value;
		let name = form.name.value;
		let gender = form.gender.value;
		
		let regExpId = /^[a-zA-Z0-9]*$/  //영문자, 숫자만
		let regExpPwd1 = /[a-zA-Z0-9]/
		let regExpPwd2 = /[~!@#$%^&*-+*/_()]/ //특수문자만
		
		if(id.length < 4 || id.length > 12 || !regExpId.test(id) ){
			alert("아이디는 영문자, 숫자 포함 4 ~ 12자 이하로 입력해주세요.");
			form.memberId.focus();
			form.memberId.select();
			return false;
		}else if(pwd1.length < 8 || pwd1.length > 12 || 
				    !regExpPwd1.test(pwd1) || !regExpPwd2.test(pwd1)){
			alert("비밀번호는 영문자, 숫자, 특수문자 포함 8 ~ 12자 이하로 입력해주세요.");
			form.pwd1.focus();
			form.pwd1.select();
		}else if(pwd2 == "" || pwd1 != pwd2){
			alert("비밀번호는 동일하게 입력해주세요");
			form.pwd2.focus();
			form.pwd2.select();
		}else if(name == ""){
			alert("이름을 입력해주세요");
			form.name.focus();
		}else{
			form.submit();
		}
	}
</script> -->
</head>
<body>
	<jsp:include page="./menu.jsp" />
	<div id="container">
		<div class="title">
			<h1>회원 가입</h1>
		</div>
		<div>
			<form action="./addMember.jsp" method="post" name="regForm">
			<table class="tbl">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="memberId" placeholder="ID"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="text" name="passwd" placeholder="PASSWORD"></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="text" name="passwd_confirm" placeholder="PASSWORD_CONFIRM"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<select name="gender" required>
							<option selected>남</option>
							<option>여</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="등록" onclick="checkMember()">
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
		</div>
	</div>
	<jsp:include page="./footer.jsp" />
</body>
</html>