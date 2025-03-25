<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>[액션 태그와 표현 언어]</h3>
	<jsp:useBean class="glory.User" id="user"></jsp:useBean>
	<jsp:getProperty property="firstName" name="user"/>
	<jsp:getProperty property="lastName" name="user"/>
	<hr>
	${user.firstName }
	${user.lastName }
	<hr>
	<jsp:setProperty property="firstName" name="user" value="Gildong"/>
	<jsp:setProperty property="lastName" name="user" value="Hon"/>
	<jsp:getProperty property="firstName" name="user"/>
	<jsp:getProperty property="lastName" name="user"/>
	<hr>
	${user.firstName }
	${user.lastName }
	<hr>
	
</body>
</html>