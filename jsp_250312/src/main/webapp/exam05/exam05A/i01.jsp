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
	<%@ include file="h01.jsp" %>
	<%
		Calendar cal = Calendar.getInstance();
		out.print(cal.get(Calendar.YEAR) + "-"
				+ (cal.get(Calendar.MONTH)+1) +"-"
				+ (cal.get(Calendar.DATE)+1));
	%>
</body>
</html>