<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String str_test="세션이 저장된 데이터가 바로 접니다.";
	session.setAttribute("Testing", str_test);
	session.setAttribute("Mydata", 10);
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h3>[세션 값을 설정하는 예제]</h3>
	</center>
	<hr>세션 값을 설정하는 페이지입니다.
	<hr>
</body>
</html>