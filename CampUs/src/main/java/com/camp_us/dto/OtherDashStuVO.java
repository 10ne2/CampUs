package com.camp_us.dto;

import java.util.Date;

public class OtherDashStuVO {
	private String subjectName;
	private String title;
	private String professorName;
	private Date regDate;
	private String regDateStr;
	private String isNew;
	private String cfTitle;
	private Date cfRegDate;
	private String cfRegDateStr;
	private String cfIsNew;
	private Date classDate;
	private String classDateStr;
	private int attendanceStatus;
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getProfessorName() {
		return professorName;
	}
	public void setProfessorName(String professorName) {
		this.professorName = professorName;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getRegDateStr() {
		return regDateStr;
	}
	public void setRegDateStr(String regDateStr) {
		this.regDateStr = regDateStr;
	}
	public String getIsNew() {
		return isNew;
	}
	public void setIsNew(String isNew) {
		this.isNew = isNew;
	}
	public String getCfTitle() {
		return cfTitle;
	}
	public void setCfTitle(String cfTitle) {
		this.cfTitle = cfTitle;
	}
	public Date getCfRegDate() {
		return cfRegDate;
	}
	public void setCfRegDate(Date cfRegDate) {
		this.cfRegDate = cfRegDate;
	}
	public String getCfRegDateStr() {
		return cfRegDateStr;
	}
	public void setCfRegDateStr(String cfRegDateStr) {
		this.cfRegDateStr = cfRegDateStr;
	}
	public String getCfIsNew() {
		return cfIsNew;
	}
	public void setCfIsNew(String cfIsNew) {
		this.cfIsNew = cfIsNew;
	}
	public Date getClassDate() {
		return classDate;
	}
	public void setClassDate(Date classDate) {
		this.classDate = classDate;
	}
	public String getClassDateStr() {
		return classDateStr;
	}
	public void setClassDateStr(String classDateStr) {
		this.classDateStr = classDateStr;
	}
	public int getAttendanceStatus() {
		return attendanceStatus;
	}
	public void setAttendanceStatus(int attendanceStatus) {
		this.attendanceStatus = attendanceStatus;
	}
	
	
	
}
