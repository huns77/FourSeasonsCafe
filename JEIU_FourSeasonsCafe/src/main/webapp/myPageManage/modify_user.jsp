<%@page import="com.user.model.UserDTO"%>
<%@page import="com.user.model.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정 결과</title>
</head>
<body>
    <%
       int id = Integer.parseInt(request.getParameter("id"));
        String userID = (String)request.getParameter("userID");
        String userPW = (String)request.getParameter("userPW");
        String userName = (String)request.getParameter("userName");
        String userBirth = (String)request.getParameter("userBirth");
        String userTel = (String)request.getParameter("userTel");
        String email = (String)request.getParameter("email");

        UserDTO user = new UserDTO();
        user.setId(id);
        user.setUserID(userID);
        user.setUserPW(userPW);
        user.setUserName(userName);
        user.setUserBirth(userBirth);
        user.setUserTel(userTel);
        user.setEmail(email);

        
        int result = UserDAO.getInstance().modify(user);

        String message = "";
        String redirectURL = "./myPage.jsp";

        if (result >=1) {
            message = "회원 정보가 성공적으로 수정되었습니다.";
        } else {
            message = "회원 정보 수정에 실패했습니다.";
          response.getWriter().println(user.getId());

        }
    %>
    <script type="text/javascript">
        alert("<%= message %>");
        window.location.href = "<%= redirectURL %>";
    </script>
</body>
</html>

