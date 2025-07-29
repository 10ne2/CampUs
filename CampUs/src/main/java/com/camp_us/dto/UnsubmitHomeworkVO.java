package com.camp_us.dto;

import java.util.Date;

public class UnsubmitHomeworkVO {
	
	private String hw_no; // 과제번호
	private String hw_name; // 과제명
	private Date hw_startdate; // 시작일
	private Date hw_enddate; // 마감일
	private String hw_desc; // 과제 설명
	private int dDay; // d-day
	private String professorName; // 교수명
	private String stu_id; //학생명
	
	public String getHw_no() {
		return hw_no;
	}
	public void setHw_no(String hw_no) {
		this.hw_no = hw_no;
	}
	public String getHw_name() {
		return hw_name;
	}
	public void setHw_name(String hw_name) {
		this.hw_name = hw_name;
	}
	public Date getHw_startdate() {
		return hw_startdate;
	}
	public void setHw_startdate(Date hw_startdate) {
		this.hw_startdate = hw_startdate;
	}
	public Date getHw_enddate() {
		return hw_enddate;
	}
	public void setHw_enddate(Date hw_enddate) {
		this.hw_enddate = hw_enddate;
	}
	public String getHw_desc() {
		return hw_desc;
	}
	public void setHw_desc(String hw_desc) {
		this.hw_desc = hw_desc;
	}
	public int getdDay() {
		return dDay;
	}
	public void setdDay(int dDay) {
		this.dDay = dDay;
	}
	public String getProfessorName() {
		return professorName;
	}
	public void setProfessorName(String professorName) {
		this.professorName = professorName;
	}
	public String getStu_id() {
		return stu_id;
	}
	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}
	
}
