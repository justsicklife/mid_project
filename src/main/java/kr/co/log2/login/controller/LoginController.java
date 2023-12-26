package kr.co.log2.login.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.log2.login.dao.LoginDAO;
import kr.co.log2.login.dto.LoginDTO;
import kr.co.log2.login.service.LoginService;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;
	private static final Object M_no = null;
    LoginService loginService;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher view = request.getRequestDispatcher("/Login/login.jsp");
        view.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	doHandle(request, response);
    }
    
    private void doHandle(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = null;

        try {
            out = response.getWriter();

            String id = request.getParameter("id");
            String password = request.getParameter("password");
            
            if (id == null || id.trim().length() == 0) {
            	 out.print("<script>alert('아이디를 입력하세요'); ");
                 out.print("location.href='/login';</script>");
            } else if (password == null || password.trim().length() == 0) {
            	 out.print("<script>alert('비밀번호를 입력하세요'); ");
                 out.print("location.href='/login';</script>");
            }

            LoginDTO loginDTO = new LoginDTO();
            loginDTO.setId(id);
            loginDTO.setPassword(password);

            LoginService service = new LoginService();
            boolean result = service.isExisted(loginDTO);
            if (result) {
            	int m_no = service.memberNoCheck(loginDTO);
                HttpSession session = request.getSession(false); // 세션이 이미 존재하는지 확인
                if (session == null) {
                    session = request.getSession(true); // 존재하지 않으면 새로운 세션 생성
                }

                session.setAttribute("isLogin", true);
                session.setAttribute("login.id", id);
                session.setAttribute("m_no", m_no);
                // 세션에 패스워드를 저장하지 않도록 수정
                System.out.println(session.getAttribute("m_no"));
                
                loginService = new LoginService();
               
                String username = loginService.getUsername(m_no);
                
                String alert= "<script>alert(' " + username + "님 환영합니다.'); location.href='/event/index';</script> ";
                
                out.print(alert);
//                response.sendRedirect("/event/index"); // 로그인 성공 시 다른 페이지로 리다이렉트
            } else {
				out.print("<script>alert('아이디 또는 비밀번호를 다시 입력하세요'); ");
                out.print("location.href='/login';</script>");
            }
        } catch (IOException e) {
            // IOException 처리 로직 추가
            e.printStackTrace();
        } finally {
            if (out != null) {
                out.close();
            }
        }
    }
}