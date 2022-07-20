//로그인 체크 함수
function checkLogin(){
	let form = document.loginForm;
	
	if(form.userid.value.length < 4 || form.userid.value.length > 12){
		alert("아이디는 4~12자 이내로 입력해주세요")
		form.userid.select();
		return false;
	}else if(form.passwd.value.length < 5){
		alert("비밀번호는 5자 이내로 입력해주세요")
		form.passwd.select();
		return false;
	}else{
		form.submit();
	}
}
