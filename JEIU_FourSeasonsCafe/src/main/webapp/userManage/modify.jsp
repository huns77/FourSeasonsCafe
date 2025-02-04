<%@page import="com.user.model.UserDAO"%>
<%@page import="com.user.model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");

	int id = Integer.parseInt(request.getParameter("id"));
	String userId = request.getParameter("userID");
	String userPw = request.getParameter("userPW");
	String userName = request.getParameter("userName");
	String userBirth = request.getParameter("userBirth");
	String userTel = request.getParameter("userTel");
	String email = request.getParameter("email");
	
	UserDTO ud = new UserDTO();
	
	ud.setId(id);
	ud.setUserID(userId);
	ud.setUserPW(userPw);
	ud.setUserName(userName);
	ud.setUserBirth(userBirth);
	ud.setUserTel(userTel);
	ud.setEmail(email);
	
	
	int result = UserDAO.getInstance().modify(ud);

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