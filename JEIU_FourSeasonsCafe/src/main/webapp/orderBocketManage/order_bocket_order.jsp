<%@page import="com.order.model.OrderDTO"%>
<%@page import="com.order_bocket.model.OrderBocketDAO"%>
<%@page import="com.order_bocket.model.OrderBocketDTO"%>
<%@page import="com.order.model.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
		
	int order_bocket_id = Integer.parseInt(request.getParameter("order_bocket_id"));
	OrderBocketDTO obd = OrderBocketDAO.getInstance().getOrderBocketDTO(order_bocket_id);

	// OrderDTO 객체 생성
	OrderDTO orderDTO = new OrderDTO();
	orderDTO.setOrder_count(obd.getProduct_count()); // 주문 수량
	orderDTO.setTotal_amount(obd.getTotal_amount()); // 총 금액
	orderDTO.setUser_id(obd.getUser_id()); // 사용자 ID
	orderDTO.setProduct_id(obd.getProduct_id()); // 제품 ID

	// 추가적으로 order_date와 order_checked는 필요에 따라 설정
	orderDTO.setOrder_date("현재 날짜"); // 예시로 현재 날짜를 설정
	orderDTO.setOrder_checked("미확인"); // 기본 상태를 설정

	// OrderDAO의 insert 메서드 호출
	int result = OrderDAO.getInstance().insert(orderDTO);
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