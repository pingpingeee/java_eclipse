<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="yellow">
	<center>
		<h3>[ jsp:forward 액션 태그에 대한 예제]</h3>
	</center>
	<hr>
	이 파일은 yellow02.jsp<br>
	웹 브라우저에 나타나는 URL과 전혀 상관없는 파일
	<%=request.getParameter("url") %> 로 부터 이동됨
	<hr>
	<%=request.getParameter("url") %>
	에서 넘어온 메세지 : 
	<%=request.getParameter("news") %> 로 부터 이동됨
</body>
</html>