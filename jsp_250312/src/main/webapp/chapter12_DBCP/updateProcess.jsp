<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	DataSource ds = null;%>
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
	
	// 이 try-catch에서 값이 변경 되었을 때 예외 처리
	try {
		/*Context ctx = new InitialContext();
		ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		conn = ds.getConnection();*/
		conn = ((DataSource) (new InitialContext().lookup("java:comp/env/jdbc/oracle"))).getConnection();
		
	 	StringBuffer selectQuery = new StringBuffer();
		String id = request.getParameter("id");
		selectQuery.append("select name, class, tel from member2 where id=?");
		pstmt = conn.prepareStatement(selectQuery.toString());
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
	} catch (SQLException ex) {
		out.print("데이터베이스 연결 실패");
		out.print(ex.getMessage());
	}
	
	try {
		StringBuffer selectQuery = new StringBuffer();
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String vclass = request.getParameter("class");
		String tel = request.getParameter("tel");

		selectQuery.append("update member2 set name = ?, class = ?, tel = ? where id=?");

		pstmt = conn.prepareStatement(selectQuery.toString());
		pstmt.setString(1, name);
		pstmt.setInt(2, Integer.parseInt(vclass));
		pstmt.setString(3, tel);
		pstmt.setString(4, id);
		int rs = pstmt.executeUpdate();

		if (rs == 1) {
	%>
	<%=id%>의 정보가 수정되었습니다.
	<a href="viewMemberOracle.jsp">[목록보기]</a>

	<%
		} else {
	%>
	<font color="red">아이디가 없음</font>
	<a href="viewMemberOracle.jsp">목록보기</a>
	<%
		}
	} catch (SQLException e) {
		out.print("데이터베이스 연결 실패");
		out.print(e.getMessage());
	}
	%>
</body>
</html>