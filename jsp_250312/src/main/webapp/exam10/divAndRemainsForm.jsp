<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean class="question.DivAndRemains" id="divAndRemains"></jsp:useBean>
<jsp:setProperty property="num" name="divAndRemains"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>당신이 입력한 정보</h4>
	<%
	if(divAndRemains.process(divAndRemains.getNum())){
		out.print("입력된 정수가 " + divAndRemains.getNum()+"은 10의 1의 자리가 같습니다.");
	}else{
		out.print("입력된 정수가 " + divAndRemains.getNum()+"은 10의 1의 자리가 틀립니다.");
	}
		
	%>
</body>
</html>