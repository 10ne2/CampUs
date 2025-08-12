package com.camp_us.command;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.camp_us.dto.MailVO;

public class MailRegistCommand {
	
	private String mail_receiver;
	private String mail_name;
	private String mail_desc;
	private String mail_sender;
	private List<MultipartFile> uploadFile;
	
	public String getMail_name() {
		return mail_name;
	}
	public void setMail_name(String mail_name) {
		this.mail_name = mail_name;
	}
	public String getMail_desc() {
		return mail_desc;
	}
	public void setMail_desc(String mail_desc) {
		this.mail_desc = mail_desc;
	}
	
	public MailVO toMail() {
		MailVO mail = new MailVO();
		
		mail.setMail_desc(mail_desc);
		mail.setMail_name(mail_name);
		mail.setMail_receiver(mail_receiver);
		mail.setMail_sender(mail_sender);
		
		return mail;
	}
	public String getMail_sender() {
		return mail_sender;
	}
	public void setMail_sender(String mail_sender) {
		this.mail_sender = mail_sender;
	}
	public String getMail_receiver() {
		return mail_receiver;
	}
	public void setMail_receiver(String mail_receiver) {
		this.mail_receiver = mail_receiver;
	}
	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}
	
}
