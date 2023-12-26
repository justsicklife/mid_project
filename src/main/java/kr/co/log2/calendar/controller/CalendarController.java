package kr.co.log2.calendar.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.google.gson.Gson;

import kr.co.log2.calendar.dto.CalendarDTO;
import kr.co.log2.calendar.service.CalendarService;
import kr.co.log2.gallery.service.GalleryService;


// 필독 
// DAO에 주석 달아 놓음

// 이거는 /contorller/* 은 
// 모든값이 들어 갈수 있다는 것을 뜻함
@WebServlet("/event/*")
public class CalendarController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DataSource dataSource; // 커넥션 풀을 관리하기 위한 데이터 소스 객체
	private CalendarService service;
	private CalendarDTO dto;

	@Override
	public void init() throws ServletException {
		service = new CalendarService();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 이거 안해주면 한글 깨진다.
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");

		// url 에 마지막 부분을 반환한다.
		// controller/getdate
		// 서블릿에 전달된 경로만 반환합니다
		String action = request.getPathInfo();
		 
		switch (action) {
		case "/create": {

			// cal.js 에서 post 요청으로 ajax 보낸거 csl.js 199번줄 에서 보낸거
			int id = Integer.parseInt(request.getParameter("id"));
			String strTime = request.getParameter("str_time");
			String endTime = request.getParameter("end_time");
			String dayChk = request.getParameter("allday_chk");
			String eventDescription = request.getParameter("event_description");
			int allDayChk;
			
			// alldayChk 가 문자열 true 와 같다면
			if (dayChk.equals("true")) {
				allDayChk = 1;
			} else {
				allDayChk = 0;
			}
			
			
			service.addCalendar(id, strTime, endTime, allDayChk, eventDescription);

			break;
		}
		case "/update": {
			
			// cal.js 에서 post 요청으로 ajax 보낸거 csl.js 145번줄 에서 보낸거
			String oldEnd = request.getParameter("oldEnd");
			String oldStart = request.getParameter("oldStart");
			String oldTitle = request.getParameter("oldTitle");
			String start = request.getParameter("start");
			String end = request.getParameter("end");
			String title = request.getParameter("title");

			service.modifyCalendar(oldStart, oldEnd, oldTitle, start, end, title);
			break;
		}
		case "/delete": {
			
			// cal.js 275번째 줄에서 ajax를 씀 그래서 여기로 넘어옴
			String start = request.getParameter("start");
			String end = request.getParameter("end");
			String title = request.getParameter("title");
			
			
			service.deleteCalendar(start,end,title);
			
			break;

		}
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 이거 안해주면 한글 깨진다.
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		// url 에 마지막 부분을 반환한다.
		// controller/getdate
		// 서블릿에 전달된 경로만 반환합니다
		String action = request.getPathInfo();
		System.out.println(action);
		
		HttpSession session = request.getSession(false);
		 if (session == null) {
            session = request.getSession(true); // 존재하지 않으면 새로운 세션 생성
        }	
		 
		int id =(int)session.getAttribute("m_no");
		
		if(action.equals("/*")) {
			action = "/index";
		}

		switch (action) {
		// action 이 '/getdate'라면
		// 아래 분기문을 실행
		case "/getdate": {
			
			// 배열로 값을 CalendarDTO 를 받는 변수 초기화
			// service.getAllCalendarEvents() 메서드는
			// 모든 데이터베이스에있는 Calendar를 반환
			String paramId = request.getParameter("id");
			int userId = Integer.parseInt(paramId);
			
			ArrayList<CalendarDTO> events = service.getAllCalendarEvents(userId);

			
			// 여기는 대충 events 배열을 json 형태로 바꿔주는 것같음
			Gson gson = new Gson();
			String json = gson.toJson(events);

			response.setContentType("application/json");
			PrintWriter out = response.getWriter();
			// 여기는 요청보낸 곳에 json 을 보내는것
			// 요청보낸곳인 cal.js 에 51번 줄을 나타냄
			out.print(json);
			out.flush();
			break;
		}
		case "/index": {
			request.setAttribute("id", id);

			RequestDispatcher view = request.getRequestDispatcher("/calendar/cal.jsp");
			view.forward(request, response);
		}
		}

	}

}
