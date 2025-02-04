<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>


<%
    // 네이버 로그인 API 설정
    String clientId = "2mf3OCn4Fci2L2sZqAE_"; // 애플리케이션 클라이언트 아이디값
    String redirectURI = URLEncoder.encode("http://localhost:8086/JEIU_FourSeasonsCafe/NaverCallback.jsp", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code"
         + "&client_id=" + clientId
         + "&redirect_uri=" + redirectURI
         + "&state=" + state;
    session.setAttribute("state", state);
%>

    
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>Login Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="./css/default.css"/>
    <link rel="stylesheet" type="text/css" href="./css/login.css"/>
</head>

<body>
    <jsp:include page="./templates/header.jsp"/>

      
    <main class="container-fluid">
      <section class="text-center" style="width : 100%">
        <div class="w-100" style="background : url('./images/members.png'); background-size : cover; height : 367px;">
          <div class="row justify-content-center" style="padding-top : 9%">
            <img src="./images/mark.png" class="col-7" alt="" style="width : 10%;"/>

            <h3 class="playfair-display col-12">MEMBERS</h3>
          </div>
        </div>
      </section>

      <section class="container">
        <h3 class="pt-5 abhaya-libre-regular" style="border-bottom : 2px dotted black">Login</h3>
        
        <div class="login_box">
	        <div class="login_bar">
		          <form action="../JEIU_FourSeasonsCafe/login.do" method="post">
		            <div class="w-100">
		                <div class="ID_class">아이디 <input type="text" id="id" name="userID"></div>
		                <div class="PW_class">비밀번호 <input type="password" id="pw" name="userPW"></div>
		            </div>
		      
		            <button class="login_btn">로그인</button>
		          </form>
		          
		          <hr>
		   	      
		   	      <div class="text-center py-2">
		              <a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG" alt="네이버 로그인"/></a>
		          </div>
	        </div>
          
        </div>
      </section>
    </main>
    
    <jsp:include page="./templates/footer.jsp"/>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"></script>
</body>
</html>