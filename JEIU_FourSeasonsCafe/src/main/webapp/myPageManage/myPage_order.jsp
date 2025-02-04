<%@page import="java.util.List"%>
<%@page import="com.user.model.UserDTO"%>
<%@page import="com.order.model.OrderDAO"%>
<%@page import="com.order.model.OrderDTO"%>
<%@page import="com.product.model.ProductDAO"%>
<%@page import="com.product.model.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    UserDTO user_id = (UserDTO) session.getAttribute("user");
    if (user_id == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    // 사용자 아이디를 기반으로 주문 목록 가져오기
    List<OrderDTO> orderList = OrderDAO.getInstance().getUserOrderList(user_id.getId());
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>주문 목록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
    </style>
</head>
<body>
<jsp:include page="../templates/myPage_header.jsp"></jsp:include>
<table class="table table-bordered">
    <thead>
    <tr>
        <th>상품이미지</th>
        <th>상품명</th>
        <th>수량</th>
        <th>총액</th>
        <th>상태</th>
    </tr>
    </thead>
    <tbody>
    <% 
        for (OrderDTO order : orderList) {
            ProductDTO product = ProductDAO.getInstance().getProduct(order.getProduct_id());

            String statusText = "";
            if (order.getOrder_checked().equals("0")) {
                statusText = "주문완료";
            } else if (order.getOrder_checked().equals("1")) {
                statusText = "배송준비중";
            } else if (order.getOrder_checked().equals("2")) {
                statusText = "배송중";
            } else if (order.getOrder_checked().equals("3")) {
                statusText = "배송완료";
            } else {
                statusText = "오류";
            }
    %>
    <tr>
        <td><img src="../data/<%= product.getImage() %>" style="width: 100px"></td>
        <td><%= product.getName() %></td>
        <td><%= order.getOrder_count() %></td>
        <td><%= (int)(order.getOrder_count() * product.getPrice()) %>원</td>
        <td><%= statusText %></td>
    </tr>
    <% } %>
    </tbody>
</table>
</body>
</html>
