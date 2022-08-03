package com.controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.repository.Board;
import com.repository.BoardDAO;
import com.repository.Member;
import com.repository.MemberDAO;

@WebServlet("*.do")   //.do 확장자를 가진 모든 파일
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	MemberDAO memberDAO;   //memberDAO 객체 선언
	BoardDAO boardDAO;     //BoardDAO 객체 선언

	public void init(ServletConfig config) throws ServletException { //생성자
		memberDAO = new MemberDAO();  
		boardDAO = new BoardDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String uri = request.getRequestURI();
		System.out.println(uri);  //경로(주소 -path) 정보
		
		String command = uri.substring(uri.lastIndexOf("/"));  //주소 문자열 추출
		System.out.println(uri.lastIndexOf("/"));
		System.out.println(command);
		
		String nextPage = null;  //jsp 페이지
		HttpSession session = request.getSession(); //세션 객체 생성
		PrintWriter out = response.getWriter();     //쓰기 객체 생성
		
		if(command.equals("/memberForm.do")) {
			//회원 가입 페이지 요청
			//페이지 이동
			nextPage = "/memberForm.jsp";
		}else if(command.equals("/addMember.do")) {
			//회원 추가 요청
			//자료 넘겨 받기
			String memberId = request.getParameter("memberId");
			String passwd = request.getParameter("passwd");
			String name = request.getParameter("name");
			String gender = request.getParameter("gender");
			
			//member 객체 set
			Member member = new Member();
			member.setMemberId(memberId);
			member.setPasswd(passwd);
			member.setName(name);
			member.setGender(gender);
			//회원 추가 dao
			memberDAO.addMember(member);
			//view 
			nextPage = "/main.jsp";
		}else if(command.equals("/memberList.do")) {
			//회원 목록 요청
			ArrayList<Member> memberList = memberDAO.getListAll();
	
			//model - 회원 목록 데이터
			request.setAttribute("memberList", memberList);
			//view
			nextPage = "./memberList.jsp";
		}else if(command.equals("/loginMember.do")){
			nextPage = "/loginMember.jsp";
		}else if(command.equals("/loginProcess.do")) {
			//로그인 처리 요청
			String memberId = request.getParameter("memberId");
			String passwd = request.getParameter("passwd");
			
			boolean loginResult = memberDAO.checkLogin(memberId, passwd);
			
			if(loginResult){
				session.setAttribute("sessionId", memberId);  //세션 발급
				nextPage = "./main.jsp";
			}else{
				out.println("<script>");
				out.println("alert('아이디나 비밀번호를 확인해주세요')");
				out.println("history.go(-1)");
				out.println("</script>");
			}
		}else if(command.equals("/logout.do")) {
			//로그 아웃 처리 요청
			session.invalidate();
			nextPage = "./main.jsp";
		}else if(command.equals("/deleteProcess.do")) {
			//회원 삭제 요청
			String memberId = request.getParameter("memberId"); //아이디 받기

			memberDAO.deleteMember(memberId);  //회원 삭제
			
			nextPage = "/memberList.do";
		}else if(command.equals("/memberView.do")) {
			//회원 상세보기
			session = request.getSession();
			String sessionId = (String)session.getAttribute("sessionId");
			Member member = memberDAO.getMember(sessionId);
			
			//model and view
			request.setAttribute("member", member);
			nextPage = "./memberView.jsp";
		}else if(command.equals("/updateProcess.do")) {
			//회원 수정
			String memberId = request.getParameter("memberId");
			String passwd = request.getParameter("passwd");
			String name = request.getParameter("name");
			String gender = request.getParameter("gender");
			
			Member member = new Member();
			member.setMemberId(memberId);
			member.setPasswd(passwd);
			member.setName(name);
			member.setGender(gender);
			
			memberDAO.updateMember(member);
			
			//model and view
			request.setAttribute("member", member);
			nextPage="/memberView.do";
		}else if(command.equals("/boardList.do")) {
			ArrayList<Board> boardList = boardDAO.getListAll();
			
			//model - 회원 목록 데이터
			request.setAttribute("boardList", boardList);
			
			//view
			nextPage = "/board/boardList.jsp";
		}else if(command.equals("/writeForm.do")) {
			nextPage = "/board/writeForm.jsp";
		}else if(command.equals("/writeProcess.do")) {
			
			String sessionId = (String)session.getAttribute("sessionId");

			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			Board board = new Board();
			board.setTitle(title);
			board.setContent(content);
			board.setMemberId(sessionId);
			
			boardDAO.insertBoard(board);
			
			//view 
			nextPage = "/boardList.do";  //do로 목록 요청
		}
		//포워딩
		RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
		
	}

}











