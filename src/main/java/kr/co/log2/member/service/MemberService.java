package kr.co.log2.member.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import kr.co.log2.member.dao.MemberDao;
import kr.co.log2.member.dto.MemberDTO;

public class MemberService {
    private MemberDao memberDao;

    public MemberService() {
    	// 맞죠 초기화 
        memberDao = new MemberDao();
        // 뭘요? 네네 
    }
    
    public MemberDTO checkId(String id) {
    	MemberDTO member = null;
    	member = memberDao.checkId(id);
		return member;
		
    }
}
