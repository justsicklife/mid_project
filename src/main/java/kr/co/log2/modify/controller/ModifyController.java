package kr.co.log2.modify.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import kr.co.log2.diary.dao.DiaryDAO;
import kr.co.log2.diary.dto.DiaryDTO;
import kr.co.log2.modify.service.ModifyService;

@WebServlet("/ModifyController")
public class ModifyController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    ModifyService modifyService = new ModifyService();
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=utf-8");
    
       
          String diaryNumber_ = request.getParameter("diaryNumber");
          int diaryNumber = Integer.parseInt(diaryNumber_);
          DiaryDTO diary = modifyService.getDiaryById(diaryNumber);
          
          request.setAttribute("diary", diary);
          
          RequestDispatcher view = request.getRequestDispatcher("/diary_modify/modify.jsp");
          view.forward(request,response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
    
          String datePicker = request.getParameter("datePicker");
          String title = request.getParameter("title");
          String content = request.getParameter("content");
          String image = request.getParameter("image");
          String mode = request.getParameter("mode");
          String diaryNumber_ = request.getParameter("id");
          int diaryNumber =Integer.parseInt(diaryNumber_);
        
          if(mode.equals("삭제")) {
             modifyService.deleteDiary(diaryNumber);
          } else if(mode.equals("수정")){
             modifyService.updateDiary(title,content,Date.valueOf(datePicker),image,diaryNumber);
          }
          
          response.sendRedirect("/list"); 
      }
} 
      
   
