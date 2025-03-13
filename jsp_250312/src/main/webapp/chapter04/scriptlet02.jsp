<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h3>[스크립트릿(scriptlet)에 관한 예제]</h3>
	</center>
	<hr>
	<%
		for(int i=0;i<5;i++){
	%>
		hello<br>
	<%
		}
	%>
	<%--
		for(int i=0;i<5;i++){
			out.print("hello<br>");
		}
	--%>
</body>
</html>