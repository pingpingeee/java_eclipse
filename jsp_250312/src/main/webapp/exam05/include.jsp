<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<%@ page import="java.util.Calendar" %>
	<%! Calendar today = Calendar.getInstance(); %>
	현재 시간 : <%= today.getTime() %>
	
	
	<!-- <%= Calendar.getInstance().getTime() %> -->
</body>
</html>