<%@page import="com.user.model.UserDAO"%>
<%@page import="com.user.model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <header class="navbar navbar-expand-lg bg-dark">
      <div class="container-fluid">
        <div class="collapse navbar-collapse" id="login-navbar">
          <div class="container navbar-nav justify-content-end">
          	<%
	            String userName = "";
	            if (session.getAttribute("user") != null) {
	                UserDTO user = (UserDTO)session.getAttribute("user");
	                userName = user.getUserName();
	            } else if (session.getAttribute("userName") != null) {
	                userName = (String)session.getAttribute("userName");
	            }
             %>
             <% if (userName.isEmpty()) { %>
                 <a href="./Login.jsp" class="nav-link">로그인</a>
                 <a href="./Join.jsp" class="nav-link">회원가입</a>
             <% } else { %>
                 <span class="nav-link"><%= userName %>님 환영합니다.</span>
                 <a href="logout.jsp" class="nav-link">로그아웃</a>
             <% } %>
          
          </div>
        </div>
      </div>
    </header>


    <nav class="navbar navbar-expand-lg sticky-top" id="main-navbar">
      <div class="container-fluid row justify-content-between">
        <a class="navbar-brand col-7" href="./index.jsp"><img src="./images/logo.png" alt="main_logo" id="main-logo"></a>

        <button class="navbar-toggler col-1" type="button" data-bs-toggle="collapse" data-bs-target="#toggle-navigation"
          aria-controls="toggle-navbar" aria-expanded="false" aria-label="toggle-navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse col-5" id="toggle-navigation">
          <div class="container navbar-nav justify-content-around">
            <a href="#" class="nav-link main-nav-unit">ABOUT</a>
            <a href="#" class="nav-link main-nav-unit">MENU</a>
            <a href="#" class="nav-link main-nav-unit">NEW'S</a>
            <a href="./Products.jsp" class="nav-link main-nav-unit">PRODUCTS</a>
            
            <%
               if((UserDTO)session.getAttribute("user") != null){
                  if(((UserDTO)session.getAttribute("user")).getAccount_check().equals("1")){
            %>
                     <a href="./admin.jsp" class="nav-link main-nav-unit">MYPAGE</a>
         <%
                  }else{
            %>
                  <a href="./myPageManage/myPage.jsp" class="nav-link main-nav-unit">MYPAGE</a>
         <%   
                  }
               }else{
           %>
                 <a class="nav-link main-nav-unit" onclick="alert('로그인 후 사용할 수 있습니다.')">MYPAGE</a>
           <%
                 }
            %>
          </div>
        </div>
      </div>
    </nav>
</body>
</html>