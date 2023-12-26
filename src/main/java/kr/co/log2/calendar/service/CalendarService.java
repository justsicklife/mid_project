package kr.co.log2.calendar.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.log2.calendar.dao.CalendarDAO;
import kr.co.log2.calendar.dto.CalendarDTO;



public class CalendarService {
	CalendarDAO calendardao;
	
	
	public CalendarService() {
		calendardao = new CalendarDAO();
	}


	public void addCalendar(int id, String str_time, String end_time, int allday_chk, String event_description) {
 	   // 파라미터로 보내진 변수들을 calendardao.addCalendar 로 보내줌
		calendardao.addCalendar(id, str_time, end_time, allday_chk, event_description);
	}
	
	// 리턴값이 배열이고 들어갈 값은 CalendarDTO 이다
	public ArrayList<CalendarDTO> getAllCalendarEvents(int id) {
        try {
        	// dao 에있는 getAllCalendarEvents 메서드 반환
            return calendardao.getAllCalendarEvents(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // 만약 에러가 뜬다면 catch 에서 에러 뛰우고 
        // 여기서 null 값반
        return null;
    }

		
	public void modifyCalendar(String oldStart, String oldEnd, String oldTitle, String start, String end,
			String title) {
		try {
			calendardao.modifyCalendar(oldStart, oldEnd, oldTitle, start, end,title);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	public void deleteCalendar(String start, String end, String title) {
		calendardao.deleteCalendar(start,end,title);
		
	}
	
}
