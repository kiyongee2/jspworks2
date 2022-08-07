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
		
		if(command.equals("/memberForm.do")) { //회원 가입 페이지 요청
			//페이지 이동
			nextPage = "/memberForm.jsp";
		}else if(command.equals("/addMember.do")) { //회원 가입 요청
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
			//model
			request.setAttribute("msg", "register");
			//view 
			nextPage = "/memberResult.jsp";
		}else if(command.equals("/memberList.do")) { //회원 목록 보기
			ArrayList<Member> memberList = memberDAO.getListAll();
			//model - 회원 목록 데이터
			request.setAttribute("memberList", memberList);
			//view
			nextPage = "./memberList.jsp";
		}else if(command.equals("/loginMember.do")){  //로그인 페이지 요청
			nextPage = "/loginMember.jsp";
		}else if(command.equals("/loginProcess.do")) {  //로그인 처리 요청
			String memberId = request.getParameter("memberId");
			String passwd = request.getParameter("passwd");
			
			Member member = new Member();
			member.setMemberId(memberId);
			member.setPasswd(passwd);
			
			boolean loginResult = memberDAO.login(member);    //로그인 처리
			String name = memberDAO.getNameByLogin(memberId); //이름 가져오기
			
			if(loginResult){
				session.setAttribute("sessionId", memberId);  //아이디 세션 발급
				session.setAttribute("name", name);    //이름 세션 발급
				request.setAttribute("msg", "login");  //model - msg 생성
				nextPage = "/memberResult.jsp";        //페이지 이동
			}else{
				out.println("<script>");
				out.println("alert('아이디나 비밀번호를 확인해주세요')");
				out.println("history.go(-1)");
				out.println("</script>");
			}	
		}else if(command.equals("/logout.do")) { //로그 아웃 처리 요청
			session.invalidate();
			nextPage = "./main.jsp";
		}else if(command.equals("/deleteProcess.do")) { //회원 삭제 요청
			String memberId = request.getParameter("memberId"); //아이디 받기

			memberDAO.deleteMember(memberId);  //회원 삭제
			
			nextPage = "/memberList.do";
		}else if(command.equals("/memberView.do")) { //회원 상세보기
			session = request.getSession();
			String sessionId = (String)session.getAttribute("sessionId");
			Member member = memberDAO.getMember(sessionId);
			
			//model and view
			request.setAttribute("member", member);
			nextPage = "./memberView.jsp";
		}else if(command.equals("/updateProcess.do")) { //회원 수정
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
			request.setAttribute("msg", "update");   //수정 메시지 보내기
			
			nextPage="/memberResult.jsp";
		}else if(command.equals("/boardList.do")) { //게시글 목록 보기
			ArrayList<Board> boardList = boardDAO.getListAll();
			
			//model - 회원 목록 데이터
			request.setAttribute("boardList", boardList);
			
			//view
			nextPage = "/board/boardList.jsp";
		}else if(command.equals("/writeForm.do")) { //글쓰기 페이지 요청
			nextPage = "/board/writeForm.jsp";
		}else if(command.equals("/writeProcess.do")) { //글쓰기 처리
			String memberId = (String)session.getAttribute("sessionId");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			Board board = new Board();
			board.setTitle(title);
			board.setContent(content);
			board.setMemberId(memberId);  //세션이 있는 멤버
			
			boardDAO.insertBoard(board);
			
			//view 
			nextPage = "/boardList.do";  //do로 목록 요청
		}else if(command.equals("/boardView.do")) { //게시글 상세 보기 및 조회수 처리
			int bnum = Integer.parseInt(request.getParameter("bnum"));
			//조회수 증가
			boardDAO.updateHit(bnum);
			//상세글 가져오기
			Board board = boardDAO.getBoard(bnum);

			//model and view
			request.setAttribute("board", board);
			nextPage = "/board/boardView.jsp";
		}else if(command.equals("/deleteBoard.do")) { //게시글 삭제
			int bnum = Integer.parseInt(request.getParameter("bnum"));
			
			boardDAO.deleteBoard(bnum);
			
			request.setAttribute("msg", "bo_delete"); //model - 삭제 메시지 보내기
			nextPage = "/memberResult.jsp";
		}else if(command.equals("/updateBoard.do")) { //게시글 수정 
			int bnum = Integer.parseInt(request.getParameter("bnum")); 
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			Board board = new Board();
			board.setBnum(bnum);
			board.setTitle(title);
			board.setContent(content);
			
			boardDAO.updateBoard(board);
			
			request.setAttribute("msg", "bo_update"); //model - 수정 메시지 보내기
			nextPage = "/memberResult.jsp";
		}
		
		//포워딩 - 페이지 이동
		RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	}
}












