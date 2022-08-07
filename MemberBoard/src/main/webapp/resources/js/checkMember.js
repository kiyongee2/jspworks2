/**
 * 회원 가입 유효성 검사
 */
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
	let regExpPwd3 = /[ㄱ-ㅎㅏ-ㅣ가-힣]/  //한글만
	
	if(id.length < 4 || id.length > 12 || !regExpId.test(id) ){
		alert("아이디는 영문자, 숫자 포함 4 ~ 12자 이하로 입력해주세요.");
		form.memberId.focus();
		form.memberId.select();
		return false;
	}else if(pwd1.length < 8 || pwd1.length > 12 || 
			    !regExpPwd1.test(pwd1) || !regExpPwd2.test(pwd1) || regExpPwd3.test(pwd1)){
		alert("비밀번호는 영문자, 숫자, 특수문자 포함 8 ~ 12자 이하로 입력해주세요.");
		form.passwd.focus();
		form.passwd.select();
	}else if(pwd2 == "" || pwd1 != pwd2){
		alert("비밀번호는 동일하게 입력해주세요");
		form.passwd_confirm.focus();
		form.passwd_confirm.select();
	}else if(name == ""){
		alert("이름을 입력해주세요");
		form.name.focus();
	}else{
		form.submit();
	}
}