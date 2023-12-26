package kr.co.log2.login.service;

import java.sql.SQLException;

import kr.co.log2.login.dao.LoginDAO;
import kr.co.log2.login.dto.LoginDTO;

public class LoginService {
    private LoginDAO loginDAO;

    public LoginService() {
        loginDAO = new LoginDAO();
    }

	public boolean isExisted(LoginDTO loginDTO) {
		boolean result = loginDAO.isExisted(loginDTO);
		return result;
		
	}
	
	public int memberNoCheck(LoginDTO loginDTO) {
		int result = loginDAO.memberNoCheck(loginDTO);
		return result;
	}

	public String getUsername(int id) {
		String result = loginDAO.getUsername(id);
		return result;
	}

}

