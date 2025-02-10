<%@page import="com.user.model.UserDTO"%>
<%@page import="com.product.model.ProductDTO"%>
<%@page import="com.product.model.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");

	int products_id = Integer.parseInt(request.getParameter("products_id"));
	
	UserDTO ud = (UserDTO)session.getAttribute("user");
	if(ud == null){
		response.sendRedirect(request.getContextPath() + "/Login.jsp");
		return;
	}
	ProductDTO pd = ProductDAO.getInstance().getProduct(products_id);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="./css/default.css" />
<script type="text/javascript">
	function calPrice(obj, price){
		const product_price = document.querySelector(".product-price");
		
		if(obj.value == "0"){
			obj.value = "1";
			return;
		}

		let order_count = parseInt(obj.value);
			
		product_price.innerText = price * order_count;
	}
	
	function order(option, user_id, products_id) {
        const order_count = parseInt(document.querySelector("#order-count").value);
        const total_amount = parseInt(document.querySelector(".product-price").textContent);

        if (option == "order") {
            if (confirm("주문하시겠습니까?") == false) {
                return;
            }
            location.href = "./purchase.jsp?order_count=" + order_count + "&total_amount=" + total_amount + "&user_id=" + user_id + "&products_id=" + products_id;
        }
        if (option == "orders_bocket") {
            if (confirm("장바구니에 넣을까요?") == false) {
                return;
            }
            location.href = "./orderBocketManage/order_bocket_insert.jsp?user_id=" + user_id + "&products_id=" + products_id + "&order_count=" + order_count + "&total_amount=" + total_amount;
        }
    }
</script>
</head>
<body>
	<jsp:include page="./templates/header.jsp"/>
	
			<main>
			<div class="container">
	        <div class="row justify-content-center">
	            <div class="col-auto">
	                <div class="card" style="width: 60rem;">
	                    <img src="data/<%= pd.getImage() %>" class="card-img-top" alt="<%= pd.getName() %>">
	                    <div class="card-body">
	                        <h5 class="card-title"><%= pd.getName() %></h5>
	                    </div>
	                    <ul class="list-group list-group-flush">
	                        <li class="list-group-item"><%= pd.getDescription() %></li>
	                        <li class="list-group-item order-count"> 수량 : <input type="number" id="order-count" name="orderCount" onchange="calPrice(this, <%= pd.getPrice() %>)" value="1"/></li>
	                        <li class="list-group-item">가격 : <span class="product-price"><%= pd.getPrice() %></span></li>
	                    </ul>
	                    <div class="card-body">
							<button class="btn btn-outline-success" onclick="order('order', '<%= ud.getId() %>', '<%= pd.getProducts_id() %>')">주문</button>
							<button class="btn btn-outline-success" onclick="order('orders_bocket', '<%= ud.getId() %>', '<%= pd.getProducts_id() %>')">장바구니</button>
	                        <button class="btn btn-outline-success" onclick="location.href='./Products.jsp'">취소</button>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
		</section>
	</main>
	
	<jsp:include page="./templates/footer.jsp"/>
</body>
</html>