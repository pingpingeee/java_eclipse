<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!Connection conn = null;
	//  쿼리문 이용을 위한 인터페이스
	Statement stmt = null;
	//  쿼리 결과를 반기 위한 인터페이스
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

			// 메소드 호출해서 쿼리이용하는 객체 생성
			stmt = conn.createStatement();
			// select쿼리실행 결과를 ResultSet에 담음
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("id")%></td>
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