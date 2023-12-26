package kr.co.log2.garbage.service;

import java.util.List;

import kr.co.log2.garbage.dao.GarbageDAO;
import kr.co.log2.garbage.dto.GarbageDTO;


public class GarbageService {
	public List<GarbageDTO> getDiary() {
		GarbageDAO d = new GarbageDAO();
		return d.getDiaryList();
	}
	
	public List<GarbageDTO> getGarbageDiary() {
		GarbageDAO d = new GarbageDAO();
		return d.getDiaryGarbageList();
	}
	
	public int deleteDiaryAll(int[] ids) {
		GarbageDAO d = new GarbageDAO();
		return d.deleteDiaryAll(ids);
	}

	public int restoreDiaryAll(int[] ids) {
		GarbageDAO d = new GarbageDAO();
		return d.restoreDiaryAll(ids);
	}

}
