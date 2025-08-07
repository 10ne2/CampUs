package com.camp_us.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.camp_us.command.PageMaker;
import com.camp_us.dao.MailDAO;
import com.camp_us.dto.MailVO;

public class MailServiceImpl implements MailService{
	
	private MailDAO mailDAO;
	
	public MailServiceImpl(MailDAO mailDAO) {
		this.mailDAO = mailDAO;
	}

	@Override
	public List<MailVO> list(PageMaker pageMaker,String memId) throws SQLException {
		
		List<MailVO> mailList = mailDAO.selectSearchMailList(pageMaker,memId);
		
		int totalCount = mailDAO.selectSearchMailListCount(pageMaker,memId);
		pageMaker.setTotalCount(totalCount);
		
		return mailList;
	}

	@Override
	public void regist(MailVO mail) throws SQLException {
		mailDAO.insertMail(mail);
	}

	@Override
	public void remove(String mail_id) throws SQLException {
		mailDAO.deleteMail(mail_id);
	}
	
	

}
