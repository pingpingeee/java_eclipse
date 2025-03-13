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
	Today's date:
<!--	<%= %> : 표현식으로 출력(세미콜론 추가하면 오류)  -->
	<%= new Date() %> <!-- 객체 생성 시 세미콜론 생략 -->
</body>
</html>