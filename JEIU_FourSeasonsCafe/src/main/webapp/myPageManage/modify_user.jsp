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
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        String userID = request.getParameter("userID");
        String userName = request.getParameter("userName");
        String userBirth = request.getParameter("userBirth");
        String userTel = request.getParameter("userTel");
        String email = request.getParameter("email");

        // 기존 사용자 정보 가져오기 (비밀번호 유지 목적)
        UserDAO userDAO = UserDAO.getInstance();
        UserDTO existingUser = userDAO.getUserId(id);

        if (existingUser == null) {
            throw new Exception("사용자 정보를 찾을 수 없습니다.");
        }

        String userPW = existingUser.getUserPW(); // 기존 비밀번호 유지

        UserDTO user = new UserDTO();
        user.setId(id);
        user.setUserID(userID);
        user.setUserPW(userPW);  // 비밀번호 유지
        user.setUserName(userName);
        user.setUserBirth(userBirth);
        user.setUserTel(userTel);
        user.setEmail(email);

        int result = userDAO.modify(user);

        String message = (result > 0) ? "회원 정보가 성공적으로 수정되었습니다." : "회원 정보 수정에 실패했습니다.";

%>
    <script type="text/javascript">
        alert("<%= message %>");
        window.location.href = "./myPage.jsp";
    </script>
<%
    } catch (Exception e) {
        e.printStackTrace();
%>
    <script type="text/javascript">
        alert("오류가 발생했습니다. 다시 시도해주세요.");
        window.history.back();
    </script>
<%
    }
%>

</body>
</html>
