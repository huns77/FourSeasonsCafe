<%@page import="com.order_bocket.model.OrderBocketDAO"%>
<%@page import="com.order_bocket.model.OrderBocketDTO"%>
<%@page import="com.order.model.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
		
	int order_bocket_id = Integer.parseInt(request.getParameter("order_bocket_id"));
	
	OrderBocketDTO obd = OrderBocketDAO.getInstance().getOrderBocketDTO(order_bocket_id);
	
	int result = OrderDAO.getInstance().insert(obd.getProduct_count(), obd.getTotal_amount(), obd.getUser_id(), obd.getProduct_id());
	
	if(result >= 1){
		int ok = OrderBocketDAO.getInstance().delete(obd.getId());
	
		if(ok >= 1){
			response.sendRedirect("../order_bocket.jsp");
		}
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