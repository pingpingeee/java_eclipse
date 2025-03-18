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

	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "scott";
	String pw = "tiger";

	String sql = "select id, pw, name, class, tel from member2";%>
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
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pw);

			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
		%>
		<tr>
			<%-- <td><%=rs.getString("id")%></td> --%>
			
			<td>
<!-- 데이터 넘기는 방법  -->
<!-- 1번을 실무에서 많이 사용 : 수정(클릭하는 시점을 반영) -->
<!-- 1. 해당키(ex>아이디)만 넘길 때  -->
<!-- 아이디를 가지고 가서 조회 -->
<!-- select~ where id=? -->
			
<!-- 2. 모든 데이터 넘길 때  -->
<!-- ?id= &name= &tel= -->
			<a href="updateMemeberOracle.jsp?id=<%=rs.getString("id")%>">
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