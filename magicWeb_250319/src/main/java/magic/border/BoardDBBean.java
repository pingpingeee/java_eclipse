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
		String sql = "";
		String sql2 = "";
		//String sql = "insert into boardt(b_id, b_name, b_email, b_title, b_content, b_date) values(?, ?, ?, ?, ?, ?)";
//		String sql = "insert into boardt(b_id, b_name, b_email, b_title, b_content, b_date, b_pwd, b_ip)"
//				+ "values((select nvl(max(b_id), 0)+1 from boardt), ?, ?, ?, ?, ?, ?, ?)";
		int number;
		int id = board.getB_id();
		int b_ref = board.getB_ref();
		int b_step = board.getB_step();
		int b_level = board.getB_level();


		
		try {
			conn = getConnection();
			
//	        int b_ref = board.getB_id();
//	        int b_step = 0;
//	        int b_level = 0;
//
//	        if (b_ref == 0) {
//	            sql = "SELECT NVL(MAX(b_id), 0) + 1 FROM boardt";
//	            pstmt = conn.prepareStatement(sql);
//	            rs = pstmt.executeQuery();
//	            if (rs.next()) {
//	                b_ref = rs.getInt(1);
//	            }
//	        } else {
//	            sql = "SELECT MAX(b_step) FROM boardt WHERE b_ref=?";
//	            pstmt = conn.prepareStatement(sql);
//	            pstmt.setInt(1, b_ref);
//	            rs = pstmt.executeQuery();
//	            if (rs.next()) {
//	                b_step = rs.getInt(1) + 1;
//	            }
//
//	            sql = "SELECT MAX(b_level) FROM boardt WHERE b_ref=?";
//	            pstmt = conn.prepareStatement(sql);
//	            pstmt.setInt(1, b_ref);
//	            rs = pstmt.executeQuery();
//	            if (rs.next()) {
//	                b_level = rs.getInt(1) + 1;
//	            }
//	        }
			
			sql = "select max(b_id) from boardt";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				number =rs.getInt(1)+1;
			}else {
				number = 1;
			}
			
			if (id != 0) {
				sql2 = "update boardt set b_step=b_step+1 where b_ref = ? and b_step > ?";
				pstmt = conn.prepareStatement(sql2);
				pstmt.setInt(1, b_ref);
				pstmt.setInt(2, b_step);
				pstmt.executeUpdate();
				
				b_step = b_step + 1;
				b_level = b_level + 1;
			} else {
				b_ref = number;
				b_step = 0;
				b_level = 0;
			}
	        
			sql = "insert into boardt"
					+ "(b_id, b_name, b_email, b_title, b_content, "
					+ "b_date, b_pwd, b_ip, b_ref, b_step, b_level)"
					+ "values((select nvl(max(b_id), 0)+1 from boardt), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			//pstmt.setInt(1, maxId);
			pstmt.setString(1, board.getB_name());
			pstmt.setString(2, board.getB_email());
			pstmt.setString(3, board.getB_title());
			pstmt.setString(4, board.getB_content());
			//pstmt.setTimestamp(5, Timestamp.valueOf(LocalDateTime.now()));
			pstmt.setTimestamp(5, board.getB_date());
			pstmt.setString(6, board.getB_pwd());
			pstmt.setString(7, board.getB_ip());
			pstmt.setInt(8, b_ref);
			pstmt.setInt(9, b_step);
			pstmt.setInt(10, b_level);
			
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

//		String sql = "select b_id, b_name, b_email, b_title, b_content, b_date, b_hit, b_pwd, b_ip from boardt order by b_id";
		String sql = "select b_id, b_name, b_email, b_title, b_content, b_date, b_hit, b_pwd, b_ip, b_ref, b_step, b_level "
				+ "from boardt order by b_ref desc, b_step asc";

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				// BoardBean 객체 생성 및 데이터 설정
				BoardBean board = new BoardBean();
				board.setB_id(rs.getInt(1)); // b_id 가져오기
				board.setB_name(rs.getString(2)); // 작성자
				board.setB_email(rs.getString(3)); // 이메일
				board.setB_title(rs.getString(4)); // 제목
				board.setB_content(rs.getString(5)); // 내용
                board.setB_date(rs.getTimestamp(6));
                board.setB_hit(rs.getInt(7));
                board.setB_pwd(rs.getString(8));
                board.setB_ip(rs.getString(9));
                board.setB_ref(rs.getInt(10));
                board.setB_step(rs.getInt(11));
                board.setB_level(rs.getInt(12));

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

	public BoardBean getBoard(int b_id, boolean checkHit) throws Exception {
		PreparedStatement pstmt = null;
		Connection conn = null;
		ResultSet rs = null;
		BoardBean board = null;

		String sql = "select b_id, b_name, b_email, b_title, b_content, b_date, b_hit, b_pwd, b_ip, "
				+ "b_ref, b_step, b_level from boardt where b_id=?";

		try {
			conn = getConnection();
			
			if(checkHit) {
//				조회수 1증가 SQL
				String fsql = "update boardt set b_hit=b_hit+1 where b_id=?";
				pstmt = conn.prepareStatement(fsql);
				pstmt.setInt(1, b_id);
				pstmt.executeUpdate();
			}
//			사용예시
//			BoardDBBean manager = BoardDBBean.getInstance();
//			int b_id = Integer.parseInt(request.getParameter("b_id"));
//			BoardBean board = manager.getBoard(b_id, true);
			
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
				board.setB_hit(rs.getInt(7));
				board.setB_pwd(rs.getString(8));
				board.setB_ip(rs.getString(9));
				board.setB_ref(rs.getInt(10));
				board.setB_step(rs.getInt(11));
				board.setB_level(rs.getInt(12));
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
	
	public int deleteBoard(int id, String pw) {
		PreparedStatement pstmt = null;
		Connection conn = null;
		ResultSet rs = null;
		String pwd = "";
		int re = -1;

		String sql = "select b_pwd from boardt where b_id = ?";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				// 쿼리 결과에서 b_pwd 컬럼 데이터
				pwd = rs.getString(1);
				if (pwd.equals(pw)) {
					// 비밀번호 일치시 삭제 쿼리 실행
					sql = "delete from boardt where b_id = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, id);
					re = pstmt.executeUpdate();
				} else {
					re = 0;
				}
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
		return re;
	}
	
//	public int editBoard(int id, String pw, String title, String content) {
//	    PreparedStatement pstmt = null;
//	    Connection conn = null;
//	    ResultSet rs = null;
//	    String pwd = "";
//	    int re = -1;
//
//	    String sql = "SELECT b_pwd FROM boardt WHERE b_id = ?";
//
//	    try {
//	        conn = getConnection();
//	        pstmt = conn.prepareStatement(sql);
//	        pstmt.setInt(1, id);
//	        rs = pstmt.executeQuery();
//
//	        if (rs.next()) {
//	            pwd = rs.getString(1);
//	            if (pwd.equals(pw)) {
//	                // 비밀번호 일치 시 게시글 수정
//	                sql = "UPDATE boardt SET b_title = ?, b_content = ? WHERE b_id = ?";
//	                pstmt = conn.prepareStatement(sql);
//	                pstmt.setString(1, title);
//	                pstmt.setString(2, content);
//	                pstmt.setInt(3, id);
//	                re = pstmt.executeUpdate();
//	            } else {
//	                re = 0; // 비밀번호 불일치
//	            }
//	        }
//	    } catch (Exception e) {
//	        e.printStackTrace();
//	    } finally {
//	        try {
//	            if (rs != null) rs.close();
//	            if (pstmt != null) pstmt.close();
//	            if (conn != null) conn.close();
//	        } catch (Exception e) {
//	            e.printStackTrace();
//	        }
//	    }
//	    return re;
//	}
	public int editBoard(BoardBean board) {
	    PreparedStatement pstmt = null;
	    Connection conn = null;
	    ResultSet rs = null;
	    String pwd = "";
	    int re = -1;

	    String sql = "SELECT b_pwd FROM boardt WHERE b_id = ?";

	    try {
	        conn = getConnection();
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, board.getB_id());
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            pwd = rs.getString(1);
	            if (pwd.equals(board.getB_pwd())) {
	                // 비밀번호 일치 시 게시글 수정
	                sql = "UPDATE boardt SET b_name=?, b_email=?, b_title = ?, b_content = ? WHERE b_id = ?";
	                pstmt = conn.prepareStatement(sql);
	                pstmt.setString(1, board.getB_name());
	                pstmt.setString(2, board.getB_email());
	                pstmt.setString(3, board.getB_title());
	                pstmt.setString(4, board.getB_content());
	                pstmt.setInt(5, board.getB_id());
	                re = pstmt.executeUpdate();
	            } else {
	                re = 0; // 비밀번호 불일치
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	            if (conn != null) conn.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    return re;
	}
}
