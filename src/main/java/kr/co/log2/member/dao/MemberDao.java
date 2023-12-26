package kr.co.log2.member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kr.co.log2.login.dto.LoginDTO;
import kr.co.log2.member.dto.MemberDTO;

public class MemberDao {
    private Connection con;
    private PreparedStatement pstmt;
    private static DataSource ds;

    public MemberDao() {
        try {
            Context ctx = new InitialContext(); // 톰캣에 저장되어 있는 context 정보 조회를 위한 설정
            Context env = (Context) ctx.lookup("java:/comp/env"); // context에 저장되어 있는 환경(설정) 정보 조회용
            ds = (DataSource) env.lookup("jdbc/oracle"); // connection pool 정보 조회
            con = ds.getConnection(); // con 변수 초기화
         } catch (Exception ex) {
            ex.printStackTrace(); // console 창에 로그(메시지) 출력
         }
    }

    public void addMember(String id, String username, String password, String email, String birth,String phoneNumber) throws SQLException {
    	 
    	String query = "INSERT INTO member ( m_no, id, username, password, email, birth,phone_no) VALUES (M_NO_NUM.NEXTVAL, ?, ?, ?, ?, ?, ?)";

    	System.out.println(id);

    	System.out.println(username);

    	System.out.println(password);

    	System.out.println(email);
    	System.out.println(birth);
    	
    	//잠시만요
        
        try {
        	
        	PreparedStatement statement = con.prepareStatement(query); 
        	
        	// ? 쿼리에 물음표 있잖아요 
        	// DAO에서 반환하면 서비스가 받고 그걸 서비스가 반환해서 컨트롤러가 사용하죠
            statement.setString(1, id);
            statement.setString(2, username);
            statement.setString(3, password);
            statement.setString(4, email);
			statement.setString(5, birth);
			statement.setString(6, phoneNumber);

            statement.executeUpdate();
        } catch(Exception e) { 
        	e.printStackTrace();
        }
    }

    
    //아이디 중복확인
    public MemberDTO checkId(String id) {
    	MemberDTO checkId = new MemberDTO();
    	try {
    		con = ds.getConnection();
    		String query = """
    			SELECT COUNT(*) AS cnt FROM MEMBER
    			WHERE ID = ?
    			""";
			pstmt= con.prepareStatement(query);
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			
			int result = rs.getInt("cnt");
			
			checkId.setCheckIdCnt(result);
			
			
			rs.close();
			pstmt.close();
			con.close();
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} 
    	return checkId;
	}
}