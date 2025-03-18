<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
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
	<%
	// 데이터베이스 연결을 위한 인터페이스
	Connection conn = null;
	try {
		// 연결정보 => 자신 PC에 포트:1521, SID:xe
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "scott";
		String pw = "tiger";
		
		// jdbc 드라이버 로딩
		Class.forName("oracle.jdbc.driver.OracleDriver");
		// getConnection 메소드로 DB연결
		conn = DriverManager.getConnection(url, user, pw);
		
		out.print("데이터베이스 연결 성공");
		//String sql = "select * from member";
		//Statement stmt = conn.createStatement();
		//ResultSet rs = stmt.executeQuery(sql);

		
	} catch(SQLException e) {		
		out.print("데이터베이스 연결 실패");
		out.print(e.getMessage());
	} finally {
		// Connection 객체에 연결정보가 있으면 연결 종료
		if(conn != null) conn.close();
	}
	%>
</body>
</html>