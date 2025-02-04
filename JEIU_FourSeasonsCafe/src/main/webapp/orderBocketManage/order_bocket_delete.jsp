<%@page import="com.order_bocket.model.OrderBocketDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	int order_bocket_id = Integer.parseInt(request.getParameter("order_bocket_id"));
	
	int result = OrderBocketDAO.getInstance().delete(order_bocket_id);
	
	if(result >= 1){
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