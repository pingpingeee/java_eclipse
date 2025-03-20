<%@page import="java.sql.Timestamp"%>
<%@page import="magic.border.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="magic.border.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="magic.border.BoardBean" id="board"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>
<%
	board.setB_date(new Timestamp(System.currentTimeMillis()));
	BoardDBBean manager = BoardDBBean.getInstance();
	
	int check = manager.insertBoard(board);
	ArrayList<BoardBean> boardList = manager.listBoard();
	
	
	if(boardList != null){
		response.sendRedirect("list.jsp");
	}else{
		response.sendRedirect("write.jsp");		
	}
	
	
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