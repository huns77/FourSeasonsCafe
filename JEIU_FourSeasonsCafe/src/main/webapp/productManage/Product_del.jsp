<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.product.model.ProductDAO"%>

<%
    int products_id = Integer.parseInt(request.getParameter("products_id"));
        
    int result = ProductDAO.getInstance().deleteProduct(products_id);

    if (result >= 0) {
        out.println("<script>alert('삭제되었습니다.'); location.href='../shop_menu.jsp';</script>");
    } else {
        out.println("<script>alert('삭제 실패'); location.href='../shop_menu.jsp';</script>");
    }
%>
