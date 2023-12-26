package kr.co.log2.gallery.dto;

import java.sql.Date;

public class GalleryDTO {

	private int m_no;		// 회원 넘버
	private String d_img;	// 이미지 이름
	private String d_rimg; 	// 이미지 랜덤 이름
	private Date d_date;	// 이미지 저장 날짜
	private String i_garbage;
	private String i_delete;
	
	

	public GalleryDTO() {
		super();
		this.m_no = m_no;
		this.d_img = d_img;
		this.d_date = d_date;
	}


	public GalleryDTO(int m_no, String d_img, String d_rimg, Date d_date, String i_garbage, String i_delete) {
		super();
		this.m_no = m_no;
		this.d_img = d_img;
		this.d_rimg = d_rimg;
		this.d_date = d_date;
		this.i_garbage = i_garbage;
		this.i_delete = i_delete;
	}
	
	
	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getD_img() {
		return d_img;
	}

	public void setD_img(String d_img) {
		this.d_img = d_img;
	}

	public String getD_rimg() {
		return d_rimg;
	}

	public void setD_rimg(String d_rimg) {
		this.d_rimg = d_rimg;
	}

	public Date getD_date() {
		return d_date;
	}

	public void setD_date(Date d_date) {
		this.d_date = d_date;
	}

	public String getI_garbage() {
		return i_garbage;
	}

	public void setI_garbage(String i_garbage) {
		this.i_garbage = i_garbage;
	}

	public String getI_delete() {
		return i_delete;
	}

	public void setI_delete(String i_delete) {
		this.i_delete = i_delete;
	}

	@Override
	public String toString() {
		return "GalleryDTO [m_no=" + m_no + ", d_img=" + d_img + ", d_rimg=" + d_rimg + ", d_date=" + d_date + "]";
	}
	
	

	
}