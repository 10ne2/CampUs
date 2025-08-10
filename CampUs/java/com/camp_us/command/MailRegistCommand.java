package com.camp_us.command;

import static org.springframework.test.web.client.match.MockRestRequestMatchers.content;

import com.camp_us.dto.MailVO;

public class MailRegistCommand {
	
	private String receiver_name;
	private String mail_name;
	private String mail_desc;
	
	public String getReceiver_name() {
		return receiver_name;
	}
	public void setReceiver_name(String receiver_name) {
		this.receiver_name = receiver_name;
	}
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
		mail.setReceiver_name(receiver_name);
		
		return mail;
	}
	
}
