package kr.co.log2.calendar.dto;


public class CalendarDTO {
	@Override
	public String toString() {
		return "CalendarDTO [id=" + id + ", str_time=" + str_time + ", end_time=" + end_time + ", allday_chk="
				+ allday_chk + ", event_description=" + event_description + "]";
	}


	private int id;
	private String str_time;
	private String end_time;
	private int allday_chk;
	private String event_description;
	
	
	public CalendarDTO() {
		
	}
	
	public CalendarDTO(int id, String str_time, String end_time, int allday_chk, String event_description) {
		super();
		this.id = id;
		this.str_time = str_time;
		this.end_time = end_time;
		this.allday_chk = allday_chk;
		this.event_description = event_description;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getStr_time() {
		return str_time;
	}


	public void setStr_time(String str_time) {
		this.str_time = str_time;
	}


	public String getEnd_time() {
		return end_time;
	}


	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}


	public int getAllday_chk() {
		return allday_chk;
	}


	public void setAllday_chk(int allday_chk) {
		this.allday_chk = allday_chk;
	}


	public String getEvent_description() {
		return event_description;
	}


	public void setEvent_description(String event_description) {
		this.event_description = event_description;
	}
	
	
	
}