<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
	int num = 337;
	int getInt(){
		return num;
	}
	%>
	<%
		out.print(getInt());
	%>
</body>
</html>