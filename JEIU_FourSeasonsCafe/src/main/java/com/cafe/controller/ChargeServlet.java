package com.cafe.controller;

import com.order.model.OrderDAO;
import com.order.model.OrderDTO;
import com.user.model.UserDTO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/charge.do")
public class ChargeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 결제 고유 ID와 주문 정보 파라미터 받기
    	response.setHeader("Access-Control-Allow-Origin", "https://online-payment.kakaopay.com");
        String imp_uid = request.getParameter("imp_uid");
        int order_count = Integer.parseInt(request.getParameter("order_count"));
        int total_amount = Integer.parseInt(request.getParameter("total_amount"));
        int user_id = Integer.parseInt(request.getParameter("user_id"));  // user_id는 int 타입으로 처리
        int product_id = Integer.parseInt(request.getParameter("products_id")); // 제품 ID

        // 세션에서 로그인된 사용자 정보 가져오기
        UserDTO user = (UserDTO) request.getSession().getAttribute("user");

        if (user == null) {
            // 로그인되지 않은 경우 로그인 페이지로 리디렉션
            response.sendRedirect(request.getContextPath() + "/Login.jsp");
            return;
        }

        // 결제 검증 (imp_uid로 결제 검증)
        boolean paymentSuccess = verifyPayment(imp_uid);

        if (paymentSuccess) {
            // 결제가 성공하면 주문 내역을 생성하고, 데이터베이스에 추가
            OrderDTO order = new OrderDTO();
            order.setUser_id(user_id); // 주문한 사용자 ID
            order.setProduct_id(product_id); // 제품 ID
            order.setOrder_count(order_count); // 주문 수량
            order.setTotal_amount(total_amount); // 총 금액
            order.setOrder_checked("0"); // 주문 상태: 0 -> "주문완료"

            // 주문 데이터베이스에 추가
            int result = OrderDAO.getInstance().insert(order);

            // 주문 성공 시 마이페이지로 리디렉션
            if (result > 0) {
                response.sendRedirect(request.getContextPath() + "/myPageManage/myPage_order.jsp");
            } else {
                // 주문 실패 시 경고 메시지 출력
                response.getWriter().println("<script>alert('주문 처리에 실패했습니다.'); history.back();</script>");
            }
        } else {
            // 결제 실패 시 경고 메시지 출력
            response.getWriter().println("<script>alert('결제에 실패했습니다. 다시 시도해주세요.'); history.back();</script>");
        }
    }

    // 결제 검증 로직
    private boolean verifyPayment(String impUid) {
        // 실제 결제 검증 로직을 구현 (여기선 간단히 true로 처리)
        return true; // 결제 검증 성공 시 true 반환
    }
}
