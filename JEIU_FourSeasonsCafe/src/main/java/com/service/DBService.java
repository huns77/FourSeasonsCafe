package com.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBService {
	public static DBService single = null;
	
	public static DBService getInstance() {
		if(single == null) {
			single = new DBService();
		}
		
		return single;
	}
	
	public DBService() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConnection() {
		Connection connection = null;
		
		try {
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafe_db", "root", "soclsrn11!");
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return connection;
	}
	
	public void closeAll(Connection conn, Statement stmt, ResultSet rs) {
	    try {
	        if (rs != null) rs.close();
	        if (stmt != null) stmt.close();
	        if (conn != null) conn.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	
	public void closeAll(Connection con, PreparedStatement pstmt) {
		try {
			pstmt.close();
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
