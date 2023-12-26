package kr.co.log2.modify.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kr.co.log2.diary.dto.DiaryDTO;

public class ModifyDAO {

   private Connection conn;
   private PreparedStatement pstmt;
   private static DataSource ds;

   public ModifyDAO()  {     try {
        Context ctx = new InitialContext(); // 톰캣에 저장되어 있는 context 정보 조회를 위한 설정
        Context env = (Context) ctx.lookup("java:/comp/env"); // context에 저장되어 있는 환경(설정) 정보 조회용
        ds = (DataSource) env.lookup("jdbc/oracle"); // connection pool 정보 조회
        conn = ds.getConnection(); // con 변수 초기화  
     } catch (Exception ex) {
        ex.printStackTrace(); // console 창에 로그(메시지) 출력
     }
   }
   
    public void saveDiary(DiaryDTO diary) {
        try  {
         conn = ds.getConnection();
            String query = "INSERT INTO diary(D_NO, M_NO, D_DATE, D_CONT, D_TITLE, D_IMG) VALUES (diary_seq.nextval, diary_seq.nextval, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(query);
            
            pstmt.setString(1, diary.getD_title());
            pstmt.setString(2, diary.getD_cont());
            pstmt.setDate(3, diary.getD_date());
            
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public DiaryDTO getDiaryById(int id) {
        DiaryDTO diary = null;
        try  {
         conn = ds.getConnection();
            String query = "SELECT * FROM diary WHERE d_no = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                diary = new DiaryDTO();
//                diary.setD_no(rs.getInt("id"));
//                diary.setD_title(rs.getString("title"));
//                diary.setD_cont(rs.getString("content"));
//                diary.setD_date(rs.getDate("date"));
            
                diary.setD_no(rs.getInt("d_no"));
                diary.setD_title(rs.getString("d_title"));
                diary.setD_cont(rs.getString("d_cont"));
                diary.setD_date(rs.getDate("d_date"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return diary;
    }

    public List<DiaryDTO> getAllDiaries() {
        List<DiaryDTO> diaries = new ArrayList<>();
        try  {
         conn = ds.getConnection();
            String query = "SELECT * FROM diary";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                DiaryDTO diary = new DiaryDTO();
                diary.setD_no(rs.getInt("diaryNumber"));
                diary.setD_title(rs.getString("title"));
                diary.setD_cont(rs.getString("content"));
                diary.setD_date(rs.getDate("date"));
                diaries.add(diary);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return diaries;
    }

    public void updateDiary(String title,String cont,Date date, String img, int id) {
        try  {
         conn = ds.getConnection();
            String query = "UPDATE diary SET d_title = ?, d_cont = ?, d_date = ?, d_img = ? WHERE D_NO = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1,title);
            pstmt.setString(2, cont);
            pstmt.setDate(3,  date);
            pstmt.setString(4, img);
            pstmt.setInt(5,id);
            int result = pstmt.executeUpdate();
            
            System.out.println();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteDiary(int id) {
        try {
        	System.out.println(id);
         conn = ds.getConnection();
            String query = "DELETE FROM diary WHERE D_NO = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, id); //여기에 페이지번호 넣기 >_<9자리에 ㄱ 
            int result = pstmt.executeUpdate();
            System.out.println(result);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}