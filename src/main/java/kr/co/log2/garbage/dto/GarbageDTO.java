package kr.co.log2.garbage.dto;

import java.sql.Date;

public class GarbageDTO {
	
	int diaryNumber;
	int memberNumber;
	int diaryListNum;
	Date diaryDate;
	String diaryTitle;
	String diaryContent;
	String diaryImg;
	String diaryRandomImg;
	String isGarbage;
	String isDelete;
	
	public int getDiaryNumber() {
		return diaryNumber;
	}
	public void setDiaryNumber(int diaryNumber) {
		this.diaryNumber = diaryNumber;
	}
	public int getMemberNumber() {
		return memberNumber;
	}
	public void setMemberNumber(int memberNumber) {
		this.memberNumber = memberNumber;
	}
	public int getDiaryListNum() {
		return diaryListNum;
	}
	public void setDiaryListNum(int diaryListNum) {
		this.diaryListNum = diaryListNum;
	}
	public Date getDiaryDate() {
		return diaryDate;
	}
	public void setDiaryDate(Date diaryDate) {
		this.diaryDate = diaryDate;
	}
	public String getDiaryTitle() {
		return diaryTitle;
	}
	public void setDiaryTitle(String diaryTitle) {
		this.diaryTitle = diaryTitle;
	}
	public String getDiaryContent() {
		return diaryContent;
	}
	public void setDiaryContent(String diaryContent) {
		this.diaryContent = diaryContent;
	}
	public String getDiaryImg() {
		return diaryImg;
	}
	public void setDiaryImg(String diaryImg) {
		this.diaryImg = diaryImg;
	}
	public String getDiaryRandomImg() {
		return diaryRandomImg;
	}
	public void setDiaryRandomImg(String diaryRandomImg) {
		this.diaryRandomImg = diaryRandomImg;
	}
	public String getIsGarbage() {
		return isGarbage;
	}
	public void setIsGarbage(String isGarbage) {
		this.isGarbage = isGarbage;
	}
	public String getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}
	public GarbageDTO(int memberNumber, int diaryListNum, Date diaryDate, String diaryTitle, String diaryContent,
			String diaryImg, String diaryRandomImg, String isGarbage, String isDelete) {
		this.memberNumber = memberNumber;
		this.diaryListNum = diaryListNum;
		this.diaryDate = diaryDate;
		this.diaryTitle = diaryTitle;
		this.diaryContent = diaryContent;
		this.diaryImg = diaryImg;
		this.diaryRandomImg = diaryRandomImg;
		this.isGarbage = isGarbage;
		this.isDelete = isDelete;
	}
	public GarbageDTO() {
	}
	
	
}
