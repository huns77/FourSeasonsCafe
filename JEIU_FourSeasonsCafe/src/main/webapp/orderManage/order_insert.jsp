<%@page import="com.product.model.ProductDTO"%>
<%@page import="com.product.model.ProductDAO"%>
<%@page import="com.order_bocket.model.OrderBocketDAO"%>
<%@page import="com.order.model.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	
	ProductDTO pd = ProductDAO.getInstance().getProduct(Integer.parseInt(request.getParameter("products_id")));
	
	int user_id = Integer.parseInt(request.getParameter("user_id"));
	int order_count = Integer.parseInt(request.getParameter("order_count"));
	int total_amount = Integer.parseInt(request.getParameter("total_amount"));
	
	int result = OrderDAO.getInstance().insert(order_count, total_amount, user_id, pd.getProducts_id());	
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