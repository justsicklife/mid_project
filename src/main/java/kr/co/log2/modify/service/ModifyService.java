package kr.co.log2.modify.service;

import java.sql.Date;
import java.util.List;

import kr.co.log2.modify.dao.ModifyDAO;
import kr.co.log2.diary.dto.DiaryDTO;


public class ModifyService {
    private ModifyDAO modifyDAO;

       public ModifyService() {
           // DiaryDAO 객체 생성
           this.modifyDAO = new ModifyDAO();
       }

       public void saveDiary(DiaryDTO diary) {
           modifyDAO.saveDiary(diary);
       }

       public DiaryDTO getDiaryById(int diaryNumber) {
           return modifyDAO.getDiaryById(diaryNumber);
       }

       public List<DiaryDTO> getAllDiaries() {
           return modifyDAO.getAllDiaries();
       }

       public void updateDiary(String title,String content,Date date,String image, int diaryNumber ) {
           modifyDAO.updateDiary(title,content,date,image,diaryNumber);
       }

       public void deleteDiary(int diaryNumber) {
           modifyDAO.deleteDiary(diaryNumber);
       } 
   }