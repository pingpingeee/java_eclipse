<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
	<h3>
	[세션 값을 얻어오는 예제 - 3]
	</h3>
	</center>
	<hr>
	<%
		// 세션 고유 아이디
		String str_id = session.getId();
		
		// 클라이언트로 마지막으로 요청 보낸 시간을 long형으로 반환
		long last_time = session.getLastAccessedTime();
		
		// 세션이 만들어진 시간
		long create_time = session.getCreationTime();
		
		// 사이트 접속 시간(분)
		long time_used = (last_time - create_time) / 60000;
		
		// 세션 유지 시간(기본 30분) 현재는 분으로 계산
		int inactive = session.getMaxInactiveInterval() / 60;
		
		// 처음 생성된 세션이면 참, 아니면 거짓
		boolean b_new = session.isNew();
		
		
	%>
	
	
	[1] 세션 ID는 [<%= str_id %>] 입니다.<br><hr>
	[2] 웹사이트에 머문 시간은 [<%= time_used %>] 분입니다.<br><hr>
	[3] 세션 유효 시간은  [<%= inactive %>] 분입니다.<br><hr>
	[4] 세션이 새로 만들어졌나요?
	
	<% if(b_new) {
		out.print("새로 만든 세션");
	} else {
		out.print("아니오");
	}
		%>
</body>
</html>