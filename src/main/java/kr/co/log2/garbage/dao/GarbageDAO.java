package kr.co.log2.garbage.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kr.co.log2.garbage.dto.GarbageDTO;



public class GarbageDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private DataSource ds;
	
	public GarbageDAO() {
		try {
			Context ctx = new InitialContext(); // 톰캣에 저장되어 있는 context 정보 조회를 위한 설정
			Context env = (Context)ctx.lookup("java:/comp/env"); // context에 저장되어 있는 환경(설정) 정보 조회용
			ds = (DataSource) env.lookup("jdbc/oracle"); // connection pool 정보 조회
		} catch (Exception ex) {
			ex.printStackTrace(); // console 창에 로그(메시지) 출력
		}
	}
	
	public List<GarbageDTO> getDiaryList() {
		List<GarbageDTO> list = new ArrayList<GarbageDTO>();
		String query = "SELECT * FROM DIARY WHERE i_garbage = 'n'";
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int memberNumber = rs.getInt("m_no");
				int diaryListNum = rs.getInt("d_listnum");
				Date diaryDate = rs.getDate("d_date");
				String diaryTitle = rs.getString("d_title");
				String diaryContent = rs.getString("d_cont");
				String diaryImage = rs.getString("d_img");
				String diaryRandomImage = rs.getString("d_rimg");
				String isGarbage = rs.getString("i_garbage");
				String isDelete = rs.getString("i_delete");
				
				GarbageDTO g = new GarbageDTO();
				g.setMemberNumber(memberNumber);
				g.setDiaryListNum(diaryListNum);
				g.setDiaryDate(diaryDate);
				g.setDiaryTitle(diaryTitle);
				g.setDiaryContent(diaryContent);
				g.setDiaryImg(diaryImage);				
				g.setDiaryRandomImg(diaryRandomImage);
				g.setIsGarbage(isGarbage);
				g.setIsDelete(isDelete);
				
				list.add(g);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<GarbageDTO> getDiaryGarbageList() {
		List<GarbageDTO> list = new ArrayList<GarbageDTO>();
		String query = "SELECT * FROM DIARY WHERE i_garbage = 'y' and i_delete = 'n' ORDER BY d_no DESC";
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int diaryNumber = rs.getInt("d_no");
				int memberNumber = rs.getInt("m_no");

				Date diaryDate = rs.getDate("d_date");
				String diaryTitle = rs.getString("d_title");
				String diaryContent = rs.getString("d_cont");
				String diaryImage = rs.getString("d_img");
				String diaryRandomImage = rs.getString("d_rimg");
				String isGarbage = rs.getString("i_garbage");
				String isDelete = rs.getString("i_delete");
				
				GarbageDTO g = new GarbageDTO();
				g.setDiaryNumber(diaryNumber);
				g.setMemberNumber(memberNumber);

				g.setDiaryDate(diaryDate);
				g.setDiaryTitle(diaryTitle);
				g.setDiaryContent(diaryContent);
				g.setDiaryImg(diaryImage);				
				g.setDiaryRandomImg(diaryRandomImage);
				g.setIsGarbage(isGarbage);
				g.setIsDelete(isDelete);
				
				list.add(g);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public int deleteDiary(int id) {
		String query = "UPDATE DIARY SET I_DELETE = 'y' WHERE d_no = ?";
		int r = 0;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, id);
			r = pstmt.executeUpdate();
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return r;
	}
	
	public int restoreDiaryAll(int[] ids) {
		int result = 0;
		 
		 String params = "";
		 
		 for(int i = 0 ; i < ids.length; i++) {
			 params += ids[i];
			 if(i < ids.length - 1) 
				 params += ",";
		 }
		 
		 String sql = "UPDATE DIARY SET I_GARBAGE  = 'n' WHERE d_no IN (" + params + ")";
		 try { 
			con = ds.getConnection();
			Statement st = con.createStatement();
			result = st.executeUpdate(sql);
			
		 } catch(Exception e ) {
			 e.printStackTrace();
		 }
		 
		 return result;
	}

	public int deleteDiaryAll(int[] ids) {
		 int result = 0;
		 
		 String params = "";
		 
		 for(int i = 0 ; i < ids.length; i++) {
			 params += ids[i];
			 if(i < ids.length - 1) 
				 params += ",";
		 }
		 System.out.println(params);
		 String sql = "UPDATE DIARY SET I_DELETE  = 'y' WHERE d_no IN (" + params + ")";
		 try { 
			con = ds.getConnection();
			Statement st = con.createStatement();
			result = st.executeUpdate(sql);
		 } catch(Exception e ) {
			 e.printStackTrace();
		 }
		 
		 return result;
	}

}

