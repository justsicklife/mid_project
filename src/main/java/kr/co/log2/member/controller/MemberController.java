package kr.co.log2.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.log2.member.dao.MemberDao;
import kr.co.log2.member.dto.MemberDTO;
import kr.co.log2.member.service.MemberService;

@WebServlet("/register/*")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MemberService memberService;
	// 서비스는 여기서 생성 되있는데 네네

	public void init(ServletConfig config) throws ServletException {
		memberService = new MemberService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher view = request.getRequestDispatcher("/member/member.jsp");
		view.forward(request, response);
	}
	
	// 가입순서, 가입자명, 아이디, 패스워드, email, 생일 까지 데이터입력 받을수있는 코드
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setCharacterEncoding("UTF-8");
            
            String action = request.getPathInfo();
            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            
            switch (action) {
	            case "/login" -> {
	                String id = request.getParameter("id");
	                MemberDTO result = memberService.checkId(id);
	                
	                if (id == null || id.trim().length() == 0) {
	                	result.setCheckIdCnt(10);
	                }
	                
	                out.print(result.getCheckIdCnt());
	                out.flush();
	                break;
	            } 
	            case "/register" -> {
		            String id = request.getParameter("id");
		
		            String username = request.getParameter("username");
		            
		            String password = request.getParameter("password");
		            String birth = request.getParameter("birth");
		            String emailid = request.getParameter("email_id");
		            String phoneNumber = request.getParameter("phone_number");
		            String emaildomain = request.getParameter("email_domain");
		            String email = "";
		             
		            if (!emailid.equals("") && !emaildomain.equals("")) {
		                email = emailid + "@" + emaildomain;
		            }
		            		                
		            MemberDao md = new MemberDao();
		            md.addMember(id, username, password, email, birth,phoneNumber);
		       
		            response.sendRedirect("/login");
	            }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
}