<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	
	for(int i=0;i< cookies.length; i++){
		cookies[i].setMaxAge(0); 
		cookies[i].setPath("/");
		// 삭제정보 추가
		response.addCookie(cookies[i]);
	}
	response.sendRedirect("cookie.jsp");
%>