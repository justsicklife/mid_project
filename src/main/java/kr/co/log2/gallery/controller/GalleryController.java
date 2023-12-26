package kr.co.log2.gallery.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.log2.gallery.dto.GalleryDTO;
import kr.co.log2.gallery.service.GalleryService;


@WebServlet("/gallery")
public class GalleryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession(); // 세션이 이미 존재하는지 확인
		int m_no = (int)session.getAttribute("m_no");
		
        GalleryService galleryService = new GalleryService();
       
        try {
        	System.out.println(m_no);
        	List<GalleryDTO> images = galleryService.getAllImages(m_no);
        	request.setAttribute("images", images);
        	        	
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
	
        RequestDispatcher dispatcher = request.getRequestDispatcher("/gallery/gallery.jsp");
        dispatcher.forward(request, response);
    }
} 
