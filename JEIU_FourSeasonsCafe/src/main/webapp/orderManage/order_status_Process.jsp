<%@page import="com.order.model.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");

	int order_id = Integer.parseInt(request.getParameter("order_id"));
	String selectedIndex = (String)request.getParameter("orderChecked");
		
	int result = OrderDAO.getInstance().renew_orderChecked(order_id, selectedIndex);
	
	
	if(result >= 1){
		response.sendRedirect("../order_manage.jsp");
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