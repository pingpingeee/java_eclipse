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
		String id = "1234";
		String pw = "1234";
		
	%>
	<%
		String s_id = request.getParameter("id");
		String s_pw = request.getParameter("pw");
		
		if(id.equals(s_id) && pw.equals(s_pw)){
			Cookie cookie = new Cookie("UserID", s_id);
			cookie.setMaxAge(365*24*60*60);
			cookie.setPath("/");
			response.addCookie(cookie);
			response.sendRedirect("welcome.jsp");
		}else{
			response.sendRedirect("cookie.jsp");
		}
	%>
</body>
</html>