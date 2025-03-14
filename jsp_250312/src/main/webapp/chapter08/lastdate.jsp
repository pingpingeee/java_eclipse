<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie lastDate = null;
	String msg = ""; // 화면 출력 메세지
	boolean found = false; // 처음 방문 여부
	String newValue = ""+System.currentTimeMillis();//현재 시간 정보를 위한 값
	Cookie[] cookies = request.getCookies();
	
	if(cookies != null) {
		out.print("@# cookies.length => " + cookies.length);
		
		for(int i = 0; i < cookies.length; i++){
			lastDate = cookies[i];
			if(lastDate.getName().equals("lastDateCookie")){
				found = true;
				break;
			}
		}
		// if/else 처음 방문/아닐 때 (lastDate 객체에 값이 있음)
		if(!found){ // 처음방문
			msg="처음 방문입니다.";
		// 처음 방문일 때 lastDateCookie 쿠키이름으로 시간 정보를 저장
			lastDate = new Cookie("lastDateCookie", newValue);
			lastDate.setMaxAge(365*24*60*60);
			lastDate.setPath("/");
			response.addCookie(lastDate);
		}else {// 첫 방문이 아님(lastDate 객체에 값이 있음)
			//String conv = lastDate.getValue();
			long conv = Long.parseLong(lastDate.getValue());
			// Date 객체로 의미있는 시간 정보를 출력
			msg="마지막 방문 : " + new Date(conv);
			// 다음 방문을 위한 값 설정
			lastDate.setValue(newValue);
			response.addCookie(lastDate);
		}
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2><%= msg %></h2>
</body>
</html>