package kr.co.log2.diary.service;

import java.util.List;

import kr.co.log2.diary.dao.DiaryDAO;
import kr.co.log2.diary.dto.DiaryDTO;

public class DiaryService {
    private DiaryDAO diaryDAO;

    public DiaryService() {
        // DiaryDAO 객체 생성
        this.diaryDAO = new DiaryDAO();
    }

    public void saveDiary(DiaryDTO diary) {
        diaryDAO.saveDiary(diary);
    }

    public DiaryDTO getDiaryById(int id) {
        return diaryDAO.getDiaryById(id);
    }

    public List<DiaryDTO> getAllDiaries() {
        return diaryDAO.getAllDiaries();
    }

    public void updateDiary(DiaryDTO diary) {
        diaryDAO.updateDiary(diary);
    }
}
