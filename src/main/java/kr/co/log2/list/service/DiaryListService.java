package kr.co.log2.list.service;

import java.util.List;

import kr.co.log2.list.dao.DiaryListDAO;
import kr.co.log2.list.dto.DiaryListDTO;
import kr.co.log2.login.dto.LoginDTO;



public class DiaryListService {
	public List<DiaryListDTO> getDiary(int m_no) {
		DiaryListDAO d = new DiaryListDAO();
		return d.getDiaryList(m_no);
	}
	
	public List<DiaryListDTO> getGarbageDiary(int m_no) {
		DiaryListDAO d = new DiaryListDAO();
		return d.getDiaryGarbageList(m_no);
	}
	
	public int deleteDiaryAll(int[] ids) {
		DiaryListDAO d = new DiaryListDAO();
		return d.deleteDiaryAll(ids);
	}

	public int restoreDiaryAll(int[] ids) {
		DiaryListDAO d = new DiaryListDAO();
		return d.restoreDiaryAll(ids);
	}
}
