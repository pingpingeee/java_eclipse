<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean class="question.Asterisk" id="asterisk"></jsp:useBean>
<jsp:setProperty property="num" name="asterisk" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	out.print("입력된 정수가 " + asterisk.getNum() + "는<br>"
			+ asterisk.process());
	
/* 	for (int i = 0; i < asterisk.getNum(); i++) {
		for (int j = 0; j < asterisk.getNum() - i; j++) {
			out.print(asterisk.process(asterisk.getNum()));
		}
		out.print("<br>");
	} */
	%>
</body>
</html>