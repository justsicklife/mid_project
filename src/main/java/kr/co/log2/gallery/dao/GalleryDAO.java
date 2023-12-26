package kr.co.log2.gallery.dao;

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

import kr.co.log2.gallery.dto.GalleryDTO;

public class GalleryDAO {
	private Connection con; // db 연결을 위한 connection 변수
	private PreparedStatement pstmt; // SQL문 실행을 위한 변수
	private DataSource ds; // connection pool에서 db 연결 정보 조회

	public GalleryDAO() {
		try {
			Context ctx = new InitialContext(); // 톰캣에 저장되어 있는 context 정보 조회를 위한 설정
			Context env = (Context) ctx.lookup("java:/comp/env"); // context에 저장되어 있는 환경(설정) 정보 조회용
			ds = (DataSource) env.lookup("jdbc/oracle"); // connection pool 정보 조회
		} catch (Exception ex) {
			ex.printStackTrace(); // console 창에 로그(메시지) 출력
		}
	}

	public List<GalleryDTO> getAllImages(int m_no) throws SQLException { // 이미지 대조하기
		List<GalleryDTO> images = new ArrayList<>();

		try {
			con = ds.getConnection();
			String query = "SELECT D_NO, d_date, D_IMG, i_garbage, i_delete " + "FROM diary "
					+ "WHERE i_garbage = 'n' AND D_IMG IS NOT NULL and m_no = ?" + "ORDER BY D_NO DESC"; // i_garbage 혹은
																											// i_delete가
																											// y 가 아닌것을
																											// 이미지에 띄워줌
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, m_no);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				GalleryDTO dto = new GalleryDTO();
				
				String i_garbage = rs.getString("I_GARBAGE");
				String i_delete = rs.getString("I_DELETE");
				String d_img = rs.getString("D_IMG");
				Date d_date = rs.getDate("D_DATE");

				dto.setI_garbage(i_garbage);
				dto.setI_delete(i_delete);
				dto.setD_img(d_img);
				dto.setD_date(d_date);
				images.add(dto);

			}
			rs.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return images;
	}
}