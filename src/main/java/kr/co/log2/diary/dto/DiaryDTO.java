package kr.co.log2.diary.dto;

import java.sql.Date;

public class DiaryDTO {
	private int d_no;		//다이어리 넘버 
	private int m_no;      // 회원 넘버
	   private Date d_date;   //  일 날짜
	   private String d_title;   // 제목
	   private String d_cont;   // 내용
	   private String d_img;   // 이미지 이름
	   private String d_rimg;    // 이미지 랜덤 이름
	   

 
    public DiaryDTO(int d_no, int m_no, Date d_date, String d_title, String d_cont, String d_img, String d_rimg) {
		super();
		this.d_no = d_no;
		this.m_no = m_no;
		this.d_date = d_date;
		this.d_title = d_title;
		this.d_cont = d_cont;
		this.d_img = d_img;
		this.d_rimg = d_rimg;
	}





	public int getD_no() {
		return d_no;
	}

	public void setD_no(int d_no) {
		this.d_no = d_no;
	}

	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public Date getD_date() {
		return d_date;
	}
	
	public void setD_date(Date d_date) {
		this.d_date = d_date;
	}

	public String getD_title() {
		return d_title;
	}

	public void setD_title(String d_title) {
		this.d_title = d_title;
	}

	public String getD_cont() {
		return d_cont;
	}

	public void setD_cont(String d_cont) {
		this.d_cont = d_cont;
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


	public void setDateFromString(String dateString) {
//       SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//            Date date = format.parse(dateString);
        	d_date = Date.valueOf(dateString);
            this.d_date = d_date;
    }

	public DiaryDTO() {
		super();
	}

	@Override
	public String toString() {
		return "DiaryDTO [d_no=" + d_no + ", m_no=" + m_no + ", d_date=" + d_date + ", d_title=" + d_title + ", d_cont="
				+ d_cont + ", d_img=" + d_img + ", d_rimg=" + d_rimg + "]";
	}
}