<%@page import="com.user.model.UserDTO"%>
<%@page import="com.product.model.ProductDAO"%>
<%@ page import="java.util.List"%>
<%@ page import="com.product.model.ProductDAO"%>
<%@ page import="com.product.model.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	List<ProductDTO> list = ProductDAO.getInstance().getProductList();

	UserDTO user = (UserDTO)session.getAttribute("user");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
     integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="./css/default.css"/>
    <title>Products</title>
    <style>
        .card-img-top {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        .product-price {
            color: #888;
            margin: 8px 0;
        }
    </style>
    <script type="text/javascript">
        function order(user, products_id){
            if(user !== "null"){
                location.href = "order.jsp?products_id=" + products_id;
            } else {
                alert("로그인 후 주문이 가능합니다.");
                return;
            }
        }
    </script>
</head>
<body>
    <jsp:include page="./templates/header.jsp"/>
    
    <main>
        <section class="container">
            <div class="display-6 py-3 mt-5">상품 목록</div>
            <div class="row gap-3 ps-5">
                <% if (list.size() == 0) { %>
                    <div class="col-12" style="height:30rem;">
                        <p class="ps-5">No products available.</p>
                    </div>
                <% } else {
                    for (ProductDTO product : list) { %>
                    <div class="col-auto">
                        <div class="card" style="width: 17rem;">
                            <img src="data/<%= product.getImage() %>" class="card-img-top" alt="<%= product.getName() %>">
                            <div class="card-body">
                                <h5 class="card-title"><%= product.getName() %></h5>
                                <p class="card-text">가격 : <%= product.getPrice() %>원</p>
                                
                                <div class="card-text float-end">
                                    <button class="btn btn-outline-success" onclick="order('<%= user %>', '<%= product.getProducts_id() %>')">주문하기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                <% } } %>
            </div>
        </section>
    </main>
    
    <jsp:include page="./templates/footer.jsp"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
