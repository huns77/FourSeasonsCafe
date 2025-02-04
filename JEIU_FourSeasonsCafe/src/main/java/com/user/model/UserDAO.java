package com.user.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.x.protobuf.MysqlxPrepare.Prepare;
import com.service.DBService;


public class UserDAO {
    public static UserDAO single = null;
    
    public static UserDAO getInstance() {
    	if(single == null) {
    		single = new UserDAO();
    	}
    	
    	return single;
    }
    
    public int join(UserDTO ud) {
    	int result = 0;
    	
    	Connection connection = null;
    	PreparedStatement pstmt = null;
    	
    	String sql = "INSERT INTO user VALUES(null, ?, ?, ?, ?, ?, ?, '0', null)";
    	try {
    		connection = DBService.getInstance().getConnection();
    		pstmt = connection.prepareStatement(sql);
    		pstmt.setString(1, ud.getUserID());
    		pstmt.setString(2, ud.getUserPW());
    		pstmt.setString(3, ud.getUserName());
    		pstmt.setString(4, ud.getUserBirth());
    		pstmt.setString(5, ud.getUserTel());
    		pstmt.setString(6, ud.getEmail());
    		
    		result = pstmt.executeUpdate();
    	}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBService.getInstance().closeAll(connection, pstmt);
		}
    	
    	return result;
    }
    
    
    public int naver_join(UserDTO ud) {
    	int result = 0;
    	
    	Connection connection = null;
    	PreparedStatement pstmt = null;
    	
    	String sql = "INSERT INTO user VALUES(?, ?, ?, ?, ?, ?, ?, '0', null)";
    	try {
    		connection = DBService.getInstance().getConnection();
    		pstmt = connection.prepareStatement(sql);
    		pstmt.setInt(1, ud.getId());
    		pstmt.setString(2, ud.getUserID());
    		pstmt.setString(3, ud.getUserPW());
    		pstmt.setString(4, ud.getUserName());
    		pstmt.setString(5, ud.getUserBirth());
    		pstmt.setString(6, ud.getUserTel());
    		pstmt.setString(7, ud.getEmail());
    		
    		result = pstmt.executeUpdate();
    	}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBService.getInstance().closeAll(connection, pstmt);
		}
    	
    	return result;
    }
    
    
    public UserDTO getUserId(int id) {
        UserDTO user = null;

        Connection connection = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT * FROM user WHERE id = ?";
            connection = DBService.getInstance().getConnection();
            pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                user = new UserDTO();
                user.setId(rs.getInt("id"));
                user.setUserID(rs.getString("userID"));
                user.setUserPW(rs.getString("userPW"));
                user.setUserName(rs.getString("userName"));
                user.setUserBirth(rs.getString("userBirth"));
                user.setUserTel(rs.getString("userTel"));
                user.setAccount_check(rs.getString("account_check"));
                user.setEmail(rs.getString("email"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBService.getInstance().closeAll(connection, pstmt, rs);
        }
        return user;
    }
    
    
    public List<UserDTO> select_users(){
    	List<UserDTO> list = new ArrayList<>();
    	
    	Connection connection = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	String sql = "SELECT * FROM user";
    	
    	try {
    		
    		connection = DBService.getInstance().getConnection();
    		pstmt = connection.prepareStatement(sql);
    		rs = pstmt.executeQuery();
    		
    		while(rs.next()) {
    			UserDTO ud = new UserDTO();
    			
    			ud.setId(rs.getInt("id"));
    			ud.setUserID(rs.getString("userId"));
    			ud.setUserPW(rs.getString("userPW"));
    			ud.setUserName(rs.getString("userName"));
    			ud.setUserBirth(rs.getString("userBirth"));
    			ud.setUserTel(rs.getString("userTel"));
    			ud.setEmail(rs.getString("email"));
    		
    			list.add(ud);
    		}
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
    		DBService.getInstance().closeAll(connection, pstmt);
    	}
    	
    	return list;
    }
    
    public UserDTO loginCheck(String userID, String userPW) {
        Connection connection = null;
    	PreparedStatement pstmt = null;
        ResultSet rs = null;
        UserDTO user = null;
        
        try {
            String strQuery = "SELECT * FROM user WHERE userID = ? AND userPW = ?";
            connection = DBService.getInstance().getConnection();
            pstmt = connection.prepareStatement(strQuery);
            pstmt.setString(1, userID);
            pstmt.setString(2, userPW);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                user = new UserDTO();
                user.setId(rs.getInt("id"));
                user.setUserID(rs.getString("userID"));
                user.setUserPW(rs.getString("userPW"));
                user.setUserName(rs.getString("userName"));
                user.setUserBirth(rs.getString("userBirth"));
                user.setUserTel(rs.getString("userTel"));
                user.setEmail(rs.getString("email"));
                user.setAccount_check(rs.getString("account_check"));
                user.setPoint(rs.getInt("point"));
                
                System.out.println("유저 아이디: " + userID);
            } else {
                // 로그 확인
                System.out.println("User not found: " + userID);
            }
            
        } catch (Exception ex) {
            System.out.println("Exception: " + ex);
        } finally {
        	DBService.getInstance().closeAll(connection, pstmt);
        }
        
        return user;
    }

    public int modify(UserDTO ud) {
    	int result = 0;

    	Connection connection = null;
    	PreparedStatement pstmt = null;
        
        try {
            String sql = "UPDATE user SET userID = ?, userPW = ?, userName = ?, userBirth = ?,userTel = ?, email = ? WHERE id=?";
            connection = DBService.getInstance().getConnection();
            pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, ud.getUserID());
            pstmt.setString(2, ud.getUserPW());
            pstmt.setString(3, ud.getUserName());
            pstmt.setString(4, ud.getUserBirth());
            pstmt.setString(5, ud.getUserTel());
            pstmt.setString(6, ud.getEmail());
            pstmt.setInt(7, ud.getId());


            result = pstmt.executeUpdate();
        } catch (Exception e) {
        	e.printStackTrace();
        } finally {
        	DBService.getInstance().closeAll(connection, pstmt);
        }
        return result;
    }
    
    public int delete(int id) {
    	int result = 0;
    	
    	Connection connection = null;
    	PreparedStatement pstmt = null;
    	
    	String sql = "DELETE FROM user WHERE id = ?";
    	
    	try {
    		connection = DBService.getInstance().getConnection();
    		pstmt = connection.prepareStatement(sql);
    		pstmt.setInt(1, id);
    		
    		result = pstmt.executeUpdate();
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
    		DBService.getInstance().closeAll(connection, pstmt);
    	}
    
    	return result;
    }
}
