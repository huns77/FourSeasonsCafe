<%@page import="com.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	int id = Integer.parseInt(request.getParameter("id"));
	
	int result = UserDAO.getInstance().delete(id);
	
	if(result >= 1){
		response.sendRedirect("../admin.jsp");
	}else{
		return;
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>