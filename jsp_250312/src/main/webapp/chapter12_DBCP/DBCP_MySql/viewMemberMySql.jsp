<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	String url = "jdbc:mysql://localhost:3306/jspdb";
	String user = "root";
	String pw = "1234";

	String sql = "select id, pw, name, class, tel from member";%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>
	<table width="400" border="1">
		<tr>
			<td>아이디</td>
			<td>이름</td>
			<td>등급</td>
			<td>전화번호</td>
		</tr>
		<%
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, pw);

			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
		%>
		<tr>
			
			<td>
			<a href="updateMemeberMySql.jsp?id=<%=rs.getString("id")%>">
			<%=rs.getString("id")%>
			</a>
			</td>
			
			<td><%=rs.getString("name")%></td>
			<!--  <td><%=rs.getInt("class")%></td>-->
			<td>
				<%
				int n_class = rs.getInt("class");
				if (n_class == 1)
					out.print("일반회원");
				else
					out.print("교수님");
				%>
			</td>
			<td><%=rs.getString("tel")%></td>
		</tr>
		<%
		}
		} catch (SQLException e) {
		out.print("데이터베이스 연결 실패");
		out.print(e.getMessage());
		} finally {
		try {
		if (conn != null)
			conn.close();
		if (stmt != null)
			stmt.close();
		if (rs != null)
			rs.close();
		} catch (SQLException e) {
		e.printStackTrace();
		}
		}
		%>
	</table>
</body>
</html>