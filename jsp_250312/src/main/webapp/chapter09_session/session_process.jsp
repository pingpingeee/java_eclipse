<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String str_name ="admin";
String str_value ="1234";

String u_id = request.getParameter("id");
String u_pw = request.getParameter("pw");

if(u_id.equals(str_name) && u_pw.equals(str_value)) {
	
session.setAttribute(u_id, u_id);

response.sendRedirect("welcome.jsp");
}
else {
	out.print("아이디와 비밀번호를 확인하세요");
}



%>
</body>
</html>