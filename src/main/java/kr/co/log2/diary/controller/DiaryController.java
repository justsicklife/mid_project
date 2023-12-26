package kr.co.log2.diary.controller;


import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import kr.co.log2.diary.dao.DiaryDAO;
import kr.co.log2.diary.dto.DiaryDTO;

@WebServlet("/diarycontroller")

// https://m.blog.naver.com/aservmz/222081244906

//fileUpload 시에 메모리에 저장되는 임시 파일 크기를 정의
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
//업로드할 파일의 치대 크기를 지정한다.
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
// request 시에 최대 크기를 지정한다.
                 maxRequestSize = 1024 * 1024 * 50)    // 50MB

public class DiaryController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    	
 
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
    	
        RequestDispatcher dispatcher = request.getRequestDispatcher("/diary/diary.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
    	
        String date = request.getParameter("date");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        
        
        // 세션 객체 만들기
        HttpSession session = request.getSession();
        
        // session 영역에 저장된 값을 int로 형변환 하여 가져옴
        int mNo = (int) session.getAttribute("m_no");
        // m_no 값을 가져와서 DiaryDTO 객체에 설정

        // 이미지 파일 처리 로직
        
        
        // 파일을 읽어올때 사용하는것 
        Part filePart = request.getPart("image");
        // 업로드한 파일을 이름을 구함
        String fileName = filePart.getSubmittedFileName();
        
        // 나도 잘 모르겠음 
        InputStream fileContent = filePart.getInputStream();
     
        DiaryDTO dd = new DiaryDTO();
        dd.setD_no(1);
        dd.setM_no(mNo);
        dd.setDateFromString(date);
        dd.setD_cont(content);
        dd.setD_title(title);
        dd.setD_img(fileName); // 이미지 파일명 설정

        DiaryDAO da = new DiaryDAO();
        da.saveDiary(dd);
        PrintWriter out = null;

        out = response.getWriter();
        out.print("<script>alert('일기를 등록하였습니다.'); ");
        out.print("location.href='/event/*';</script>");
        
        
        // evnet 페이지로 새로고침
//        response.sendRedirect("/event/*");
    }
    }
