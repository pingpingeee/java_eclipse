<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean class="area.Circle2" id="circle"></jsp:useBean>
<jsp:setProperty property="radius" name="circle"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>당신이 입력한 정보</h4>
	<%
	//circle.setRadius(Integer.parseInt(request.getParameter("radius")));
	out.print("반지름이 " + circle.getRadius() + "인 원의 면적 : " + circle.process(circle.getRadius()));
	%>
</body>
</html>