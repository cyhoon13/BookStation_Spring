package com.member.dao;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class JDBCTest {
 
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testConnection() {
		try(Connection con = DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:orcl",
				"bs1234",
				"1234")){
			System.out.println(con);
		}catch (Exception e) {
			fail(e.getMessage());
		}
	}
	
	private void fail(String message) {
		// TODO Auto-generated method stub
		
	}
}

