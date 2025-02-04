package com.cafe.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.model.UserDAO;
import com.user.model.UserDTO;

/**
 * Servlet implementation class Joins
 */
@WebServlet("/join.do")
public class Joins extends HttpServlet {

	public void init(ServletConfig config) throws ServletException {
		
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
    	request.setCharacterEncoding("UTF-8");
        String userID = request.getParameter("userID");
        String userPW = request.getParameter("userPW");
        String userName = request.getParameter("userName");
        String userBirth = request.getParameter("userBirth");
        String userTel = request.getParameter("userTel");
        String email = request.getParameter("email");
        
        UserDTO md = new UserDTO();
        md.setUserID(userID);
        md.setUserPW(userPW);
        md.setUserName(userName);
        md.setUserBirth(userBirth);
        md.setUserTel(userTel);
        md.setEmail(email);

        int result = UserDAO.getInstance().join(md);

        if (result == 1) {
            // 회원가입이 성공했을 때
            String successMessage = "회원가입이 성공적으로 완료되었습니다.";
            request.setAttribute("message", successMessage);
            request.setAttribute("redirect", "../JEIU_FourSeasonsCafe/index.jsp");
        } else {
            // 회원가입이 실패했을 때
            String errorMessage = "회원가입에 실패했습니다. 다시 시도해 주세요.";
            request.setAttribute("message", errorMessage);
            request.setAttribute("redirect", "../JEIU_FourSeasonsCafe/Join.jsp");
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("/module/JoinSuccess.jsp");
        dispatcher.forward(request, response);
    }

}
