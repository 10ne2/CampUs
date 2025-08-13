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
		
		/* mailID증가 */
		int mail_id = mailDAO.selectMailSeqNext();
		mail.setMail_id(mail_id);
		mailDAO.insertMail(mail);
		
		/* 즐겨찾기 아이디 증가 
		int mimp_id = mailDAO.selectMailImpSeqNext();
		mail.setMimp_id(mimp_id);
		mailDAO.insertMailImp(mail);*/
		
		/* 첨부파일 */
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

	
	// 즐겨찾기
	@Override
	public void toggleMailImportant(int mail_id, String mem_id) throws SQLException {
		Integer mimp_id = mailDAO.selectMailImpByMailAndMember(mail_id, mem_id);
		
		if (mimp_id != null) {
            // 이미 즐겨찾기 → 해제
            mailDAO.deleteMailImp(mimp_id);
        } else {
            // 미등록 → 추가
            int newMimpId = mailDAO.selectMailImpSeqNext();
            MailVO imp = new MailVO();
            imp.setMimp_id(newMimpId);
            imp.setMail_id(mail_id);
            imp.setMem_id(mem_id);
            mailDAO.insertMailImp(imp);
        }
	}
	
	// 조회
	@Override
	public void insertMailRead(MailVO mail) throws SQLException {
		/* mread id증가 */
	    int mread_id = mailDAO.selectMailReadSeqNext();
	    mail.setMread_id(mread_id);
	    mailDAO.insertMailRead(mail);
	}
	
	
	// 받은 메일
	@Override
	public List<MailVO> listSender(PageMaker pageMaker, String memId) throws SQLException {
		List<MailVO> mailList = mailDAO.selectSearchMailListBySender(pageMaker,memId);
		
		if(mailList != null) for(MailVO mail : mailList) {
			int mail_id = mail.getMail_id();
			
						
			List<MailFileVO> mailFileList = mailFileDAO.selectMailFileByMailId(mail.getMail_id());
			mail.setMailFileList(mailFileList);
		}
		
		int totalCount = mailDAO.selectSearchMailListCountBySender(pageMaker,memId);
		pageMaker.setTotalCount(totalCount);
		
		return mailList;
	}
	
	// 받은 메일
		@Override
		public List<MailVO> listReceiver(PageMaker pageMaker, String memId) throws SQLException {
			List<MailVO> mailList = mailDAO.selectSearchMailListByReceiver(pageMaker,memId);
			
			if(mailList != null) for(MailVO mail : mailList) {
				int mail_id = mail.getMail_id();
				
							
				List<MailFileVO> mailFileList = mailFileDAO.selectMailFileByMailId(mail.getMail_id());
				mail.setMailFileList(mailFileList);
			}
			
			int totalCount = mailDAO.selectSearchMailListCountByReceiver(pageMaker,memId);
			pageMaker.setTotalCount(totalCount);
			
			return mailList;
		}
		
	// 중요 메일
		@Override
		public List<MailVO> listImp(PageMaker pageMaker, String memId) throws SQLException {
			List<MailVO> mailList = mailDAO.selectSearchMailListByImp(pageMaker,memId);
			
			if(mailList != null) for(MailVO mail : mailList) {
				int mail_id = mail.getMail_id();
				
							
				List<MailFileVO> mailFileList = mailFileDAO.selectMailFileByMailId(mail.getMail_id());
				mail.setMailFileList(mailFileList);
			}
			
			int totalCount = mailDAO.selectSearchMailListCountByImp(pageMaker,memId);
			pageMaker.setTotalCount(totalCount);
			
			return mailList;
		}

}
