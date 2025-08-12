package com.camp_us.service;

import java.io.File;
import java.sql.SQLException;
import java.util.List;

import com.camp_us.command.PageMaker;
import com.camp_us.dao.MailDAO;
import com.camp_us.dao.MailFileDAO;
import com.camp_us.dto.MailFileVO;
import com.camp_us.dto.MailVO;

public class MailServiceImpl implements MailService{
	
	private MailDAO mailDAO;
	private String summernotePath;
	private MailFileDAO mailFileDAO;
	
	public MailServiceImpl(MailDAO mailDAO, String summernotePath, MailFileDAO mailFileDAO) {
		this.mailDAO = mailDAO;
		this.summernotePath = summernotePath;
		this.mailFileDAO = mailFileDAO;
	}

	@Override
	public List<MailVO> list(PageMaker pageMaker,String memId) throws SQLException {
		List<MailVO> mailList = mailDAO.selectSearchMailList(pageMaker,memId);
		
		if(mailList != null) for(MailVO mail : mailList) {
			int mail_id = mail.getMail_id();
			
						
			List<MailFileVO> mailFileList = mailFileDAO.selectMailFileByMailId(mail.getMail_id());
			mail.setMailFileList(mailFileList);
		}
		
		int totalCount = mailDAO.selectSearchMailListCount(pageMaker,memId);
		pageMaker.setTotalCount(totalCount);
		
		return mailList;
	}
	
	@Override
	public MailVO detail(int mail_id) throws SQLException {
		mailDAO.selectMailByMailId(mail_id);
		MailVO mail = mailDAO.selectMailByMailId(mail_id);
		
		List<MailFileVO> mailFileList = mailFileDAO.selectMailFileByMailId(mail_id);
		mail.setMailFileList(mailFileList);
		
		
		return mail;
	}

	@Override
	public void regist(MailVO mail) throws SQLException {
		
		int mail_id = mailDAO.selectMailSeqNext();
		mail.setMail_id(mail_id);
		mailDAO.insertMail(mail);
		
		List<MailFileVO> mailFileList = mail.getMailFileList();
		if(mailFileList != null) for(MailFileVO mailFile : mailFileList) {
			int mafile_no = mailFileDAO.selectMailFileSeqNext();
			mailFile.setMafile_no(mafile_no);
			mailFile.setMail_id(mail.getMail_id());
			
			mailFileDAO.insertMailFile(mailFile);
		}
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
		mailFileDAO.deleteAllMailFile(mail_id);
		mailDAO.deleteMail(mail_id);
	}
	
	

	@Override
	public MailVO getMail(int mail_id) throws SQLException {
		MailVO mail = mailDAO.getMail(mail_id);
		
		List<MailFileVO> mailFileList = mailFileDAO.selectMailFileByMailId(mail_id);
		mail.setMailFileList(mailFileList);
		
		return mail;
	}
	

}
