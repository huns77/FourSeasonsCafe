package com.order.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.service.DBService;

public class OrderDAO {
	public static OrderDAO single = null;
	
	public static OrderDAO getInstance() {
		if(single == null) {
			single = new OrderDAO();
		}
		
		return single;
	}
	
	public OrderDTO getOrder(int user_id) {
		OrderDTO od = null;
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM orders WHERE user_id = ?";
		
		try {
			connection = DBService.getInstance().getConnection();
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, user_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				od = new OrderDTO();
				
				od.setOrder_id(rs.getInt("order_id"));
				od.setOrder_date(rs.getString("order_date"));
				od.setOrder_checked(rs.getString("order_checked"));
				od.setOrder_count(rs.getInt("order_count"));
				od.setTotal_amount(rs.getInt("total_amount"));
				od.setUser_id(rs.getInt("user_id"));
				od.setProduct_id(rs.getInt("product_id"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBService.getInstance().closeAll(connection, pstmt, rs);
		}
		
		return od;
	}
	
	
	public List<OrderDTO> getOrderList(){
		List<OrderDTO> list = new ArrayList<>();
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM orders ORDER BY order_date DESC";
		
		try {
			connection = DBService.getInstance().getConnection();
			pstmt = connection.prepareStatement(sql);
			rs = pstmt.executeQuery();
		
			while(rs.next()) {
				OrderDTO od = new OrderDTO();
				
				od.setOrder_id(rs.getInt("order_id"));
				od.setOrder_date(rs.getString("order_date"));
				od.setOrder_checked(rs.getString("order_checked"));
				od.setOrder_count(rs.getInt("order_count"));
				od.setTotal_amount(rs.getInt("total_amount"));
				od.setUser_id(rs.getInt("user_id"));
				od.setProduct_id(rs.getInt("product_id"));
				
				list.add(od);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBService.getInstance().closeAll(connection, pstmt, rs);
		}
		
		return list;
	}
	
	public int insert(int order_count, int total_amount, int user_id, int product_id) {
		int result = 0;
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO orders VALUES (null, now(), '0', ?, ?, ?, ?)";
		
		try {
			connection = DBService.getInstance().getConnection();
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, order_count);
			pstmt.setInt(2, total_amount);
			pstmt.setInt(3, user_id);
			pstmt.setInt(4, product_id);
			
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBService.getInstance().closeAll(connection, pstmt);
		}
		
		return result;
	}
	
	
	public List<OrderDTO> getUserOrderList(int user_id) {
        List<OrderDTO> orderList = new ArrayList<>();
        Connection connection = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "SELECT * FROM orders WHERE user_id = ?";

        try {
            connection = DBService.getInstance().getConnection();
            pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, user_id);
            
            rs = pstmt.executeQuery();

            while (rs.next()) {
                OrderDTO od = new OrderDTO();
                od.setOrder_id(rs.getInt("order_id"));
                od.setOrder_date(rs.getString("order_date"));
                od.setOrder_checked(rs.getString("order_checked"));
                od.setOrder_count(rs.getInt("order_count"));
                od.setUser_id(rs.getInt("user_id"));
                od.setProduct_id(rs.getInt("product_id"));
                orderList.add(od);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBService.getInstance().closeAll(connection, pstmt, rs);
        }

        return orderList;
    }
	
	
	public int delete(int order_id) {
		int result = 0;
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		
		String sql = "DELETE FROM orders where order_id = ?";
		
		try {
			connection = DBService.getInstance().getConnection();
			pstmt = connection.prepareStatement(sql);
			
			pstmt.setInt(1, order_id);
			
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBService.getInstance().closeAll(connection, pstmt);
		}
		
		return result;
	}
	
	public int renew_orderChecked(int order_id, String orderChecked) {
		int result = 0;
		
		Connection connection = null;
		PreparedStatement pstmt = null;

		String sql = "UPDATE orders SET order_checked = ? where order_id = ?";
		
		try {
			connection = DBService.getInstance().getConnection();
			pstmt = connection.prepareStatement(sql);
			
			pstmt.setString(1, orderChecked);
			pstmt.setInt(2, order_id);
		
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBService.getInstance().closeAll(connection, pstmt);
		}
		
		return result;
	}
}
