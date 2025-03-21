<%@page import="magic.border.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	String pw = request.getParameter("b_pwd");
	int id = Integer.parseInt(request.getParameter("id"));
	BoardDBBean manager = BoardDBBean.getInstance();
	int re = manager.deleteBoard(id,pw);
	
	if(re==1) {
		%> 
		<script>
		alert("삭제 완료");
		location.href="list.jsp";
		</script>
		<%
	}
	else {
		%> 
		<script>
		alert("비밀번호가 다릅니다.");
		history.back();
		</script>
		<%
	}
%>