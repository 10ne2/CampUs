package com.camp_us.dao;

import java.sql.SQLException;
import java.util.List;

import com.camp_us.command.PageMaker;
import com.camp_us.dto.MailVO;

public interface MailDAO {
	
	List<MailVO> selectSearchMailList(PageMaker pageMaker,String memId) throws SQLException;
	int selectSearchMailListCount(PageMaker pageMaker,String memId) throws SQLException;
	int selectMailSeqNext()throws SQLException;
	MailVO selectMailByMailId(int mail_id) throws SQLException;

	void insertMail(MailVO mail) throws SQLException;

	void deleteMail(int mail_id) throws SQLException;
	
	MailVO getMail(int mail_id)throws SQLException;
	
	/* 즐겨찾기 */
	
	void insertMailImp(MailVO mail) throws SQLException;
	int selectMailImpSeqNext() throws SQLException;
	void deleteMailImp(int mimp_id) throws SQLException;
	Integer selectMailImpByMailAndMember(int mail_id, String mem_id) throws SQLException;
	
	// 보낸 메일
	List<MailVO> selectSearchMailListBySender(PageMaker pageMaker,String memId) throws SQLException;
	int selectSearchMailListCountBySender(PageMaker pageMaker,String memId) throws SQLException;
	
	// 받은 메일
	List<MailVO> selectSearchMailListByReceiver(PageMaker pageMaker,String memId) throws SQLException;
	int selectSearchMailListCountByReceiver(PageMaker pageMaker,String memId) throws SQLException;
	
	// 중요 메일
	List<MailVO> selectSearchMailListByImp(PageMaker pageMaker,String memId, int mimp_id) throws SQLException;
	int selectSearchMailListCountByImp(PageMaker pageMaker,String memId, int mimp_id) throws SQLException;
}
