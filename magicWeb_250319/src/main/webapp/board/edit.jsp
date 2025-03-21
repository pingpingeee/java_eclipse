<%@page import="magic.border.BoardBean"%>
<%@page import="magic.border.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="board.js" type="text/javascript"></script>
<body>
<%
	BoardDBBean manager = BoardDBBean.getInstance();
	int b_id = Integer.parseInt(request.getParameter("b_id"));
	BoardBean board = manager.getBoard(b_id, false);
%>
	<center>
		<h1>글 수 정 하 기</h1>
		<form method="post" action="edit_ok.jsp?b_id=<%= b_id %>" name="reg_frm">
			<table>
				<tr height="30">
					<td width="80">작성자</td>
					<td width="140">
					<input type="text" size="10" name="b_name" maxlength="20"
					value="<%=board.getB_name()%>"></td>
					<td width="80">이메일</td>
					<td width="140">
					<input type="text" size="24" name="b_email" maxlength="50"
					value="<%=board.getB_email()%>"></td>
				</tr>
				<tr height="30">
					<td width="80">글제목</td>
					<td width="460" colspan="3">
					<input type="text" size="55" name="b_title" maxlength="80"
					value="<%=board.getB_title()%>"></td>
				</tr>
				<tr height="30">
					<td width="460" colspan="4">
					<textarea rows="10" cols="65" name="b_content"><%=board.getB_content()%>
					</textarea>
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
						<input type="button" value="글수정" onclick="check_ok()">
						<input type="reset" value="다시작성">
						<input type="button" value="글목록" onclick="location='list.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>