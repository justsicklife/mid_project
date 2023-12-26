package kr.co.log2.calendar.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kr.co.log2.calendar.dto.CalendarDTO;




public class CalendarDAO {
    private Connection con; // DB 연결을 위한 Connection 변수
    private PreparedStatement pstmt; // SQL 문 실행을 위한 변수
    private DataSource ds; // Connection Pool에서 DB 연결 정보 조회

    public CalendarDAO() {
        try {
        	// 컨텍스트 초기화 및 데이터 소스 검색
            Context ctx = new InitialContext(); // 톰캣에 저장되어 있는 Context 정보 조회를 위한 설정
            Context env = (Context) ctx.lookup("java:/comp/env"); // Context에 저장되어 있는 환경(설정) 정보 조회
            ds = (DataSource) env.lookup("jdbc/oracle"); // Connection Pool 정보 조회
        } catch (Exception ex) {
            ex.printStackTrace();
        }    
    }
    
    public void addCalendar(int id, String str_time, String end_time, int allday_chk, String event_description ) {
    	try {
    		con = ds.getConnection();
    		
    		// 이건 받은값을 데이터베이스에 넣어주는 쿼리 
    		String query = "INSERT INTO calendar (id, str_time, end_time, allday_chk, event_description) VALUES (?, ?, ?, ?, ?)";
    		
    		
    		pstmt = con.prepareStatement(query);
    		
    		// 쿼리에 들어갈 ? 값들을 넣어줌
    		// 이게 뭔뜻이냐면 1 번째 ? 에 int 값을 id 로 세팅해줌
    		pstmt.setInt(1, id);
    		// 이게 뭔뜻이냐면 1 번째 ? 에 String 값을 str_time 로 세팅해줌
    		// 밑에도 동일
    		pstmt.setString(2, str_time);
    		pstmt.setString(3, end_time);
    		pstmt.setInt(4, allday_chk);
    		pstmt.setString(5, event_description);
    		
    		ResultSet rs = pstmt.executeQuery();
    		
    		pstmt.close();
    		con.close();
    	} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    }
    
    public ArrayList<CalendarDTO> getAllCalendarEvents(int id) throws SQLException {
        con = ds.getConnection();
        ResultSet resultSet = null;
        
        ArrayList<CalendarDTO> events = new ArrayList<>();

        // 모든 캘린더를 가져오는 것
        String query = "SELECT * FROM calendar where id = ?";
        try {
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1,	id);
            resultSet = pstmt.executeQuery();
            // 받아온 결과들을 조회 하기 위해  while(resultSet.next()) 사용
            while (resultSet.next()) {
                int id_ = resultSet.getInt("id");
                String strTime = resultSet.getString("str_time");
                String endTime = resultSet.getString("end_time");
                int allDayChk = resultSet.getInt("allday_chk");
                String eventDescription = resultSet.getString("event_description");
                
                // DTO 에서 생성자를 써서 객체를 초기화한다.
                CalendarDTO event = new CalendarDTO(id_, strTime, endTime, allDayChk, eventDescription);
                // events 배열에 event 를 넣어준다.
                events.add(event);
            }
        } catch (SQLException e) {
            e.printStackTrace();   
        } 
        // finally 구문은 예외처리가 발생여부를 떠나 무조건 실행하도록 하는 구문입니다.
        finally {
            // 사용을 했으면 닫아준다.
        	if (resultSet != null) {
                resultSet.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (con != null) {
                con.close();
            }
        }
        
        // 배열값을 반환한다.
        return events;
    }

	public void modifyCalendar(String oldStart, String oldEnd, String oldTitle, String start, String end,
			String title) throws SQLException {
		con = ds.getConnection();
		
		System.out.printf("%s %s %s\n",start,end,title);
		System.out.printf("%s %s %s",oldStart,oldEnd,oldTitle);
		
		// 이건 받은값을 데이터베이스에 넣어주는 쿼리 
		// 변경전의 값을 새로운 값으로 바꿔주는 쿼리
		String query = "UPDATE CALENDAR SET STR_TIME = ?, END_TIME = ?, event_description = ?"
				+ " WHERE STR_TIME = ? AND END_TIME = ? AND event_description = ?";
		
		pstmt = con.prepareStatement(query);
				
		pstmt.setString(1, start);
		pstmt.setString(2, end);
		pstmt.setString(3, title);
		pstmt.setString(4, oldStart);
		pstmt.setString(5, oldEnd);
		pstmt.setString(6, oldTitle);
		
		// 잘지웠나 결과 값을 반환함 실패하면 0 성공하면 1
		int res = pstmt.executeUpdate();
		System.out.println(res);
		
		pstmt.close();
		con.close();
	}

	public void deleteCalendar(String start, String end, String title) {
		
		// 매게변수로 받은 값을 이용해 쿼리에 ? 에 대입하여 
		// 매게변수와 값이 같은 값만 삭제 
		String query = "DELETE FROM CALENDAR WHERE STR_TIME = ? AND END_TIME = ?  AND event_description = ?";
		try {
			con = ds.getConnection();
			
			System.out.printf("%s %s %s\n",start,end,title);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, start);
			pstmt.setString(2, end);
			pstmt.setString(3, title);
			
			// 잘지웠나 결과 값을 반환함 실패하면 0 성공하면 1
			int res = pstmt.executeUpdate();
			System.out.println(res);
			
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
	}
}