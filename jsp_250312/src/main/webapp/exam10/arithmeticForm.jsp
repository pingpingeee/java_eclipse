<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean class="question.Arithmetic" id="arithmetic"></jsp:useBean>
<jsp:setProperty property="*" name="arithmetic"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>당신이 입력한 정보</h4>
	<%
	out.print(arithmetic.process(arithmetic.getNum1(), arithmetic.getNum2(), arithmetic.getCal()));
	%>
</body>
</html>