package com.product.model;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.service.DBService;



public class ProductDAO {
    public static ProductDAO single = null;
    
    public static ProductDAO getInstance() {
    	if(single == null) {
    		single = new ProductDAO();
    		
    	}
    	
    	return single;
    }

    public ProductDTO getProduct(int productID) {
    	ProductDTO pd = new ProductDTO();

    	Connection connection = null;
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	String sql = "SELECT * FROM products WHERE products_id = ?";

        try {
	    	connection= DBService.getInstance().getConnection();
	    	pstmt = connection.prepareStatement(sql);
	    	pstmt.setInt(1, productID);
        	
        	rs = pstmt.executeQuery();
	        if (rs.next()) {
	        	pd.setProducts_id(rs.getInt("products_id"));
	        	pd.setName(rs.getString("name"));
	        	pd.setPrice(rs.getInt("price"));
	        	pd.setDescription(rs.getString("description"));
	           	pd.setStock(rs.getInt("stock"));
	           	pd.setImage(rs.getString("image"));
            }
        } catch (Exception ex) {
            System.out.println("Exception: " + ex);
        }
        
        return pd;
    }
    public boolean reduceStock(int productID, int quantity) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;

        try {
            con = DBService.getInstance().getConnection();

            // 현재 재고 확인
            String checkStockQuery = "SELECT stock FROM products WHERE products_id = ?";
            pstmt = con.prepareStatement(checkStockQuery);
            pstmt.setInt(1, productID);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                int currentStock = rs.getInt("stock");

                if (currentStock >= quantity) {
                    // 재고가 충분하면 감소
                    String updateStockQuery = "UPDATE products SET stock = stock - ? WHERE products_id = ?";
                    pstmt = con.prepareStatement(updateStockQuery);
                    pstmt.setInt(1, quantity);
                    pstmt.setInt(2, productID);
                    
                    int updatedRows = pstmt.executeUpdate();
                    result = (updatedRows > 0);
                }
            }
        } catch (Exception ex) {
            System.out.println("Exception: " + ex);
        }
        return result;
    }

    public boolean insertProduct(HttpServletRequest req) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;

        try {
            String uploadDir = req.getServletContext().getRealPath("/data");
            
            // 존재하지 않으면 생성
            File dir = new File(uploadDir);
            if (!dir.exists()) {
                dir.mkdirs();
            }
            
            // 파일 업로드 처리
            MultipartRequest multi = new MultipartRequest(req, uploadDir, 5 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());

            con = DBService.getInstance().getConnection();
            String query = "INSERT INTO products (name, price, description, stock, image) VALUES (?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, multi.getParameter("name"));
            pstmt.setInt(2, Integer.parseInt(multi.getParameter("price")));
            pstmt.setString(3, multi.getParameter("description"));
            pstmt.setInt(4, Integer.parseInt(multi.getParameter("stock")));

            if (multi.getFilesystemName("image") == null) {
                pstmt.setString(5, "ready.gif");
            } else {
                pstmt.setString(5, multi.getFilesystemName("image"));
            }

            int count = pstmt.executeUpdate();
            if (count == 1) result = true;

        } catch (Exception ex) {
            System.out.println("Exception: " + ex);
        } 
        return result;
    }

        public int updateProduct(ProductDTO product) {
            int result = 0;
            String sql = "UPDATE products SET name = ?, price = ?, description = ?, stock = ?, image = ? WHERE products_id = ?";

            try (Connection conn = DBService.getInstance().getConnection();
                 PreparedStatement pstmt = conn.prepareStatement(sql)) {

                // 값 세팅
                pstmt.setString(1, product.getName());
                pstmt.setInt(2, product.getPrice());
                pstmt.setString(3, product.getDescription());
                pstmt.setInt(4, product.getStock());
                pstmt.setString(5, product.getImage());
                pstmt.setInt(6, product.getProducts_id());  // 상품 ID

                result = pstmt.executeUpdate();  // 업데이트 실행

            } catch (SQLException e) {
                e.printStackTrace();
            }

            return result;  // 성공하면 1 이상, 실패하면 0 반환
        }
    public List<ProductDTO> getProductList() throws SQLException {
    	List<ProductDTO> productList = new ArrayList<>();

    	Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            con = DBService.getInstance().getConnection();
            String query = "SELECT * FROM products ORDER BY products_id ASC";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                ProductDTO product = new ProductDTO();
                
                product.setProducts_id(rs.getInt("products_id"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getInt("price")); 
                product.setDescription(rs.getString("description"));
                product.setStock(rs.getInt("stock")); 
                product.setImage(rs.getString("image"));
                
                productList.add(product);
            }
        } catch (Exception ex) {
            System.out.println("Exception: " + ex);
        }
        return productList;
    }
    
    public int deleteProduct(int productID) {
    	int result = 0;

    	Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DBService.getInstance().getConnection();

            // Step 1: Delete the product
            String deleteQuery = "DELETE FROM products WHERE products_id = ?";
            pstmt = con.prepareStatement(deleteQuery);
            pstmt.setInt(1, productID);

            result = pstmt.executeUpdate();

        }catch (Exception ex) {
            System.out.println("Exception: " + ex);
        }
        return result;
    }
}
