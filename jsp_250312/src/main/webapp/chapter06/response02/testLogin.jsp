<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String s_id="hong";
	String s_pw="1234";
	String s_name="홍길동";
	
	if(s_id.equals(request.getParameter("id"))
			&& s_pw.equals(request.getParameter("pw")))
	{
		// response.sendRedirect("main.jsp");
		// main.jsp?name : main.jsp로 name값을 넘김
		// response.sendRedirect("main.jsp?name=" + s_name);
	// URLEncoder.encode : 변수에 있는 한글 값을 인코딩
		response.sendRedirect("main.jsp?name=" + URLEncoder.encode(s_name, "utf-8"));
	}else{
		response.sendRedirect("login.html");
	}
%>