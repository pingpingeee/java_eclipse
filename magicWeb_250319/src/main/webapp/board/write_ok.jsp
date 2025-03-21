<%@page import="java.net.InetAddress"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="magic.border.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean class="magic.border.BoardBean" id="board"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>
<%
	board.setB_date(new Timestamp(System.currentTimeMillis()));
	BoardDBBean manager = BoardDBBean.getInstance();
	
	
// 	board.setB_ip(request.getRemoteAddr());
	InetAddress address = InetAddress.getLocalHost();
	String ip = address.getHostAddress();
	board.setB_ip(ip);

	
	int check = manager.insertBoard(board);
	
	
	if(check == 1){
		%>
		<script>
			alert("글작성 완료");
			location.href="list.jsp";
		</script>
		<%
	} else {
		%>
		<script>
			alert("오류가 발생하였습니다.");
			history.back();
		</script>
		<%
	}
%>

