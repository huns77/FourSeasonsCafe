package com.order.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
	
	public int insert(OrderDTO order) {
	    int result = 0;
	    Connection connection = null;
	    PreparedStatement pstmt = null;
	    
	    // SQL 쿼리문
	    String sql = "INSERT INTO orders (order_date, order_checked, order_count, total_amount, user_id, product_id) VALUES (now(), '0', ?, ?, ?, ?)";
	    
	    try {
	        connection = DBService.getInstance().getConnection();
	        pstmt = connection.prepareStatement(sql);
	        
	        // OrderDTO 객체에서 값을 가져와서 설정
	        pstmt.setInt(1, order.getOrder_count());
	        pstmt.setInt(2, order.getTotal_amount());
	        pstmt.setInt(3, order.getUser_id());  // user_id는 String 타입
	        pstmt.setInt(4, order.getProduct_id());
	        
	        // 실행
	        result = pstmt.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
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
	public boolean createOrder(int userId, int productId, int orderCount, int totalAmount) {
        String sql = "INSERT INTO orders (order_date, order_checked, order_count, total_amount, user_id, product_id) VALUES (NOW(), 'N', ?, ?, ?, ?)";

        try (Connection conn = DBService.getInstance().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, orderCount);
            pstmt.setInt(2, totalAmount);
            pstmt.setInt(3, userId);
            pstmt.setInt(4, productId);

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
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
