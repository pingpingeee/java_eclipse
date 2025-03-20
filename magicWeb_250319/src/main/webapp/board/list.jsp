<%@page import="java.sql.Date"%>
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
    ArrayList<BoardBean> boardList = manager.listBoard();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    
%>

<center>
    <h1>게시판에 등록된 글 목록 보기</h1>
    <table width="600">
    	<tr>
    		<td align="right">
			    <a href="write.jsp">글 쓰 기</a>
    		</td>
    	</tr>
    </table>
</center>
<center>
	<table border="1" width="800" cellspacing="0">
        <tr height="25">
            <th width="40">번호</th>
            <th width="450">글제목</th>
            <th width="120">작성자</th>
            <th width="220">작성일</th>
        </tr>

        <% 
/*         	
			for문사용해서 변수에 담음
			int b_uid = 0;
        	String b_name, b_email, b_title, b_content;
            // 리스트에 저장된 데이터 반복 출력
            for(int i=0;i<boardList.size();i++) {
            	BoardBean board = boardList.get(i);
            	b_uid = board.getB_id();
            	b_name = board.getB_name();
            	b_email = board.getB_email();
            	b_title = board.getB_title();
            	b_content = board.getB_content();            	
            } */
            for (BoardBean board : boardList) { 
        %>
        <tr align="center" bgcolor="#f7f7f7" 
        	onmouseover="this.style.backgroundColor='#eeeeef'"
        	onmouseout="this.style.backgroundColor='#f7f7f7'">
        	<!-- 글 번호 -->
            <td>
            <%= board.getB_id() %>
            </td>  
            <!-- 글 제목 --> 
            <td align="left">
<%--             <a href="show.jsp?b_id=<%= board.getB_id() %>"> --%>
            <a href="show.jsp?b_id=<%= board.getB_id() %>">
            <%= board.getB_title() %>
            </a>
			</td>
			<!-- 작성자 -->
            <td>
	            <a href="mailto:"<%=board.getB_email() %>>
	            <%= board.getB_name() %>
	            </a>
            </td> 
            <td>
<%-- 	            <%= board.getB_date() %> --%>
				<%= sdf.format(board.getB_date()) %>
	            </a>
            </td> 
        </tr>
        <% } %>
    </table>
</center>
</body>
</html>
