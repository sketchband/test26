function Check(){
	if(document.regForm.pw.value!=document.regForm.repw.value){
		alert("비밀번호를 확인해주세요.");
		document.regForm.repw.value="";
		document.regForm.repw.focus();
		return
	}
	document.regForm.submit();
}