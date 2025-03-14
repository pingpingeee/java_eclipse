<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 쿠키를 담을 배열객체 생성
	Cookie[] cookies = request.getCookies();
	
	for(int i=0;i< cookies.length; i++){
		out.print(i + "번째 쿠키의 이름 => " + cookies[i].getName() + "삭제<br>");
		// 유효시간을 0으로 설정
		cookies[i].setMaxAge(0); 
		cookies[i].setPath("/");
		// 삭제정보 추가
		response.addCookie(cookies[i]);
	}
%>