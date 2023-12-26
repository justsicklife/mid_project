package kr.co.log2.logout.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
        HttpSession session = request.getSession(false);
        //System.out.println(session.getAttribute("isLogin"));
        if (session != null) {
            // 세션 무효화
            session.invalidate();
        }

        PrintWriter out = null;
		out = response.getWriter();
		
		out.print("<script>alert('로그아웃 하셧습니다.'); ");
		out.print("location.href='/login';</script>");
        
        // 로그아웃 후 리다이렉트할 페이지 설정
//        String redirectUrl = request.getContextPath() + "/login";
//        response.sendRedirect(redirectUrl);
    }
}
