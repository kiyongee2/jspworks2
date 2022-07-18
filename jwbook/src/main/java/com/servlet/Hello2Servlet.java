package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/hello2")
public class Hello2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=utf-8"); //한글 형식
		
		PrintWriter out = response.getWriter();
		
		//int cnt = Integer.parseInt(request.getParameter("cnt")); //Null Pointer 오류
		int cnt = 10;
		String param = request.getParameter("cnt");
		if(param != null) {
			cnt = Integer.parseInt(param);
		}
		
		for(int i=0; i<cnt; i++) {
			out.println("안녕~ Servlet!!<br>");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
