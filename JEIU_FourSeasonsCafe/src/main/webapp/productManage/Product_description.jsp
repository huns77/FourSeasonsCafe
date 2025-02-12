<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.product.model.ProductDAO"%>
<%@ page import="com.product.model.ProductDTO"%>

<%
    request.setCharacterEncoding("UTF-8");
    int productID = Integer.parseInt(request.getParameter("products_id"));

    // 상품 정보를 가져옴
    ProductDTO product = ProductDAO.getInstance().getProduct(productID);
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>상품 상세 정보</title>  
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../css/default.css">
</head>

<body>
    <main>
    
        <section class="container mt-5">
            <div class="display-6 py-5">상품 상세 정보</div>
            <%
                if (product != null) {
            %>
                <form action="updateProduct.jsp" method="post" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label for="productName" class="form-label">상품명</label>
                        <input type="text" class="form-control" id="productName" name="name" value="<%= product.getName() %>" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="productPrice" class="form-label">가격</label>
                        <input type="number" class="form-control" id="productPrice" name="price" value="<%= product.getPrice() %>" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="productDescription" class="form-label">설명</label>
                        <textarea class="form-control" id="productDescription" name="description" rows="3" required><%= product.getDescription() %></textarea>
                    </div>
                    
                    <div class="mb-3">
                        <label for="productStock" class="form-label">재고</label>
                        <input type="number" class="form-control" id="productStock" name="stock" value="<%= product.getStock() %>" required>
                    </div>

                    <div class="mb-3">
                        <label for="productImage" class="form-label">상품 이미지</label><br>
                        <img src="../data/<%= product.getImage() %>" alt="<%= product.getName() %>" class="img-fluid"><br>
                        <input type="file" class="form-control" id="productImage" name="product_image" value="이미지바꾸기">
                    </div>

                    <div class="row justify-content-end py-3">
                        <div class="col-auto">
                            <button type="submit" class="btn btn-primary">수정하기</button>
                            <input type="button" class="btn btn-secondary" value="돌아가기" onclick="location.href='../shop_menu.jsp'"/>
                        </div>
                    </div>
                </form>
            <%
                } else {
            %>
                <div>상품 정보를 찾을 수 없습니다.</div>
            <%
                }
            %>
        </section>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>
</html>
