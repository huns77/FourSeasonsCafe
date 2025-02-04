package com.order_bocket.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.x.protobuf.MysqlxCrud.Order;
import com.service.DBService;

public class OrderBocketDAO {
	public static OrderBocketDAO single = null;
	
	public static OrderBocketDAO getInstance() {
		if(single == null) {
			single = new OrderBocketDAO();
		}
		
		return single;
	}
	
	public List<OrderBocketDTO> getOrderBocketList(int user_id){
		List<OrderBocketDTO> list = new ArrayList<>();
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM orders_bocket WHERE user_id = ?";
		
		try {
			connection = DBService.getInstance().getConnection();
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, user_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				OrderBocketDTO obd = new OrderBocketDTO();
				
				obd.setId(rs.getInt("id"));
				obd.setProductName(rs.getString("product_name"));
				obd.setProduct_count(rs.getInt("product_count"));
				obd.setTotal_amount(rs.getInt("total_amount"));
				obd.setProductImage(rs.getString("product_image"));
				
				list.add(obd);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBService.getInstance().closeAll(connection, pstmt, rs);
		}
		
		return list;
	}
	
	public OrderBocketDTO getOrderBocketDTO(int order_bocket_id) {
		OrderBocketDTO obd = null;
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM orders_bocket WHERE id = ?";
		
		try {
			connection = DBService.getInstance().getConnection();
			pstmt = connection.prepareStatement(sql);
			
			pstmt.setInt(1, order_bocket_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				obd = new OrderBocketDTO();
				
				obd.setId(rs.getInt("id"));
				obd.setProductName(rs.getString("product_name"));
				obd.setProduct_count(rs.getInt("product_count"));
				obd.setTotal_amount(rs.getInt("total_amount"));
				obd.setProductImage(rs.getString("product_image"));
				obd.setUser_id(rs.getInt("user_id"));
				obd.setProduct_id(rs.getInt("product_id"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBService.getInstance().closeAll(connection, pstmt, rs);
		}
		
		
		return obd;
	}
	
	public int insert(String productsName, int order_count, int total_amount, String image, int user_id, int products_id) {
		int result = 0;
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO orders_bocket VALUES (null, ?, ?, ?, ?, ?, ?)";
		
		try {
			connection = DBService.getInstance().getConnection();
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, productsName);
			pstmt.setInt(2, order_count);
			pstmt.setInt(3, total_amount);
			pstmt.setString(4, image);
			pstmt.setInt(5, user_id);
			pstmt.setInt(6, products_id);
			
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBService.getInstance().closeAll(connection, pstmt);
		}
		
		return result;
	}
	
	public int delete(int order_bocket_id) {
		int result = 0;
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		
		String sql = "DELETE FROM orders_bocket WHERE id = ?";
		
		try {
			connection = DBService.getInstance().getConnection();
			pstmt = connection.prepareStatement(sql);
			
			pstmt.setInt(1, order_bocket_id);
			
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBService.getInstance().closeAll(connection, pstmt);
		}
		
		
		return result;
	}
}
