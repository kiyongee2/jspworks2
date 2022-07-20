
function checkLogin(){
	let form = document.loginForm;
	let id = form.userid.value;
	let pw = form.passwd.value;
	
	if(id==""){
		alert("아이디를 입력해 주세요");
		form.id.focus();
		return false;
	}
	for(var i=0; i<id.length; i++){
		var ch = id.charAt(i);
		
		if((ch<'a' || ch>'z') && (ch>'A' || ch<'Z') && (ch>'0' || ch<'9')){
			alert("아이디는 영문 소문자만 가능합니다.");
			form.userid.select();
			return false;
		} 
	}
	if(pw==""){
		alert("비밀번호를 입력해주세요");
		form.passwd.focus();
		return false;
	}
	if(isNaN(pw)){
		alert("비밀번호는 숫자만 입력해주세요");
		form.passwd.select();
		return false;
	}
	
	form.submit();
}
