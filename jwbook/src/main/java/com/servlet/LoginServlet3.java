package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet3
 */
@WebServlet("/login3")
public class LoginServlet3 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		
		String userid = request.getParameter("userid"); //아이디 받기
		String passwd = request.getParameter("passwd"); //비빌번호 받기
		String phone = request.getParameter("phone"); //비빌번호 받기
		
		System.out.println("아이디: " + userid);
		System.out.println("비밀번호: " + passwd);
		System.out.println("전화번호: " + phone);
	}

}
