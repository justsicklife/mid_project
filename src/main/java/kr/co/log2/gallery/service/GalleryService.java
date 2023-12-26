package kr.co.log2.gallery.service;

import java.sql.SQLException;

import java.util.List;

import kr.co.log2.gallery.dao.GalleryDAO;
import kr.co.log2.gallery.dto.GalleryDTO;

public class GalleryService {
    private GalleryDAO galleryDAO;

    public GalleryService() {
        galleryDAO = new GalleryDAO();
    }

    public List<GalleryDTO> getAllImages(int m_no) throws SQLException {
        return galleryDAO.getAllImages(m_no);
    }

	}