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
	int b_id = Integer.parseInt((String) request.getParameter("b_id"));
    BoardBean board = manager.getBoard(b_id);
    
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
    </table>
</center>
</body>
</html>
