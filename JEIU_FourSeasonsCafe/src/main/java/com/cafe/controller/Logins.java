package com.cafe.controller;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.user.model.UserDAO;
import com.user.model.UserDTO;

/**
 * Servlet implementation class Logins
 */
@WebServlet("/login.do")
public class Logins extends HttpServlet {


	public void init(ServletConfig config) throws ServletException {

	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userID = request.getParameter("userID");
        String userPW = request.getParameter("userPW");

        UserDTO user = UserDAO.getInstance().loginCheck(userID, userPW);

        if (user != null) {
            // 로그인 성공 시 세션에 사용자 정보 저장
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
//            session.setAttribute("loginCheck", userID);
//            session.setAttribute("userName", user.getUserName());
            
            // 로그 확인
            System.out.println("로그인 성공: " + user.getUserID() + ", " + user.getUserName() + ", " + user.getAccount_check());

            // 로그인 성공 메시지를 alert로 표시하고 메인 페이지로 이동
            response.setContentType("text/html; charset=UTF-8");
            response.getWriter().println("<script>alert('로그인 성공'); location.href='../JEIU_FourSeasonsCafe/index.jsp';</script>");
        } else {
            // 로그인 실패 메시지를 alert로 표시하고 로그인 페이지로 이동
            response.setContentType("text/html; charset=UTF-8");
            response.getWriter().println("<script>alert('로그인에 실패했습니다. 아이디 또는 비밀번호를 확인 해주세요.'); location.href='../JEIU_FourSeasonsCafe/Login.jsp';</script>");
            
            // 로그 확인
            System.out.println("로그인 실패: " + userID);
        }
    }
}
