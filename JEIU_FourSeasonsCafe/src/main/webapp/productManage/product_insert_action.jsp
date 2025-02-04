<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.product.model.ProductDAO"%>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="java.io.IOException" %>
<%
    boolean isSuccess = ProductDAO.getInstance().insertProduct(request);

    if (isSuccess) {
%>
        <script>
            alert("상품이 성공적으로 등록되었습니다.");
            window.location.href = "../shop_menu.jsp";
        </script>
<%
    } else {
%>
        <script>
            alert("상품 등록에 실패했습니다. 다시 시도해주세요.");
            window.history.back();
        </script>
<%
    }
%>
