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
	
		int y = cal.get(Calendar.YEAR)-1;
		int m = cal.get(Calendar.MONTH)-1;
		int d = cal.get(Calendar.DATE)-3;
		
		return y+"-"+m+"-"+d;
	}
	%>
	1년 2달 3일전 = 
	<%=calDate()%>
</body>
</html>