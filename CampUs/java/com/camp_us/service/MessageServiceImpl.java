package com.camp_us.service;

import java.sql.SQLException;
import java.util.List;

import com.camp_us.command.PageMaker;
import com.camp_us.dao.MessageDAO;
import com.camp_us.dto.MessageVO;

public class MessageServiceImpl implements MessageService{
	
	private MessageDAO messageDAO;
	
	public MessageServiceImpl(MessageDAO messageDAO) {
		this.messageDAO = messageDAO;
	}
	
	//카운트
	@Override
	public int unreadCount(String mem_id) throws SQLException{
		int count = messageDAO.selectReceiveUnreadMailCount(mem_id);
		return count;
	}

	// 대시보드
	@Override
	public List<MessageVO> receiveList(String mem_id) throws SQLException {
		List<MessageVO> mailList = messageDAO.selectReceiveMailByMemId(mem_id);
		return mailList;
	}
	
	@Override
	public List<MessageVO> sendList(String mem_id) throws SQLException {
		List<MessageVO> mailList = messageDAO.selectSenderMailByMemId(mem_id);
		return mailList;
	}
	
	@Override
	public List<MessageVO> wasteList(String mem_id) throws SQLException {
		List<MessageVO> mailList = messageDAO.selectAllWasteMail(mem_id);
		return mailList;
	}
	
	
	// 받은메일함
	@Override
	public List<MessageVO> receiveMailList(PageMaker pageMaker, String mem_id) throws SQLException {
		List<MessageVO> mailList = messageDAO.selectSearchReceiveMailList(pageMaker, mem_id);
		
		int totalCount = messageDAO.selectSearchReceiveMailListCount(pageMaker,mem_id);
		pageMaker.setTotalCount(totalCount);
		return mailList;
	}

	@Override
	public List<MessageVO> receiveImpList(PageMaker pageMaker, String mem_id) throws SQLException {
		List<MessageVO> mailList = messageDAO.selectSearchReceiveImpMailList(pageMaker, mem_id);
		
		int totalCount = messageDAO.selectSearchReceiveImpMailListCount(pageMaker,mem_id);
		pageMaker.setTotalCount(totalCount);
		return mailList;
	}
	
	@Override
	public List<MessageVO> receiveReadList(PageMaker pageMaker, String mem_id) throws SQLException {
		List<MessageVO> mailList = messageDAO.selectSearchReceiveReadMailList(pageMaker, mem_id);
		
		int totalCount = messageDAO.selectSearchReceiveReadMailListCount(pageMaker,mem_id);
		pageMaker.setTotalCount(totalCount);
		return mailList;
	}
	
	@Override
	public List<MessageVO> receiveLockList(PageMaker pageMaker, String mem_id) throws SQLException {
		List<MessageVO> mailList = messageDAO.selectSearchReceiveLockMailList(pageMaker, mem_id);
		
		int totalCount = messageDAO.selectSearchReceiveLockMailListCount(pageMaker,mem_id);
		pageMaker.setTotalCount(totalCount);
		return mailList;
	}
	
	// 보낸메일함
		@Override
		public List<MessageVO> sendMailList(PageMaker pageMaker, String mem_id) throws SQLException {
			List<MessageVO> mailList = messageDAO.selectSearchSendMailList(pageMaker, mem_id);
			
			int totalCount = messageDAO.selectSearchSendMailListCount(pageMaker,mem_id);
			pageMaker.setTotalCount(totalCount);
			return mailList;
		}

		@Override
		public List<MessageVO> sendImpList(PageMaker pageMaker, String mem_id) throws SQLException {
			List<MessageVO> mailList = messageDAO.selectSearchSendImpMailList(pageMaker, mem_id);
			
			int totalCount = messageDAO.selectSearchSendImpMailListCount(pageMaker,mem_id);
			pageMaker.setTotalCount(totalCount);
			return mailList;
		}
		
		@Override
		public List<MessageVO> sendReadList(PageMaker pageMaker, String mem_id) throws SQLException {
			List<MessageVO> mailList = messageDAO.selectSearchSendReadMailList(pageMaker, mem_id);
			
			int totalCount = messageDAO.selectSearchSendReadMailListCount(pageMaker,mem_id);
			pageMaker.setTotalCount(totalCount);
			return mailList;
		}
		
		@Override
		public List<MessageVO> sendLockList(PageMaker pageMaker, String mem_id) throws SQLException {
			List<MessageVO> mailList = messageDAO.selectSearchSendLockMailList(pageMaker, mem_id);
			
			int totalCount = messageDAO.selectSearchSendLockMailListCount(pageMaker,mem_id);
			pageMaker.setTotalCount(totalCount);
			return mailList;
		}



}
