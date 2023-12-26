package kr.co.log2.garbage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.log2.garbage.dto.GarbageDTO;
import kr.co.log2.garbage.service.GarbageService;




@WebServlet("/garbage")
public class GarbageController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		
		GarbageService ds = new GarbageService();
		List<GarbageDTO> diaryList = ds.getGarbageDiary();
		
		request.setAttribute("diaryList", diaryList);
		
		RequestDispatcher dispatch = request.getRequestDispatcher("/trash-list/trash.jsp");
		
		dispatch.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		
		String[] ids_ = request.getParameterValues("id");
		String cmd = request.getParameter("cmd");
		GarbageService service = new GarbageService();
		
		System.out.println(ids_);
		
		if(ids_ != null) {		
			switch (cmd) {
			case "삭제": {
				service = new GarbageService();
				int[] ids = new int[ids_.length];
				for(int i = 0 ; i < ids_.length; i++) {
					ids[i] = Integer.parseInt(ids_[i]);
					System.out.println(ids[i]);
				}
				int result = service.deleteDiaryAll(ids);
				System.out.println(result);
	
				PrintWriter out = null;
				out = response.getWriter();
				
				out.print("<script>alert('다이어리를 삭제 하셧습니다.'); ");
				out.print("location.href='/garbage';</script>");
				break;
			}
			case "복구": {
				
				service = new GarbageService();
				int[] ids = new int[ids_.length];
				for(int i = 0 ; i < ids_.length; i++) {
					ids[i] = Integer.parseInt(ids_[i]);
				}
				
				int result = service.restoreDiaryAll(ids);
				System.out.println(result);
				
				PrintWriter out = null;
				out = response.getWriter();
				
				out.print("<script>alert('다이어리를 복구 하셧습니다.'); ");
				out.print("location.href='/garbage';</script>");
				break; 
			}
			}
		} else {
			response.sendRedirect("/garbage");
		}
		
	}

}
