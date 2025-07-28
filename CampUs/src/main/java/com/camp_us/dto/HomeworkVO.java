package com.camp_us.dto;

import java.util.Date;

public class HomeworkVO {
	
	private String hw_no;
	private String hw_name;
	private Date hw_startdate = new Date();
	private Date hw_enddate;
	private String hw_desc="";
	private String hwsub_hsno;
	private String hwsub_filename;
	private String hwsub_filedetail;
	private String lecs_id;
	
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
	public String getHwsub_hsno() {
		return hwsub_hsno;
	}
	public void setHwsub_hsno(String hwsub_hsno) {
		this.hwsub_hsno = hwsub_hsno;
	}
	public String getHwsub_filename() {
		return hwsub_filename;
	}
	public void setHwsub_filename(String hwsub_filename) {
		this.hwsub_filename = hwsub_filename;
	}
	public String getHwsub_filedetail() {
		return hwsub_filedetail;
	}
	public void setHwsub_filedetail(String hwsub_filedetail) {
		this.hwsub_filedetail = hwsub_filedetail;
	}
	public String getLecs_id() {
		return lecs_id;
	}
	public void setLecs_id(String lecs_id) {
		this.lecs_id = lecs_id;
	}
	
	
}
