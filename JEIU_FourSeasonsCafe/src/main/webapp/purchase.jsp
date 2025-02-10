<%@page import="com.user.model.UserDTO"%>
<%@page import="com.user.model.UserDAO"%>
<%@page import="com.product.model.ProductDAO"%>
<%@page import="com.product.model.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("UTF-8");
    String order_count = request.getParameter("order_count");
    String total_amount = request.getParameter("total_amount");
    String user_id = request.getParameter("user_id");
    String products_id = request.getParameter("products_id");
    response.setHeader("Access-Control-Allow-Origin", "https://online-payment.kakaopay.com");
    UserDTO user = (UserDTO) session.getAttribute("user");

    if (user == null) {
        response.setContentType("text/html; charset=UTF-8");
        response.getWriter().println("<script type='text/javascript'>");
        response.getWriter().println("alert('로그인이 필요한 서비스입니다.');");
        response.getWriter().println("window.location.href = 'index.jsp';");
        response.getWriter().println("</script>");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>주문 결제</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    
</head>
<body>

    <script>
    $(function(){
        var IMP = window.IMP;
        IMP.init('imp00866258');  // 가맹점 코드 (IAMPORT의 발급된 코드)

        IMP.request_pay({
            pg : 'kakaopay',  // PG사 선택 (카카오페이)
            pay_method : 'card',  // 결제 방법
            merchant_uid : 'merchant_' + new Date().getTime(),  // 고유 결제 ID
            name : '<%= request.getParameter("order_count") %> 개 상품',
            amount : <%= total_amount %>,  // 숫자로 전달
            buyer_email : 'user@example.com',
            buyer_name : '<%= user.getUserName() != null ? user.getUserName() : "이름 미제공" %>',  // null 체크
            buyer_tel : '010-1234-5678'
        }, function(rsp) {
            if (rsp.success) {
                $.ajax({
                    url: "<%= request.getContextPath() %>/charge.do",
                    type: 'POST',
                    data: {
                        imp_uid: rsp.imp_uid,
                        order_count: <%= order_count %>,
                        total_amount: <%= total_amount %>,
                        user_id: '<%= user_id %>',
                        products_id: '<%= products_id %>'
                    },
                    success: function() {
                        alert('<%= order_count %>개의 상품 결제가 완료되었습니다.');
                        location.href = "<%= request.getContextPath() %>/myPageManage/myPage_order.jsp";
                    }
                });
            } else {
                alert('결제에 실패하였습니다: ' + rsp.error_msg);
            }
        });
    });
    </script> 

</body>
</html>
