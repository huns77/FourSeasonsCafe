<%@page import="com.user.model.UserDTO"%>
<%@page import="com.user.model.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정</title>
</head>
<body>
    <h2>회원 정보 수정</h2>
    <%
        // 세션에서 로그인 정보 가져오기
        UserDTO ud = (UserDTO)session.getAttribute("user");

        if (ud == null) {
            out.println("로그인이 필요합니다.");
            return;
        }

        
        
        UserDTO user = UserDAO.getInstance().getUserId(ud.getId());

        if (user == null) {
            out.println("사용자 정보를 찾을 수 없습니다.");
            return;
        }
    %>
    <form action="modify_user.jsp" method="get">
       <input type="text" name="id" hidden value="<%= user.getId() %>"/>
        아이디 : <input type="text" name="userID" value="<%= user.getUserID() %>" readonly="readonly"><br>
        비밀번호: <input type="text" name="userPW" value="<%= user.getUserPW() %>"><br>
        이름: <input type="text" name="userName" value="<%= user.getUserName() %>"><br>
        생년월일: <input type="text" name="userBirth" value="<%= user.getUserBirth() %>"><br>
        전화번호: <input type="text" name="userTel" value="<%= user.getUserTel() %>"><br>
        이메일: <input type="text" name="email" value="<%= user.getEmail() %>"><br>
        <input type="submit" value="수정">
    </form>
</body>
</html>
