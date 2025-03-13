<%@page import="java.util.Calendar"%>
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
		response.setIntHeader("Refresh", 5);
	%>
	현재 시간 : 
	<%= Calendar.getInstance().getTime()%>
	<a href="response_data.jsp">Google 홈페이지 이동</a>
	
</body>
</html>