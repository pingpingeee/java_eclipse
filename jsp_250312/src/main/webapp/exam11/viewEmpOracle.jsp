<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="800" border="1">
		<tr>
			<td>사원번호</td>
			<td>사원명</td>
			<td>직급</td>
			<td>상관번호</td>
			<td>입사일자</td>
			<td>급여</td>
			<td>커미션</td>
			<td>부서번호</td>
		</tr>

		<%
		try {
			//고정
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;

			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "scott";
			String pw = "tiger";

			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pw);

			String sql = "select * from emp";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			//고정

			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getInt("empno")%></td>
			<td><%=rs.getString("ename")%></td>
			<td><%=rs.getString("job")%></td>
			<td><%=rs.getInt("mgr")%></td>
			<td><%=rs.getString("hiredate")%></td>
			<td><%=rs.getInt("sal")%></td>
			<td><%=rs.getInt("comm")%></td>
			<td><%=rs.getInt("deptno")%></td>
		</tr>
		<%
		}

		} catch (SQLException e) {
		out.print("데이터베이스 연결 실패");
		out.print(e.getMessage());
		}
		%>
	</table>
</body>
</html>