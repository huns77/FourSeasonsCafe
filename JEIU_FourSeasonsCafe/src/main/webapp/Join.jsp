<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>Join Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="./css/default.css"/>
    <link rel="stylesheet" type="text/css" href="./css/join.css"/>
    <script type="text/javascript">
    	function send(form){
    		
    		let userID = form.userID.value.trim();
    		let userPW = form.userPW.value.trim();
    		let userName = form.userName.value.trim();
    		let userBirth = form.userBirth.value.trim();
    		let userTel = form.userTel.value.trim();
    		let email = form.email.value.trim();
    		
    		if(userID == ""){
    			alert("ID를 입력해주세요");
    			return;
    		}
    		
    		if(userPW == ""){
    			alert("비밀번호를 입력해주세요");
    			return;
    		}
    		
    		
    		if(userName == ""){
    			alert("이름을 입력해주세요");
    			return;
    		}
    		
    		if(userBirth == ""){
    			alert("생년월일을 입력해주세요");
    			return;
    		}
    		
    		if(userTel == ""){
    			alert("전화번호를 입력해주세요");
    			return;
    		}
    		
    		if(email == ""){
    			alert("email을 입력해주세요");
    			return;
    		}
    	
    		form.action = "join.do";
    		form.method = "post";
    		form.submit();
    	}
    </script>
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
            <h3 class="pt-5 abhaya-libre-regular" style="border-bottom : 2px dotted black">Join</h3>
          
            <form class="join-form">
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

                <button class="btn btn-success text-light" onclick="send(this.form)">가입완료</button>
            </form>
        </section>
      </main>
      
      <jsp:include page="./templates/footer.jsp"/>

      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"></script>
</body>
</html>