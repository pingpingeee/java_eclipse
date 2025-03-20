package magic.border;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDBBean {
	private static BoardDBBean instance = new BoardDBBean();

	public static BoardDBBean getInstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception {
		return ((DataSource) (new InitialContext().lookup("java:comp/env/jdbc/oracle"))).getConnection();
	}
	
	public int insertBoard(BoardBean board) throws Exception {
		PreparedStatement pstmt = null;
		Connection conn = null;
		int re = -1;

		String sql = "insert into boardt values(?, ?, ?, ?)";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, board.getB_name());
			pstmt.setString(2, board.getB_email());
			pstmt.setString(3, board.getB_title());
			pstmt.setString(4, board.getB_content());

			// 쿼리 정상 실행되면 1 저장
			re = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return re;
	}
}
