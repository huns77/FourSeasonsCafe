<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 결과</title>
    <script>
        // 메시지를 표시하고 리다이렉트하는 함수
        function showMessage() {
            var message = "<%= request.getAttribute("message") %>";
            var redirect = "<%= request.getAttribute("redirect") %>";
            alert(message);
            window.location.href = redirect;
        }
        // 페이지 로딩 후 메시지 표시 함수 호출
        window.onload = function() {
            showMessage();
        };
    </script>
</head>
<body>
</body>
</html>