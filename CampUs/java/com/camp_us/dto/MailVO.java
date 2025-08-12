package com.camp_us.dto;

import java.util.Date;
import java.util.List;

public class MailVO {
	private int mail_id;
	private String mail_name;        // 메일 제목
	private Date mail_sdate;         // 발송 날짜
	private Date mail_rdate;         // 수신 날짜
	private int mail_read;        // 읽음 여부
	private int mail_important;   // 중요 여부
	private String mail_desc;
	
	private String mail_sender;      // 보낸 사람 ID
	private String sender_name;      // 보낸 사람 이름
	private String sender_email;     // 보낸 사람 이메일

	private String mail_receiver;    // 받는 사람 ID
	private String receiver_name;    // 받는 사람 이름
	private String receiver_email;   // 받는 사람 이메일
	
	private String loginUser;
	private String mem_id;
	
	private List<MailFileVO> mailFileList;

	public List<MailFileVO> getMailFileList() {
		return mailFileList;
	}

	public void setMailFileList(List<MailFileVO> mailFileList) {
		this.mailFileList = mailFileList;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}


	public int getMail_id() {
		return mail_id;
	}

	public void setMail_id(int mail_id) {
		this.mail_id = mail_id;
	}

	public String getMail_name() {
		return mail_name;
	}

	public void setMail_name(String mail_name) {
		this.mail_name = mail_name;
	}

	public Date getMail_sdate() {
		return mail_sdate;
	}

	public void setMail_sdate(Date mail_sdate) {
		this.mail_sdate = mail_sdate;
	}

	public Date getMail_rdate() {
		return mail_rdate;
	}

	public void setMail_rdate(Date mail_rdate) {
		this.mail_rdate = mail_rdate;
	}

	public int getMail_read() {
		return mail_read;
	}

	public void setMail_read(int mail_read) {
		this.mail_read = mail_read;
	}

	public int getMail_important() {
		return mail_important;
	}

	public void setMail_important(int mail_important) {
		this.mail_important = mail_important;
	}

	public String getMail_desc() {
		return mail_desc;
	}

	public void setMail_desc(String mail_desc) {
		this.mail_desc = mail_desc;
	}

	public String getMail_sender() {
		return mail_sender;
	}

	public void setMail_sender(String mail_sender) {
		this.mail_sender = mail_sender;
	}

	public String getSender_name() {
		return sender_name;
	}

	public void setSender_name(String sender_name) {
		this.sender_name = sender_name;
	}

	public String getSender_email() {
		return sender_email;
	}

	public void setSender_email(String sender_email) {
		this.sender_email = sender_email;
	}

	public String getMail_receiver() {
		return mail_receiver;
	}

	public void setMail_receiver(String mail_receiver) {
		this.mail_receiver = mail_receiver;
	}

	public String getReceiver_name() {
		return receiver_name;
	}

	public void setReceiver_name(String receiver_name) {
		this.receiver_name = receiver_name;
	}

	public String getReceiver_email() {
		return receiver_email;
	}

	public void setReceiver_email(String receiver_email) {
		this.receiver_email = receiver_email;
	}

	public String getLoginUser() {
		return loginUser;
	}

	public void setLoginUser(String loginUser) {
		this.loginUser = loginUser;
	}

	
	
}
