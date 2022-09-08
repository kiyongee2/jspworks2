package com.common;

import java.sql.Connection;

public class JDBCTest {
	
	public static void main(String[] args) {
		//연결 객체 선언
		Connection conn = JDBCUtil2.getConnention();
		System.out.println(conn + " DB 객체 생성");
	}
}
