<%@page import="com.user.model.UserDAO"%>
<%@page import="com.user.model.UserDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<% List<UserDTO> list = UserDAO.getInstance().select_users(); %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="./css/default.css">
    <title>Document</title>
    <script type="text/javascript">
    	function modify(id, userId, userPw, userName, userBirth, userTel, email){
    			location.href="./userManage/update.jsp?id="+id + "&userId="+userId+ "&userPw="+userPw+ "&userName="+userName+ "&userBirth="+userBirth + "&userTel="+userTel+ "&email="+email;
 
    	}
    	
    	function del(id){
    		if(confirm("삭제하시겠습니까?") == false){
    			return;
    		}
    		
    		location.href="./userManage/delete.jsp?id="+id;
    	}
    </script>
    <style>
    	td, th{
    		text-align : center;
    		
    		line-height : 54px;
    	}
    </style>
</head>
<body>
  
      <jsp:include page="./templates/admin_header.jsp"/>
      
      <main>
	      <section class="container">
      		<table class="table table-striped">
                   <thead>
                       <tr>
		      				<th>아이디</th>
		      				<th>이름</th>
		      				<th>생년월일</th>
		      				<th>연락처</th>
		      				<th>이메일</th>
		      				<th>비고</th>
	      				</tr>
                   </thead>
                   <tbody>
                   <%
                       if (list.size() == 0) {
                   %>
                       <tr>
                           <td colspan="6" class="text-center">등록된 DB목록이 없습니다.</td>
                       </tr>
                   <%
                       } else {
                           for (UserDTO ud : list) {
                   %>
                   				<tr>
									<td><%= ud.getUserID() %></td>
									<td><%= ud.getUserName() %></td>
									<td><%= ud.getUserBirth() %></td>
									<td><%= ud.getUserTel() %></td>
									<td><%= ud.getEmail() %></td>
									<td colspan="2">
										<input type="button" class="btn btn-outline-success" onclick="modify('<%= ud.getId() %>',
																					'<%= ud.getUserID() %>',
																					'<%= ud.getUserPW() %>',
																					'<%= ud.getUserName() %>',
																					'<%= ud.getUserBirth() %>',
																					'<%= ud.getUserTel() %>',
																					'<%= ud.getEmail() %>'
																					)" value="수정하기">
										<input type="button" class="btn btn-outline-success" onclick="del('<%= ud.getId() %>')" value="삭제하기">																					
									</td>
								</tr>
                   <%
                           }
                       }
                   %>
                   </tbody>
               </table>	        

			    <section class="row justify-content-end">
			    	<div class="col-auto">
				      	<input type="button" class="btn btn-success" onclick="location.href='./userManage/insert_member_form.jsp'" value="추가하기">
			    	</div>
			    </section>
	    </section>
	    
      </main>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"></script>
</html>