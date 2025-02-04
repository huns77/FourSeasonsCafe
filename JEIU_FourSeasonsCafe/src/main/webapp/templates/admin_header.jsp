<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	

	<nav class="navbar navbar-expand-lg sticky-top" id="main-navbar" style="height:5rem;">
        <div class="container-fluid row justify-content-between">
            <a class="navbar-brand col-3" href="./index.jsp"><img src="./images/logo.png" class="w-50" alt="main_logo" id="main-logo"></a>
            <button class="navbar-toggler col-1" type="button" data-bs-toggle="collapse" data-bs-target="#toggle-navigation-2"
                aria-controls="#toggle-navigation-2" aria-expanded="false" aria-label="toggle-navigation-2">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse col-4" id="#toggle-navigation-2">
                <div class="container navbar-nav justify-content-around m-0">
                    <a href="./admin.jsp" class="nav-link main-nav-unit menu_1">회원 관리</a>
                    <a href="./shop_menu.jsp" class="nav-link main-nav-unit menu_2">상품 관리</a>
                    <a href="./order_manage.jsp" class="nav-link main-nav-unit menu_3">주문 관리</a>
                    
                </div>
            </div>
        </div>
    </nav>
</body>
</html>