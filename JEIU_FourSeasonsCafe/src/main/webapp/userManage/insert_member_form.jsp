<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품 등록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/System_menu.css">
    <link rel="stylesheet" href="../css/public.css">
    <script type="text/javascript">
    	function send_join(form){
    		userID = form.userID.value.trim();
    		userPW = form.userPW.value.trim();
    		userName = form.userName.value.trim();
    		userBirth = form.userBirth.value.trim();
    		userTel = form.userTel.value.trim();
    		email = form.email.value.trim();
    		
    		if(userID == null){
    			alert("ID를 입력해주세요");
    			return;
    		}
    		if(userPW == null){
    			alert("PW를 입력해주세요");
    			return;
    		}
    		if(userName == null){
    			alert("이름을 입력해주세요");
    			return;
    		}
    		if(userBirth == null){
    			alert("생년월일을 입력해주세요");
    			return;
    		}
    		if(userTel == null){
    			alert("전화번호를 입력해주세요");
    			return;
    		}
    		if(email == null){
    			alert("Email을 입력해주세요");
    			return;
    		}
    		
    		
    		form.action = "insert_member.jsp?userID="+userID+"&userPW"+userPW+"&userName"+userName+"&userBirth"+userBirth+"&userTel"+userTel+"&email"+email;
    		form.method = "get";
    		form.submit();
    	}
    </script>
</head>

<body>
	<main>
  
        <section class="container mt-5">          
            <form>
                <div class="form-group my-3">
                    <label for="userID">아이디</label>
                    <input type="text" class="form-control" id="userID" name="userID"/>
                </div>

                <div class="form-group my-3">
                    <label for="userPW">비밀번호</label>
                    <input type="text" class="form-control" id="userPW" name="userPW"/>
                </div>
                <div class="form-group my-3">
                    <label for="userName">이름</label>
                    <input type="text" class="form-control" id="userName" name="userName"/>
                </div>
                <div class="form-group my-3">
                    <label for="userBirth">생년월일</label>
                    <input type="text" class="form-control" id="userBirth" name="userBirth"/>
                </div>
                <div class="form-group my-3">
                    <label for="userTel">전화번호</label>
                    <input type="text" class="form-control" id="userTel" name="userTel"/>
                </div>
                
                <div class="form-group my-3">
                    <label for="email">이메일</label>
                    <input type="text" class="form-control" id="email" name="email"/>
                </div>

                <input type="button" class="btn btn-success text-light" onclick="send_join(this.form)" value="가입"/>
                <input type="button" class="btn btn-success text-light" onclick="location.href='../admin.jsp'" value="취소"/> 
            </form>
        </section>
      </main>
      
      
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"></script>
</body>
</html>
	
</body>
</html>