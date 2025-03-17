<%@page import="java.util.Enumeration"%>
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
		
	session.removeAttribute("admin");
// 		session.invalidate();
		out.print("<hr><h3>---세션 값을 삭제한 후---</h3>");
		
		Enumeration enum_app = session.getAttributeNames();
		
		int i = 0;
		
		if(session == null) {
			out.print("no session");
		}
		else {
			
		while(enum_app.hasMoreElements()) {
			i++;
			String s_name = enum_app.nextElement().toString();
			String s_value = session.getAttribute(s_name).toString();
			
			out.print("<br>얻어온 세션 이름 [ "+i+" ] "+s_name+"<br>");
			out.print("<br>얻어온 세션 값 [ "+i+" ] "+s_value+"<br>");
		}
		}
		

%>
</body>
</html>