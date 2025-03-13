<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//	1단계 : 쿠키 생성
//	"testCookie" => 쿠키이름, "FisrtCookie" => 쿠키값
	Cookie info = new Cookie("testCookie", "FirstCookie");
//	2단계 : 쿠키 속성 설정(1년동안 유지)
	info.setMaxAge(365*24*60*60);
	info.setPath("/");
//	3단계 : 쿠키 추가
	response.addCookie(info);
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>쿠키를 처음 설정하는 중...</h2>
	
</body>
</html>