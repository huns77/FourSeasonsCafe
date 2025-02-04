<%@page import="com.user.model.UserDAO"%>
<%@page import="com.user.model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	String userID = (String)request.getParameter("userID");
	String userPW = (String)request.getParameter("userPW");
	String userName = (String)request.getParameter("userName");
	String userBirth = (String)request.getParameter("userBirth");
	String userTel = (String)request.getParameter("userTel");
	String email = (String)request.getParameter("email");
	
	UserDTO ud = new UserDTO();
	
	ud.setUserID(userID);
	ud.setUserPW(userPW);
	ud.setUserName(userName);
	ud.setUserBirth(userBirth);
	ud.setUserTel(userTel);
	ud.setEmail(email);
	
	int result = UserDAO.getInstance().join(ud);
	
	if(result >= 1){
		response.sendRedirect("../admin.jsp");
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