<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--  <%! %> : 변수, 메소드 선언 -->
	<%! int data = 50;%>
<!--  <% %> : script let으로 자바코드 기술 -->
	<%
		out.print("value of the variable is : " + data);
	%>
</body>
</html>