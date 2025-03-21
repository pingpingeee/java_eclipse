<%@page import="magic.border.BoardBean"%>
<%@page import="magic.border.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int b_id = 0, b_ref = 1, b_step = 0 , b_level = 0;
	String b_title = "";
	if(request.getParameter("b_id") != null){ // 답변글(show.jsp에서 글번호를 가지고 옴)
		b_id = Integer.parseInt(request.getParameter("b_id"));
	}
	
	BoardDBBean manager = BoardDBBean.getInstance();
	BoardBean board = manager.getBoard(b_id, false);
	
	if(board != null){ // 답변글
		b_ref = board.getB_ref();
		b_step = board.getB_step();
		b_level = board.getB_level();
		b_title = board.getB_title();
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="board.js" type="text/javascript"></script>
<body>
<%request.setCharacterEncoding("UTF-8");%>
	<center>
		<h1>글 올 리 기</h1>
		<form method="post" action="write_ok.jsp" name="reg_frm">
			<input type="hidden" name="b_id" value="<%= b_id %>">
			<input type="hidden" name="b_ref" value="<%= b_ref %>">
			<input type="hidden" name="b_step" value="<%= b_step %>">
			<input type="hidden" name="b_level" value="<%= b_level %>">
			<table>
				<tr height="30">
					<td width="80">작성자</td>
					<td width="140">
					<input type="text" size="10" name="b_name" maxlength="20"></td>
					<td width="80">이메일</td>
					<td width="140">
					<input type="text" size="24" name="b_email" maxlength="50"></td>
				</tr>
				<tr height="30">
					<td width="80">글제목</td>
					<td width="460" colspan="3">
					<%
						if(b_id == 0){ // 신규글
							%>
								<input type="text" size="55"
									name="b_title" maxlength="80"></td>
							<%
						} else { // 답변글
							%>
								<input type="text" size="55"
									name="b_title" maxlength="80" value="[답변]:<%= b_title %>"></td>
							<%
						}
					%>
				</tr>
				<tr height="30">
					<td width="460" colspan="4">
					<textarea rows="10" cols="65" name="b_content"></textarea>
					</td>
				</tr>
				<tr height="30">
					<td width="80">암호</td>
					<td width="140">
					<input type="password" name="b_pwd" size="10" maxlength="12">
					</td>
				</tr>
				<tr height="50" align="right">
					<td colspan="4">
						<input type="button" value="글쓰기" onclick="check_ok()">
						<input type="reset" value="다시작성">
						<input type="button" value="글목록" onclick="location='list.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>