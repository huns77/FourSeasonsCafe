<%@ page import="java.util.List"%>
<%@ page import="com.product.model.ProductDAO"%>
<%@ page import="com.product.model.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	List<ProductDTO> list = ProductDAO.getInstance().getProductList();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="./css/default.css">
    <title>Document</title>
    <style>
    	td, th{
    		text-align : center;
    		
    		line-height : 54px;
    	}
    </style>
</head>
<body>
  
    <jsp:include page="./templates/admin_header.jsp"/>


	<main>
	    <section class="container">
           	<table class="table table-striped">
                  <thead>
                      <tr>
	      				<th>ID</th>
                           <th>상품명</th>
                           <th>가격</th>
                           <th>상품설명</th>
                           <th>재고</th>
                           <th>비고</th>
      				</tr>
                  </thead>
                  
                  <tbody>
                  <%
                      if (list.size() == 0) {
                  %>
                       <tr>
                           <td colspan="6" class="text-center">등록된 DB목록이 없습니다.</td>
                       </tr>
                  <%
                      } else {
                          for (ProductDTO product : list) {
                  %>
	           				<tr>
	                            <td><%= product.getProducts_id() %></td>
	                            <td><%= product.getName() %></td>
	                            <td><%= product.getPrice() %></td>
	                            <td><%= product.getDescription() %></td>
	                            <td><%= product.getStock() %></td>
	                            <td colspan="2">
	                                <form action="./productManage/Product_description.jsp" method="get" style="display:inline;">
									    <input type="hidden" name="products_id" value="<%= product.getProducts_id() %>">
									    <input type="submit" class="btn btn-outline-success" value="상세보기">
									</form>
									
									<form action="./productManage/Product_del.jsp" method="get" style="display:inline;">
									    <input type="hidden" name="products_id" value="<%= product.getProducts_id() %>">
									    <input type="submit" class="btn btn-outline-success" value="삭제하기">
									</form>

	                            </td>
	                        </tr>
                  <%
                          }
                      }
                  %>
                  </tbody>
              </table>	      
		    <div class="row justify-content-end">
		    	<div class="col-auto">
			    	<input type="button" class="btn btn-success" onclick="location.href='productManage/Product_Insert.jsp'" value="상품등록">
		    	</div>
		    </div>
	    </section>
	</main>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</html>
