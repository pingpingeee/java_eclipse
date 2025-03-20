<%@page import="magic.border.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="magic.border.BoardBean" id="board"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>
<%
	request.setCharacterEncoding("utf-8");
	BoardDBBean manager = BoardDBBean.getInstance();
	
	int check = manager.insertBoard(board);
	
	if(check == 1){
		%>
		<script>
			alert("글작성 완료");
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
%>