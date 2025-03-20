package magic.border;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;

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
		ResultSet rs = null;

		//String sql = "insert into boardt(b_id, b_name, b_email, b_title, b_content, b_date) values(?, ?, ?, ?, ?, ?)";
		String sql = "insert into boardt(b_id, b_name, b_email, b_title, b_content, b_date)"
				+ "values((select nvl(max(b_id), 0)+1 from boardt), ?, ?, ?, ?, ?)";

		try {
			conn = getConnection();

//			String f_sql = "SELECT MAX(b_id) FROM boardt";
//			pstmt = conn.prepareStatement(f_sql);
//			rs = pstmt.executeQuery();
//			int maxId = 1;
//
//			if (rs.next() && rs.getInt(1) > 0) {
//				maxId = rs.getInt(1) + 1;
//			}

			pstmt = conn.prepareStatement(sql);
			//pstmt.setInt(1, maxId);
			pstmt.setString(1, board.getB_name());
			pstmt.setString(2, board.getB_email());
			pstmt.setString(3, board.getB_title());
			pstmt.setString(4, board.getB_content());
			//pstmt.setTimestamp(5, Timestamp.valueOf(LocalDateTime.now()));
			pstmt.setTimestamp(5, board.getB_date());
			
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

	public ArrayList<BoardBean> listBoard() throws Exception {
		ArrayList<BoardBean> boardList = new ArrayList<>();

		PreparedStatement pstmt = null;
		Connection conn = null;
		ResultSet rs = null;

		String sql = "select b_id, b_name, b_email, b_title, b_content, b_date from boardt order by b_id";

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				// BoardBean 객체 생성 및 데이터 설정
				BoardBean board = new BoardBean();
				board.setB_id(rs.getInt("b_id")); // b_id 가져오기
				board.setB_name(rs.getString("b_name")); // 작성자
				board.setB_email(rs.getString("b_email")); // 이메일
				board.setB_title(rs.getString("b_title")); // 제목
				board.setB_content(rs.getString("b_content")); // 내용
                board.setB_date(rs.getTimestamp("b_date"));

				// ArrayList에 추가
				boardList.add(board);
			}

			// 쿼리 정상 실행되면 1 저장
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
		return boardList;
	}

	public BoardBean getBoard(int b_id) throws Exception {
		PreparedStatement pstmt = null;
		Connection conn = null;
		ResultSet rs = null;
		BoardBean board = null;

		String sql = "select b_id, b_name, b_email, b_title, b_content, b_date from boardt where b_id=?";

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_id);

			// 쿼리 정상 실행되면 1 저장
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				board = new BoardBean();
				
				board.setB_id(rs.getInt(1));
				board.setB_name(rs.getString(2));
				board.setB_email(rs.getString(3));
				board.setB_title(rs.getString(4));
				board.setB_content(rs.getString(5));
				board.setB_date(rs.getTimestamp(6));
			}
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
		return board;
	}
}
