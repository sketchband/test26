<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="script.js">
function Check(){
	url = Check();
}

</script>
<script>
function ID_Check(id){
	if(id==""){
		alert("아이디를 입력해주세요.");
		document.regForm.id.focus();
		return;
	}
	url = "ID_Check.jsp?id="+id;
	window.open(url,"ID중복확인","width=500,height=150");
return;
}
function zipSearch(){
	url = "zipSearch.jsp?check=n";
	window.open(url,"주소검색창","widht=500,height=150,scrollbars=yes");
}
</script>
<form name="regForm" method="post" action="Insert_Proc.jsp">
<center><h2>회원가입</h2></center>
<div align="center">
<table>
<tr>
<td>아이디</td>
<td><input name="id"><input type="button" value="ID중복확인" onclick="ID_Check(this.form.id.value)"></td>
</tr>
<tr>
<td>비밀번호</td>
<td><input name="pw" type="password"></td>
</tr>
<tr>
<td>비밀번호 확인</td>
<td><input name="repw" type="password"></td>
</tr>
<tr>
<td>이름</td>
<td><input name="name"></td>
</tr>
<tr>
<td>이메일</td>
<td><input name="email" type="email"></td>
</tr>
<tr>
<td>직업</td>
<td>
<select name="job">
<option value="0" selected="selected">선택해주세요.
<option value="프로그래머">프로그래머
<option value="선생님">선생님
<option value="의사">의사
<option value="축구선수">축구선수
<option value="아르바이트생">아르바이트생
</select>
</td>
</tr>
<tr>
<td>취미</td>
<td>
축구 <input type="checkbox" name="hobby" value="축구">
게임 <input type="checkbox" name="hobby" value="게임">
공부 <input type="checkbox" name="hobby" value="공부">
</td>
</tr>
<tr>
<td></td>
<td>
영화 <input type="checkbox" name="hobby" value="영화">
낚시 <input type="checkbox" name="hobby" value="낚시">
독서 <input type="checkbox" name="hobby" value="독서">
</td>
</tr>
<tr>
<td>우편번호</td>
<td><input name="zipcode" readonly="readonly" size="15"></td>
</tr>
<tr>
<td>주소</td>
<td><input name="address" size="30"><input value="주소검색" type="button" onclick="zipSearch()"></td>
</tr>
<tr>
<td></td>
<td><input type="button" value="회원가입" onclick="Check()">
	<input type="button" value="취소" onclick="location.href='main.jsp'">
</td>
</tr>	
</table>
</div>
</form>
</body>
</html>