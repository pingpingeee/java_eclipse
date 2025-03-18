<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "scott";
	String pw = "tiger";%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="400" border="1">
		<tr>
			<td>컬럼명</td>
			<td>컬럼형식</td>
			<td>컬럼길이</td>
			<td>널값여부</td>
		</tr>

		<%
		String tableName = request.getParameter("str");
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pw);

			String sql = "select column_name, data_type, data_length, nullable from user_tab_columns where table_name = '"
			+ tableName + "'";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			// sb.setLength(0) stringbuffer 초기화

			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("column_name")%></td>
			<td><%=rs.getString("data_type")%></td>
			<td><%=rs.getString("data_length")%></td>
			<td><%=rs.getString("nullable")%></td>
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