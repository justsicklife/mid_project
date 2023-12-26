package kr.co.log2.login.dto;

public class LoginDTO {
    private String id;
    private String password;
    private int checkIdCnt;
    
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getCheckIdCnt() {
		return checkIdCnt;
	}
	public void setCheckIdCnt(int checkIdCnt) {
		this.checkIdCnt = checkIdCnt;
	}
}

