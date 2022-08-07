package com.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.common.JDBCUtil;

public class MemberDAO {
	//JDBC 관련 변수
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	//회원 추가
	public void addMember(Member member) {
		try {
			conn = JDBCUtil.getConnention();
			String sql = "INSERT INTO t_member(memberid, passwd, name, gender) VALUES (?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getPasswd());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getGender());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
	
	//회원 목록
	public ArrayList<Member> getListAll(){
		ArrayList<Member> memberList = new ArrayList<>();
		
		try {
			conn = JDBCUtil.getConnention();
			String sql = "SELECT * FROM t_member ORDER BY joindate";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Member member = new Member();
				member.setMemberId(rs.getString("memberId"));
				member.setPasswd(rs.getString("passwd"));
				member.setName(rs.getString("name"));
				member.setGender(rs.getString("gender"));
				member.setJoinDate(rs.getDate("joindate"));
				memberList.add(member);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return memberList;
	}
	
	//로그인
	/*public int login(String memberId, String password) {
		try {
			conn = JDBCUtil.getConnention();
			String sql = "SELECT * FROM t_member WHERE memberid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			if(rs.next()) { //아이디 일치
				String dbPw = rs.getString("passwd");
				if(dbPw.equals(password)) {
					return 1;  //비밀번호 일치
				}else {
					return -1;  //비밀번호 불일치
				}
			}else {
				return 0;  //아이디 불일치
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return -2;  //db 오류
	}*/
	
	//로그인 처리
	public boolean login(Member member) {
		try {
			conn = JDBCUtil.getConnention();
			String sql = "SELECT * FROM t_member WHERE memberid=? and passwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getPasswd());
			rs = pstmt.executeQuery();
			if(rs.next()) {   //아이디와 비밀번호 일치
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return false; 
	}
	
	/*public Member login(Member member) {
		Member loginMember = null;
		try {
			conn = JDBCUtil.getConnention();
			String sql = "SELECT * FROM t_member WHERE memberid=? and passwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getPasswd());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				loginMember = new Member();
				loginMember.setMemberId(rs.getString("memberId"));
				loginMember.setPasswd(rs.getString("passwd"));
				loginMember.setName(rs.getString("name"));
				loginMember.setGender(rs.getString("gender"));
				loginMember.setJoinDate(rs.getDate("joindate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return loginMember;
	}*/
	
	//회원 이름 가져오기
	public String getNameByLogin(String memberId) {
		try {
			conn = JDBCUtil.getConnention();
			String sql = "SELECT name FROM t_member WHERE memberid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString("name");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return null;
	}
	
	//회원 삭제
	public void deleteMember(String memberId) {
		try {
			conn = JDBCUtil.getConnention();
			String sql = "DELETE FROM t_member WHERE memberId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
		
	//회원 상세 보기
	public Member getMember(String memberId) {
		Member member = new Member();
		try {
			conn= JDBCUtil.getConnention();
			String sql = "SELECT * FROM t_member WHERE memberId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member.setMemberId(rs.getString("memberId"));
				member.setPasswd(rs.getString("passwd"));
				member.setName(rs.getString("name"));
				member.setGender(rs.getString("gender"));
				member.setJoinDate(rs.getDate("joindate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return member;
	}
	
	//회원 수정
	public void updateMember(Member member) {
		try {
			conn = JDBCUtil.getConnention();
			String sql = "UPDATE t_member SET passwd=?, name=?, gender=? WHERE memberId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getPasswd());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getGender());
			pstmt.setString(4, member.getMemberId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
}














