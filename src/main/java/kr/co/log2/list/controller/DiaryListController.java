package kr.co.log2.list.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.log2.list.dto.DiaryListDTO;
import kr.co.log2.list.service.DiaryListService;
import kr.co.log2.login.service.LoginService;




@WebServlet("/list")
public class DiaryListController extends HttpServlet {
	private DiaryListDTO DiaryListDTO;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		DiaryListService service = new DiaryListService();
		
		HttpSession session = request.getSession();
		int m_no = (int)session.getAttribute("m_no");

		System.out.println(session.getAttribute("m_no"));
		
		DiaryListService ds = new DiaryListService();
		List<DiaryListDTO> diaryList = ds.getGarbageDiary(m_no);
		
		
		request.setAttribute("diaryList", diaryList);
		
		RequestDispatcher dispatch = request.getRequestDispatcher("/diary_list/diary_list.jsp");
		
		dispatch.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		
		String[] ids_ = request.getParameterValues("id");
		String cmd = request.getParameter("cmd");
		DiaryListService service = new DiaryListService();
		
		if(ids_ != null) {		
			switch (cmd) {
			case "삭제": {
				service = new DiaryListService();
				int[] ids = new int[ids_.length];
				for(int i = 0 ; i < ids_.length; i++) {
					ids[i] = Integer.parseInt(ids_[i]);
					System.out.println(ids[i]);
				}
				int result = service.deleteDiaryAll(ids);
				System.out.println(result);
	
				break;
			}
			}
			PrintWriter out = null;
			out = response.getWriter();
			
			out.print("<script>alert('다이어리를 삭제 하셧습니다.'); ");
			out.print("location.href='/list';</script>");
		} else {			
			response.sendRedirect("/list");
		}
		
	}
}

