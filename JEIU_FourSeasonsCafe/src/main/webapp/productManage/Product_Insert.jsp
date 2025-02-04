<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품 등록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/System_menu.css">
    <link rel="stylesheet" href="../css/public.css">
</head>
<body>

	<main>
	    <div class="container mt-5">
	        <h2>상품 등록</h2>
	        <form action="./product_insert_action.jsp" method="post" enctype="multipart/form-data">
	            <div class="mb-3">
	                <label for="name" class="form-label">상품명</label>
	                <input type="text" class="form-control" id="name" name="name" required>
	            </div>
	            <div class="mb-3">
	                <label for="price" class="form-label">가격</label>
	                <input type="text" class="form-control" id="price" name="price" required>
	            </div>
	            <div class="mb-3">
	                <label for="detail" class="form-label">상품 설명</label>
	                <textarea class="form-control" id="description" name="description" rows="3" required></textarea>
	            </div>
	            <div class="mb-3">
	                <label for="stock" class="form-label">재고</label>
	                <input type="text" class="form-control" id="stock" name="stock" required>
	            </div>
	            <div class="mb-3">
	                <label for="image" class="form-label">이미지</label>
	                <input type="file" class="form-control" id="image" name="image">
	            </div>
	            <input type="submit" class="btn btn-primary" value="등록"/>
	            <input type="button" class="btn btn-primary" value="취소" onclick="location.href='../shop_menu.jsp'"/>
	        </form>
	    </div>
		
	</main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"></script>
</body>
</html>
