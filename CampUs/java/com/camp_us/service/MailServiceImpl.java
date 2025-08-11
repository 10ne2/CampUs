package com.camp_us.service;

import java.io.File;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.camp_us.command.PageMaker;
import com.camp_us.dao.MailDAO;
import com.camp_us.dto.MailVO;

public class MailServiceImpl implements MailService{
	
	private MailDAO mailDAO;
	private String summernotePath;
	
	public MailServiceImpl(MailDAO mailDAO, String summernotePath) {
		this.mailDAO = mailDAO;
		this.summernotePath = summernotePath;
	}

	@Override
	public List<MailVO> list(PageMaker pageMaker,String memId) throws SQLException {
		
		List<MailVO> mailList = mailDAO.selectSearchMailList(pageMaker,memId);
		
		int totalCount = mailDAO.selectSearchMailListCount(pageMaker,memId);
		pageMaker.setTotalCount(totalCount);
		
		return mailList;
	}
	
	@Override
	public MailVO detail(int mail_id) throws SQLException {
		return mailDAO.selectMailByMailId(mail_id);
	}

	@Override
	public void regist(MailVO mail) throws SQLException {
		mailDAO.insertMail(mail);
	}

	@Override
	public void remove(int mail_id) throws SQLException {
		
		MailVO mail = mailDAO.selectMailByMailId(mail_id);
		
		File dir = new File(summernotePath);
		File[] files = dir.listFiles();
		if(files!=null) for(File file : files) {
			if(mail.getMail_desc().contains(file.getName())) {
				file.delete();
			}
		}
		
		mailDAO.deleteMail(mail_id);
	}

	@Override
	public int unreadCount(String mem_id) throws SQLException {
		int unreadCount = mailDAO.selectUnreadReceiverCount(mem_id);
		return unreadCount;
	}
	
	

}
