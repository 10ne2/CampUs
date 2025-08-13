package com.camp_us.service;

import java.sql.SQLException;
import java.util.List;

import com.camp_us.command.PageMaker;
import com.camp_us.dto.MailVO;

public interface MailService {
	
	// 목록 : 검색포함.
	List<MailVO> list(PageMaker pageMaker,String memId) throws SQLException;
	// 상세
	MailVO detail(int mail_id)throws SQLException;
		
	// 등록
	void regist(MailVO mail)throws SQLException;
	
	// 삭제
	void remove(int mail_id)throws SQLException;
	
	MailVO getMail(int mail_id) throws SQLException;
	
	//즐겨찾기
	void toggleMailImportant(int mail_id, String mem_id) throws SQLException;
	
	// 보낸 메일 목록
	List<MailVO> listSender(PageMaker pageMaker,String memId) throws SQLException;
	
	// 받은 메일 목록
	List<MailVO> listReceiver(PageMaker pageMaker,String memId) throws SQLException;
	
	// 중요 메일 목록
	List<MailVO> listImp(PageMaker pageMaker,String memId, int mimp_id) throws SQLException;
}