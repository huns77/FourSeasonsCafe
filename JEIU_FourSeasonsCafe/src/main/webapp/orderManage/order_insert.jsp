<%@page import="com.order.model.OrderDTO"%>
<%@page import="com.product.model.ProductDTO"%>
<%@page import="com.product.model.ProductDAO"%>
<%@page import="com.order_bocket.model.OrderBocketDAO"%>
<%@page import="com.order.model.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	
		ProductDTO pd = ProductDAO.getInstance().getProduct(Integer.parseInt(request.getParameter("products_id")));
		
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		int user_id = Integer.parseInt(request.getParameter("user_id"));
		int order_count = Integer.parseInt(request.getParameter("order_count"));
		int total_amount = Integer.parseInt(request.getParameter("total_amount"));
		// OrderDTO 객체 생성 후 값 설정
		OrderDTO order = new OrderDTO();
		order.setOrder_count(order_count);
		order.setTotal_amount(total_amount);
		order.setUser_id(user_id);
		order.setProduct_id(pd.getProducts_id());  // ProductDTO 객체에서 product_id 가져오기

		// insert() 메서드에 OrderDTO 객체 전달
		int result = OrderDAO.getInstance().insert(order);
		if(result >= 1){
	
			response.sendRedirect("../index.jsp");
			
		}
		
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>