<%@page import="test26.zipcodeBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="dao" class="test26.MenberDAO"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String check = request.getParameter("check");
	String area3 = null;
	Vector<zipcodeBean> vlist = null;
	
	if(check.equals("y")){
		area3 = request.getParameter("area3");
		vlist = dao.ZipCode(area3);
	}
%>
<script>
function loardSearch(){
	if(document.zipS.area3.value==""){
		alert("도로명을 입력하세요.");
		document.zipS.area3.focus();
		return;
	}
	document.zipS.action = "zipSearch.jsp";
	document.zipS.submit(); 
}

function sendAdd(rZipcode,adds){
	opener.document.regForm.zipcode.value = zipcode;
	opener.document.refForm.address = adds;
	self.close();
}
</script>
<form name = "zipS" method="post" >
<div align = "center">
<table>
<tr>
<td>도로명 입력: <input name = "area3"><input type="button" value="검색" onclick="loardSearch();"></td>
</tr>
<%
	if(check.equals("y")){
		if(vlist.isEmpty()){
			%>
			<tr>
			<td align = "center"><br/>검색된 결과가 없습니다.</td>
			</tr>
			<%}else{
				%>
				<tr><td align="center"><br/> * 검색후, 아래 우편번호를 클릭하면 자동으로 입력됩니다.</td>
				</tr>
				<%
					for(int i=0;i<vlist.size();i++){
						zipcodeBean bean = vlist.get(i);
						String rZipcode = bean.getZipcode();
						String rArea1 = bean.getArea1();
						String rArea2 = bean.getArea2();
						String rArea3 = bean.getArea3();
						String adds = rArea1+" "+rArea2+" "+rArea3+" ";
						%>
						<tr>
						<td><a href="#" onclick="javascript.sendAdd('<%=rZipcode%>','<%=adds%>')">
						<%=rZipcode%><%=adds %></a></td>
						</tr>
	<%				}
	
		}
	}
%>
</table>
</div>
</form>
</body>
</html>