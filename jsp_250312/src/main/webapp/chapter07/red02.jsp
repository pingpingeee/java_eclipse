<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="red">
	<center>
		<h3>[ jsp:forward 액션 태그에 대한 예제]</h3>
	</center>
	<hr>
	이 파일은 red02.jsp<br>
	웹 브라우저에 배경색이 빨강일까예<br>
	노랑일까예<br>
	forward 액션 태그 실행 시 해당 페이지의 내용은 출력되지않음
	<jsp:forward page="yellow02.jsp">
		<jsp:param value="red02.jsp" name="url"/>
		<jsp:param value="Happy :)" name="news"/>
	</jsp:forward>
</body>
</html>