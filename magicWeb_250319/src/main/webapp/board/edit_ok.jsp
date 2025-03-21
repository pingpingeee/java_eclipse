<%@page import="magic.border.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="magic.border.BoardBean" id="board"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>
<% 
	int id = Integer.parseInt(request.getParameter("b_id"));
// 	String pw = request.getParameter("b_pwd");
// 	String title = request.getParameter("b_title");
// 	String content = request.getParameter("b_content");
	//int re = manager.editBoard(id, pw, title, content);
	BoardDBBean manager = BoardDBBean.getInstance();
	int re = manager.editBoard(board);
	
	if(re==1) {
		%> 
		<script>
		alert("수정완료");
		location.href="list.jsp";
		</script>
		<%
	} else {
		%> 
		<script>
		alert("비밀번호가 다릅니다.");
		history.back();
		</script>
		<%
	}
%>