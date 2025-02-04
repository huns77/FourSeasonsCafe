<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.product.model.ProductDAO"%>
<%@ page import="com.product.model.ProductDTO"%>

<%
    request.setCharacterEncoding("UTF-8");
	int productID = Integer.parseInt(request.getParameter("products_id"));

    ProductDTO product = ProductDAO.getInstance().getProduct(productID);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품 상세 정보</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
	<main>
	    <section class="container mt-5">
	        <div class="display-6 py-5">상품 상세 정보</div>
	        <%
	            if (product != null) {
	        %>
	                <h3 class="ps-3 py-3"><%= product.getName() %></h3>
		            <div class="ps-5">
		                <p>가격: <%= product.getPrice() %></p>
		                <p>설명: <%= product.getDescription() %></p>
		                <p>재고: <%= product.getStock() %></p>
		                <img src="../data/<%= product.getImage() %>" alt="<%= product.getName() %>" class="img-fluid">
		                
		            </div>
	        <%
	            } else {
	        %>
	            <div>상품 정보를 찾을 수 없습니다.</div>
	        <%
	            }
	        %>

	        <div class="row justify-content-end py-5">
	        	<div class="col-auto">
	        		<input type="button" class="btn btn-success" value="돌아가기" onclick="location.href='../shop_menu.jsp'"/>
	        	</div>
	        </div>
        </section>
        
	</main>    
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>
