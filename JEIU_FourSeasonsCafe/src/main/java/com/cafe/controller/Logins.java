package com.cafe.controller;

import java.io.IOException;
import java.io.PrintWriter;

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

            // 로그 확인
            System.out.println("로그인 성공: " + user.getUserID() + ", " + user.getUserName() + ", " + user.getAccount_check());

            // 서버 측에서 리다이렉트 처리 (location.href 대신 사용)
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('로그인 성공');");
            out.println("/<script>");
            response.sendRedirect("../JEIU_FourSeasonsCafe/index.jsp");
        } else {
            // 로그인 실패 메시지를 alert로 표시하고 로그인 페이지로 이동
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('로그인에 실패했습니다. 아이디 또는 비밀번호를 확인 해주세요.');");
            out.println("window.location.replace('../JEIU_FourSeasonsCafe/Login.jsp');"); // replace()는 브라우저 히스토리를 남기지 않음
            out.println("</script>");
            out.flush();

            // 로그 확인
            System.out.println("로그인 실패: " + userID);
        }

    }
}
