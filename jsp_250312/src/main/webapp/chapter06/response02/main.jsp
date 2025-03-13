<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	// "    main.jsp?name="+s_name 을 넘겨 받음
		String s_name = request.getParameter("name");
	%>
	<%= s_name %>님 Hello<br>
	Welcome<br>
	Enjoy
</body>
</html>