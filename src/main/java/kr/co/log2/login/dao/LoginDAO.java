package kr.co.log2.login.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kr.co.log2.login.dto.LoginDTO;

public class LoginDAO {
    private Connection con; // DB 연결을 위한 Connection 변수
    private PreparedStatement pstmt; // SQL 문 실행을 위한 변수
    private DataSource ds; // Connection Pool에서 DB 연결 정보 조회

    public LoginDAO() {
        try {
        	// 컨텍스트 초기화 및 데이터 소스 검색
            Context ctx = new InitialContext(); // 톰캣에 저장되어 있는 Context 정보 조회를 위한 설정
            Context env = (Context) ctx.lookup("java:/comp/env"); // Context에 저장되어 있는 환경(설정) 정보 조회
            ds = (DataSource) env.lookup("jdbc/oracle"); // Connection Pool 정보 조회
            con = ds.getConnection(); // con 변수 초기화
        } catch (Exception ex) {
            ex.printStackTrace();
        }    
    }

    public List<LoginDTO> listMembers() {
        List<LoginDTO> list = new ArrayList<>();

        try {
        	con = ds.getConnection(); // con 변수 초기화
            String query = "SELECT * FROM MEMBER";
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                String id = rs.getString("id");
                String password = rs.getString("password");

                LoginDTO dto = new LoginDTO();
                dto.setId(id);
                dto.setPassword(password);

                list.add(dto);
            }

            rs.close();
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean isExisted(LoginDTO loginDTO) {
        boolean result = false;
        String id = loginDTO.getId();
        String password = loginDTO.getPassword();

        try {
            String query = "SELECT COUNT(*) AS result FROM MEMBER WHERE id = ? AND password = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, id);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                int count = rs.getInt("result");
                result = (count == 1);
            }

            rs.close();
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }
    // 회원 session 을 저장하기 위한 메서드
    public int memberNoCheck(LoginDTO loginDTO) {
        int result = 999;
        String id = loginDTO.getId();

        try {
            String query = "SELECT M_NO FROM MEMBER WHERE id = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, id); 
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {  
                result = rs.getInt("M_NO");
                
                
            } else { 
            	result = 999;
            }

            rs.close();
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
}
    
    public String getUsername(int id) {
		
		String query = "SELECT * from member where M_NO = ?";
		String username= "";
		try {
			con = ds.getConnection();
			
			PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
			
            
            if(rs.next()) {
            	username = rs.getString("username");
            }
			
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		
		return username;
	}

}