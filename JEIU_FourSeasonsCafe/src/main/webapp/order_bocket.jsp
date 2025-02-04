<%@page import="java.io.OutputStreamWriter"%>
<%@page import="com.order_bocket.model.OrderBocketDAO"%>
<%@page import="com.order_bocket.model.OrderBocketDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.product.model.ProductDAO"%>
<%@page import="com.product.model.ProductDTO"%>
<%@page import="com.user.model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	UserDTO ud = (UserDTO)session.getAttribute("user");
	
	List<OrderBocketDTO> list = OrderBocketDAO.getInstance().getOrderBocketList(ud.getId());
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Bocket Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="./css/default.css" />
<script type="text/javascript">
	function del(order_bocket_id){
		let id = parseInt(order_bocket_id);
		
		location.href="./orderBocketManage/order_bocket_delete.jsp?order_bocket_id="+id;
	}
	
	function order(order_bocket_id){
		let id = parseInt(order_bocket_id);
		
		if(confirm("주문하시겠습니까?") == false){
			return;
		}
		
		location.href="./orderBocketManage/order_bocket_order.jsp?&order_bocket_id="+id;
	}
</script>
</head>
<body>
	<jsp:include page="./templates/header.jsp"/>
	
	<main>
		<section class="container">
			<div class="display-6 py-3 mt-5">상품 목록</div>
	        <div class="row">
	            <%
	                if (list.size() == 0) {
	            %>
		            <div class="col-12 gap-3 ps-5" style="height:30rem;">
		                <p class="ps-3">No products available.</p>
		            </div>
	            <%
	                } else {
	                    for (OrderBocketDTO obd : list) {
	            %>
	            			<div class="col-auto">
			    				<div class="card" style="width: 18rem;">
								  	<img src="data/<%= obd.getProductImage() %>" class="card-img-top" alt="<%= obd.getProductName() %>">
								  	<div class="card-body">
									    <h5 class="card-title"><%= obd.getProductName() %></h5>
									    <p class="card-text product-count">개수 : <%= obd.getProduct_count() %></p>
									    <p class="card-text product-price">가격 : <%= obd.getTotal_amount() %></p>
									    
									   	<div class="card-text float-end">
										    <input type="button" class="btn btn-outline-success" onclick="order('<%= obd.getId() %>')" value="주문하기"/>
										    <input type="button" class="btn btn-outline-success" onclick="del('<%= obd.getId() %>')" value="삭제"/>
									   	</div>
								  	</div>
								</div>	            			
	            			</div>

	            <%
	                    }
	                }
	            %>
	        </div>
		</section>
	</main>
	
	<jsp:include page="./templates/footer.jsp"/>
</body>
</html>