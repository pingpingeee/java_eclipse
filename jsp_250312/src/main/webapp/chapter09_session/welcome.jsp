<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Date"%>
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
	Enumeration enum_app = session.getAttributeNames();
	int i = 0;
	String str_name ="";
	String str_value ="";
	if(session == null || session.getAttribute("admin")==null || session.getAttribute("admin").equals("")) {
	}
	while(enum_app.hasMoreElements()) {
		i++;
		// nextElement 메소드 : 열거형 값을 가져옴
		str_name = enum_app.nextElement().toString();
		// getAttribute 메소드 : 세션 이름으로 값을 가져옴
		str_value = session.getAttribute(str_name).toString();
		
		out.print("<br>"+str_name+"님 반갑습니다.<br>");
		
	}
	 %>
		<a href="session_out.jsp">로그아웃</a>
		
</body>
</html>