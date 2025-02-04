<%@page import="com.user.model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int id = Integer.parseInt(request.getParameter("id"));
	String userId = request.getParameter("userId");
	String userPw = request.getParameter("userPw");
	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	String userBirth = request.getParameter("userBirth");
	String email = request.getParameter("email");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<script type="text/javascript">
	function update(form){

		form.action="modify.jsp";
		form.method = "get";
		form.submit();
	}
</script>
</head>
<body>
	
	<main>
		<section class="container mt-5">
			<form>
				<input type="hidden" name="id" value="<%= id %>">
				<div class="form-group my-3">
                    <label for="userID">아이디</label>
                    <input type="text" class="form-control" id="userID" name="userID" value="<%= userId %>"/>
                </div>

                <div class="form-group my-3">
                    <label for="userPW">비밀번호</label>
                    <input type="text" class="form-control" id="userPW" name="userPW" value="<%= userPw %>"/>
                </div>
                <div class="form-group my-3">
                    <label for="userName">이름</label>
                    <input type="text" class="form-control" id="userName" name="userName" value="<%= userName %>"/>
                </div>
                <div class="form-group my-3">
                    <label for="userBirth">생년월일</label>
                    <input type="text" class="form-control" id="userBirth" name="userBirth" value="<%= userBirth %>"/>
                </div>
                <div class="form-group my-3">
                    <label for="userTel">전화번호</label>
                    <input type="text" class="form-control" id="userTel" name="userTel" value="<%= userTel %>"/>
                </div>
                
                <div class="form-group my-3">
                    <label for="email">이메일</label>
                    <input type="text" class="form-control" id="email" name="email" value="<%= email %>"/>
                </div>

                <input type="button" class="btn btn-success text-light" onclick="update(this.form)" value="완료"/>
                <input type="button" class="btn btn-success test-light" onclick="location.href='../admin.jsp'" value="취소"/>
			</form>
		</section>
	</main>
</body>
</html>