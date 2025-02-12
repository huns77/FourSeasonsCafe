<%@ page import="com.user.model.UserDTO" %>
<%@ page import="com.user.model.UserDAO" %>
<%@ page import="com.order.model.OrderDAO" %>
<%@ page import="com.order.model.OrderDTO" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%



    UserDTO user = (UserDTO) session.getAttribute("user");
    String naver = (String) session.getAttribute("naver");

	if(user == null){
		response.sendRedirect(request.getContextPath() + "/Login.jsp");
	    out.println("<script>alert('로그인이 필요합니다.'); location.href='../Login.jsp';</script>");
		return;
	}
	
    String userNames = "";
    int userPoint = 0;
    int coupons = 0;
    
    if (user != null) {
        userNames = user.getUserName();
        userPoint = user.getPoint();
    } else if (naver != null) {
       userNames = (String) session.getAttribute("userName");
        userPoint = 0; //네이버로그인 포인트 초기값
    }
    
   	List<OrderDTO> lists =OrderDAO.getInstance().getUserOrderList(user.getId());
    int orderCompleted = 0;
    int preparingForShipping = 0;
    int shipping = 0;
    int delivered = 0;
    for (OrderDTO od : lists) {
        String status = od.getOrder_checked();
        if (status.equals("0")) {
            orderCompleted++;
        } else if (status.equals("1")) {
            preparingForShipping++;
        } else if (status.equals("2")) {
            shipping++;
        } else if (status.equals("3")) {
            delivered++;
        }
    }

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="../css/default.css"/>
<link rel="stylesheet" type="text/css" href="../css/mypage.css" />
<style>

    .profile {
        display: flex;
        justify-content: space-between;
        margin-bottom: 20px;
    }
    .profile-right{
       padding-right: 30px
    }
    .profile-box {
        display: inline-block;
        width: 170px;
        height: 170px;
        border: 1px solid #ddd;
        border-radius: 10px;
        margin: 10px;
        padding: 20px;
        margin-top:30px;
        box-shadow: 0 4px 4px;
        text-align: center;
    }
    .profile-box h3 {
        margin-top: 0;
        margin-bottom: 30px;
        font-size: 1.2em;
    }
    .order-status {
        margin-top: 30px;
    }
    h2{
       padding-left: 30px;
       padding-top:30px;

    }
        .order-status {
        margin-top: 30px;
    }
    .order-status-box {
        display: inline-block;
        width: 150px;
        height: 150px;
        border: 1px solid #ddd;
        border-radius: 50%;
        margin: 10px;
        padding: 20px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        text-align: center;
    }
    .order-status-box h3 {
        margin-top: 0;
        margin-bottom: 10px;
        font-size: 1.1em;
    }
    .order-status-container {
        display: flex;
        justify-content: space-around;
        flex-wrap: wrap;
    }

</style>
</head>
<body>
   <jsp:include page="../templates/myPage_header.jsp"/>
   
   <div class="content_menu">
      <div class="profile">
          <div class="profile-left">
              <h2><%= userNames %>님, 반가워요</h2>
              <p style="margin-left: 35px; font-size: 10px;">고객님이 총 구매한 금액은 ?원입니다.</p>
          </div>
          <div class="profile-right">
              <div class="profile-box">
                  <h3>쿠폰</h3>
                  <p><%= coupons %></p>
              </div>
              <div class="profile-box">
                  <h3>포인트</h3>
                  <p><%= userPoint %></p>
              </div>
          </div>
      </div>
      
      <br><hr style="width: 75%; margin: 0 auto;"><br>
      <div class="order-status">
          <h2>일반 주문 현황</h2>
          <div class="order-status-container">
              <div class="order-status-box">
                  <h3>주문완료</h3>
                  <p><%= orderCompleted %> 개</p>
              </div>
              <div class="order-status-box">
                  <h3>배송준비중</h3>
                  <p><%= preparingForShipping %> 개</p>
              </div>
              <div class="order-status-box">
                  <h3>배송중</h3>
                  <p><%= shipping %> 개</p>
              </div>
              <div class="order-status-box">
                  <h3>배송완료</h3>
                  <p><%= delivered %> 개</p>
              </div>
          </div>
</body>
</html>
