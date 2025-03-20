<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<%
	request.setCharacterEncoding("utf-8");
%>
	<center>
		<h1>글 올 리 기</h1>
		<form method="post" action="write_ok.jsp">
			<table>
				<tr height="30">
					<td width="80">작성자</td>
					<td width="140"><input type="text" size="10" name="b_name"
						maxlength="20"></td>
					<td width="80">이메일</td>
					<td width="140"><input type="text" size="24" name="b_email"
						maxlength="50"></td>
				</tr>
				<tr height="30">
					<td width="80">글제목</td>
					<td width="460" colspan="3"><input type="text" size="55"
						name="b_title" maxlength="80"></td>
				</tr>
				<tr height="30">
					<td width="460" colspan="4">
					<textarea rows="10" cols="65" name="b_content"></textarea>
					</td>
				</tr>
				<tr height="50" align="right">
					<td colspan="4">
						<input type="submit" value="글쓰기">
						<input type="reset" value="다시작성">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>