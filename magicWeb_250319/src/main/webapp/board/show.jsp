<%@page import="java.text.SimpleDateFormat"%>
<%@page import="magic.border.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="magic.border.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
</head>
<body>
<%
    // 게시글 리스트 가져오기
    BoardDBBean manager = BoardDBBean.getInstance();
	String id = request.getParameter("b_id");
	int b_id = Integer.parseInt(id);
    BoardBean board = manager.getBoard(b_id, true);
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:dd");
%>

<center>
    <h1>글 내 용 보 기</h1>
	<table border="1" width="600" cellspacing="0">
        <tr height="30" align="center">
            <td width="100">글번호</td>
            <td width="200">
            <%= board.getB_id()%>
            </td>
            <td width="100">조회수</td>
            <td width="200">
            <%= board.getB_hit()%>
            </td>
        </tr>
        <tr height="30" align="center">
            <td width="100">작성자</td>
            <td width="200">
            <%= board.getB_name() %>
            </td>
            <td width="100">작성일</td>
            <td width="200">
            <%= sdf.format(board.getB_date()) %>
            </td>
        </tr>
        <tr height="30" align="center">
            <td width="100">글제목</td>
            <td width="200" align="left" colspan="3">
            <%= board.getB_title() %>
            </td>
        </tr>
        <tr height="30" align="center">
            <td width="100">글내용</td>
            <td width="200" align="left" colspan="3">
            <%= board.getB_content()%>
            </td>
        </tr>
        <tr height="30" align="center">
				<td align="right" colspan="4">
					<input type="button" value="글수정"
					 onclick="location.href='edit.jsp?b_id=<%= board.getB_id() %>'">
					<input type="button" value="글삭제"
					 onclick="location.href='delete.jsp?b_id=<%= board.getB_id() %>'">
					<input type="button" value="답변글"
					 onclick="location.href='write.jsp?b_id=<%= board.getB_id() %>'">
					<input type="button" value="글목록" onclick="location='list.jsp'"> 
				</td>
			</tr>
    </table>
</center>
</body>
</html>
