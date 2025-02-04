<%@page import="com.user.model.UserDAO"%>
<%@page import="com.user.model.UserDTO"%>
<%@page import="com.product.model.ProductDAO"%>
<%@page import="com.product.model.ProductDTO"%>
<%@page import="com.order.model.OrderDAO"%>
<%@page import="com.order.model.OrderDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<OrderDTO> list = OrderDAO.getInstance().getOrderList();
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="./css/default.css">
<style>
    	td, th{
    		text-align : center;
    	}
</style>
<script type="text/javascript">
	window.addEventListener("load", () => {
		const selects = document.querySelectorAll("select");
	
		let i = 0;
	
		selects.forEach(select => {
		
			select.defaultSelected = true;
			select.selectedIndex = parseInt(select.options[4].innerText);
			
			
		})
	});
	


	function change_selected(order_id, order_checked){
		let orderId = parseInt(order_id);
		let orderChecked = order_checked;
		
		location.href="./orderManage/order_status_Process.jsp?order_id="+order_id + "&orderChecked="+orderChecked;
	}
	
	
	function del(order_id){
	
		let id = parseInt(order_id);
		
		location.href="./orderManage/order_delete.jsp?order_id="+id;
	}
	
</script>
</head>
<body>
	<jsp:include page="./templates/admin_header.jsp"/>

	<main>
		<section class="container">
			<table class="table table-striped">
	           <thead>
	           <tr>
					<th>idx</th>
					<th>회원명</th>
					<th>상품명</th>
					<th>주문일</th>
					<th>수량</th>
					<th>가격</th>
					<th>주문상태</th>
					<th>비고</th>
				</tr>
	           </thead>
	           
	           <tbody>
		           <%
		               if (list.size() == 0) {
		           %>
		               <tr>
		                   <td colspan="7" class="text-center">등록된 DB목록이 없습니다.</td>
		               </tr>
		           <%
		               } else {
		                   for (OrderDTO od : list) {
		                	   ProductDTO pd = ProductDAO.getInstance().getProduct(od.getProduct_id());
		                	   UserDTO ud = UserDAO.getInstance().getUserId(od.getUser_id());
		           %>
		          				<tr>
									<td><%= od.getOrder_id() %></td>
									<td><%= ud.getUserID() %></td>
									<td><%= pd.getName() %></td>
									<td><%= od.getOrder_date() %></td>
									<td><%= od.getOrder_count() %></td>
									<td><%= od.getTotal_amount() %></td>
									<td class="text-center">
										<select name="order_status" class="form-select" onchange="change_selected('<%= od.getOrder_id() %>', this.selectedIndex)">
											<option value="0">주문완료</option>
											<option value="1">배송준비중</option>
											<option value="2">배송중</option>
											<option value="3">배송완료</option>
											<option hidden value="4"><%= od.getOrder_checked() %></option>
										</select>
									</td>
									<td colspan="2" align=center>
										<button class="btn btn-outline-success" onclick="del('<%= od.getOrder_id() %>')">삭제하기</button>																					
									</td>
								</tr>
		           <%
		                   }
		               }
		           %>
	          	</tbody>
	       </table>	        
		</section>
	</main>
</body>
</html>