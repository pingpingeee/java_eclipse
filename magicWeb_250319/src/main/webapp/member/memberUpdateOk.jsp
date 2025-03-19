<%@page import="magic.member.MemberBean"%>
<%@page import="magic.member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String s_uid = (String)session.getAttribute("uid");
	String pwd = request.getParameter("mem_pwd");
	String email = request.getParameter("mem_email");
	MemberDBBean manager = MemberDBBean.getInstance();

	int check = manager.userUpdate(s_uid, pwd, email);
	MemberBean mb = manager.getMember(s_uid);
	
	
	
	if (mb == null){
		%>
		<script>
			alert("mb가 존재하지않음");
			history.back();
		</script>
		<%
	} else {
		if(check == 1){
			%>
			<script>
				alert("회원정보가 수정되었습니다.");
				history.back();
			</script>
			<%
			// response.sendRedirect("main.jsp");
		} else {
			%>
			<script>
				alert("오류가 발생하였습니다.");
				history.back();
			</script>
			<%
		}
	}
%>
</body>
</html>