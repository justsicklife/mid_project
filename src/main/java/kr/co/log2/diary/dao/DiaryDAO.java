package kr.co.log2.diary.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kr.co.log2.diary.dto.DiaryDTO;

public class DiaryDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private static DataSource ds;

	public DiaryDAO()  {     try {
        Context ctx = new InitialContext(); // 톰캣에 저장되어 있는 context 정보 조회를 위한 설정
        Context env = (Context) ctx.lookup("java:/comp/env"); // context에 저장되어 있는 환경(설정) 정보 조회용
        ds = (DataSource) env.lookup("jdbc/oracle"); // connection pool 정보 조회
        conn = ds.getConnection(); // con 변수 초기화  
     } catch (Exception ex) {
        ex.printStackTrace(); // console 창에 로그(메시지) 출력
     }
	}

//	private final String url = "jdbc:mysql://localhost:3306/db_name";
//	private final String username = "your_username";
//	private final String password = "your_password";

	public void saveDiary(DiaryDTO diary) {

			
		try {
			conn = ds.getConnection();
			// INSERT 문 인데 diary_seq.nextval 은 시퀀스를 뜻함
			String query = "INSERT INTO diary (D_NO, M_NO, D_DATE, D_CONT, D_TITLE, D_IMG,I_GARBAGE,I_DELETE) VALUES (diary_seq.nextval, ?, ?, ?, ?, ?,'n','n')";
			PreparedStatement pstmt = conn.prepareStatement(query);
			
			pstmt.setLong(1, diary.getM_no());
			pstmt.setDate(2, diary.getD_date());
			pstmt.setString(3, diary.getD_cont());
			pstmt.setString(4, diary.getD_title());
			pstmt.setString(5, diary.getD_img());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public DiaryDTO getDiaryById(int id) {
		DiaryDTO diary = null;
		
		try {
			conn = ds.getConnection();
			// id 와 같은 데이터 가 있는지 찾음
			String query = "SELECT * FROM diary WHERE id = ?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				diary = new DiaryDTO(id, id, null, query, query, query, query);
				diary.setD_no(rs.getInt("id"));
				diary.setM_no(rs.getInt("id"));
				diary.setD_date(rs.getDate("null"));
				diary.setD_title(rs.getString("query"));
				diary.setD_cont(rs.getString("query"));
				diary.setD_img(rs.getString("query"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return diary;
	}

	public List<DiaryDTO> getAllDiaries() {
		List<DiaryDTO> diaries = new ArrayList<>();
//		try (Connection conn = DriverManager.getConnection(url, username, password)) {
		try {
			conn = ds.getConnection();
			String query = "SELECT * FROM diary";
			PreparedStatement pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				DiaryDTO diary = new DiaryDTO(1, 1, null, query, query, query, query);
				diary.setD_no(rs.getInt("id"));
				diary.setM_no(rs.getInt("id"));
				diary.setD_date(rs.getDate("null"));
				diary.setD_title(rs.getString("query"));
				diary.setD_cont(rs.getString("query"));
				diary.setD_img(rs.getString("query"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return diaries;
	}

	public void updateDiary(DiaryDTO diary) {
//		try (Connection conn = DriverManager.getConnection(url, username, password)) {
		try {
			conn = ds.getConnection();
			String query = "UPDATE diary SET D_TITLE = ?, D_CONT = ?, D_DATE = ? WHERE D_NO = ?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, diary.getD_title());
			pstmt.setString(2, diary.getD_cont());
			pstmt.setDate(3, diary.getD_date());
			pstmt.setInt(4, diary.getD_no());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
}
