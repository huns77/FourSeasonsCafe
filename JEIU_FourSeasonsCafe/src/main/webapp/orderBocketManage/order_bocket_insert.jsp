<%@page import="com.order_bocket.model.OrderBocketDAO"%>
<%@page import="com.product.model.ProductDAO"%>
<%@page import="com.product.model.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	
	String option = request.getParameter("option");
	
	ProductDTO pd = ProductDAO.getInstance().getProduct(Integer.parseInt(request.getParameter("products_id")));
	int user_id = Integer.parseInt(request.getParameter("user_id"));
	int order_count = Integer.parseInt(request.getParameter("order_count"));
	int total_amount = Integer.parseInt(request.getParameter("total_amount"));
	
	int result = OrderBocketDAO.getInstance().insert(pd.getName(), order_count, total_amount, pd.getImage(), user_id, pd.getProducts_id());	
	
	if(result == 1){
		response.sendRedirect("../order_bocket.jsp");
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