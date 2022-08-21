package com.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.common.JDBCUtil;

public class BoardDAO {
	//JDBC 관련 변수
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	//새글 추가
	public void insertBoard(Board board) {
		conn = JDBCUtil.getConnention();
		String sql = "INSERT INTO t_board(title, content, memberId)"
				+ " VALUES (?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setString(3, board.getMemberId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
	
	//게시글 목록
	/*public ArrayList<Board> getListAll(){
		ArrayList<Board> boardList = new ArrayList<>();
		
		try {
			conn = JDBCUtil.getConnention();
			String sql = "SELECT * FROM t_board ORDER BY bnum DESC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Board board = new Board();
				board.setBnum(rs.getInt("bnum"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setRegDate(rs.getDate("regdate"));
				board.setMemberId(rs.getString("memberId"));
				boardList.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return boardList;
	}*/
	
	//게시글 총 개수
	public int getBoardCount() {
		int total = 0;
		try {
			conn= JDBCUtil.getConnention();
			String sql = "SELECT COUNT(*) total From t_board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				total = rs.getInt("total");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return total;
	}
	
	//페이징 처리
	public ArrayList<Board> getListAll(int startRow, int pageSize){
		ArrayList<Board> boardList = new ArrayList<>();
		try {
			conn = JDBCUtil.getConnention();
			String sql = "SELECT * FROM t_board ORDER BY bnum DESC limit ?, ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);  //시작 행
			pstmt.setInt(2, pageSize);    //페이지 당 게시글 수
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Board board = new Board();
				board.setBnum(rs.getInt("bnum"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setRegDate(rs.getDate("regdate"));
				board.setMemberId(rs.getString("memberId"));
				boardList.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return boardList;
	}
	
	//게시글 상세 보기
	public Board getBoard(int bnum) {
		Board board = new Board();
		try {
			conn= JDBCUtil.getConnention();
			String sql = "SELECT * FROM t_board WHERE bnum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bnum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				board.setBnum(rs.getInt("bnum"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setMemberId(rs.getString("memberId"));
				board.setRegDate(rs.getDate("regdate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return board;
	}
	
	//게시글 삭제
	public void deleteBoard(int bnum) {
		try {
			conn= JDBCUtil.getConnention();
			String sql = "DELETE FROM t_board WHERE bnum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bnum);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
	
	//게시글 수정
	public void updateBoard(Board board) {
		try {
			conn= JDBCUtil.getConnention();
			String sql = "UPDATE t_board SET title=?, content=? WHERE bnum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setInt(3, board.getBnum());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
}








