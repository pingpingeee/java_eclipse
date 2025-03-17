<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean class="question.Money" id="money"></jsp:useBean>
    <jsp:setProperty property="money" name="money"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
out.print("입력된 금액이 " + money.getMoney() + "는<br>" + money.process());
%>
</body>
</html>