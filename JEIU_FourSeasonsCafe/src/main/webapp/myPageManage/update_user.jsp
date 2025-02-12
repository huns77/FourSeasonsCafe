<%@page import="com.user.model.UserDTO"%>
<%@page import="com.user.model.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script>
        function togglePasswordChangeForm() {
            let form = document.getElementById("passwordChangeForm");
            if (form.style.display === "none" || form.style.display === "") {
                form.style.display = "block";
            } else {
                form.style.display = "none";
            }
        }
    </script>
</head>
<jsp:include page="../templates/myPage_header.jsp"></jsp:include>
<body>
    <%
        UserDTO ud = (UserDTO) session.getAttribute("user");
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
    <div class="container mt-5">
        <h2>회원 정보 수정</h2>
        <form action="modify_user.jsp" method="get">
            <input type="hidden" name="id" value="<%= user.getId() %>"/>
            <div class="mb-3">
                <label class="form-label">아이디:</label>
                <input type="text" class="form-control" name="userID" value="<%= user.getUserID() %>" readonly>
            </div>
            <div class="mb-3">
                <label class="form-label">이름:</label>
                <input type="text" class="form-control" name="userName" value="<%= user.getUserName() %>">
            </div>
            <div class="mb-3">
                <label class="form-label">생년월일:</label>
                <input type="text" class="form-control" name="userBirth" value="<%= user.getUserBirth() %>">
            </div>
            <div class="mb-3">
                <label class="form-label">전화번호:</label>
                <input type="text" class="form-control" name="userTel" value="<%= user.getUserTel() %>">
            </div>
            <div class="mb-3">
                <label class="form-label">이메일:</label>
                <input type="text" class="form-control" name="email" value="<%= user.getEmail() %>">
            </div>
            <button type="submit" class="btn btn-primary" style="background-color:powderblue;">수정</button>
            <button type="button" class="btn btn-warning" onclick="togglePasswordChangeForm()">비밀번호 변경</button>
        </form>

        <!-- 비밀번호 변경 폼 (초기에는 숨김) -->
        <div id="passwordChangeForm" style="display: none;" class="mt-4">
            <h3>비밀번호 변경</h3>
            <form action="modify_user.jsp" method="post">
                <input type="hidden" name="id" value="<%= user.getId() %>">
                <div class="mb-3">
                    <label class="form-label">현재 비밀번호:</label>
                    <input type="password" class="form-control" name="currentPassword" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">새 비밀번호:</label>
                    <input type="password" class="form-control" name="newPassword" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">새 비밀번호 확인:</label>
                    <input type="password" class="form-control" name="confirmNewPassword" required>
                </div>
                <button type="submit" class="btn btn-success">비밀번호 변경</button>
            </form>
        </div>
    </div>
</body>
</html>
