<%@page import="java.net.URLEncoder"%>
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

	String url = "jdbc:mysql://localhost:3306/jspdb";
	String user = "root";
	String password = "1234";%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	%>
	<%
	String id = "", pw = "", name = "", vclass = "", phone1 = "", phone2 = "", phone3 = "";
	id = request.getParameter("id");
	pw = request.getParameter("pw");
	name = request.getParameter("name");
	vclass = request.getParameter("mclass");
	phone1 = request.getParameter("phone1");
	phone2 = request.getParameter("phone2");
	phone3 = request.getParameter("phone3");

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");

		conn = DriverManager.getConnection(url, user, password);

		stmt = conn.createStatement();

		StringBuffer insertQuery = new StringBuffer();
		insertQuery.append("insert into member values('");
		insertQuery.append(id + "', '");
		insertQuery.append(pw + "', '");
		insertQuery.append(name + "', '");
		insertQuery.append(vclass + "', '");
		insertQuery.append(phone1 + "-" + phone2 + "-" + phone3 + "')");

		//out.print(insertQuery);
		int re = stmt.executeUpdate(insertQuery.toString());

		if (re == 1) {
	%>
	추가 성공
	<br>
	<a href="addFormMySql.html">추가작업</a>
	<a href="..\exam11\viewMemberSql.jsp">조회작업</a>
	<%
	} else {
	%>
	<font color="red">추가 실패</font>
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
</body>
</html>