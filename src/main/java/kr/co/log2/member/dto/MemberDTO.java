package kr.co.log2.member.dto;

import java.sql.Date;

public class MemberDTO {
    private String id;
    private String username;
    private String password;
    private String email;
    private String birth;
    private int checkIdCnt;

    public int getCheckIdCnt() {
		return checkIdCnt;
	}

	public void setCheckIdCnt(int checkIdCnt) {
		this.checkIdCnt = checkIdCnt;
	}
	
	public MemberDTO() {
		
	}
	
    // 생성자
    public MemberDTO(String id, String username, String password, String email, String birth) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.birth = birth;
    }

    // Getter 및 Setter 메서드
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    public String getBirth() {
        return birth;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }
    
}
