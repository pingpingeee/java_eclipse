<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
	public String calDate(){
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, 1);
		
		int y = cal.get(Calendar.YEAR);
		int m = cal.get(Calendar.MONTH)+1;
		int d = cal.get(Calendar.DATE);
		
		return y+"-"+m+"-"+d;
	}
	%>
	<%=calDate()%>
</body>
</html>