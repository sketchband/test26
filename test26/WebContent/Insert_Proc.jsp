<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="test26.MenberDAO"/>   
<jsp:useBean id="bean" class="test26.MemberBean"/>
<jsp:setProperty property="*" name="bean"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	dao.InsertProc(bean);
%>
</body>
</html>