package com.camp_us.dao;

import java.sql.SQLException;
import java.util.List;

import com.camp_us.command.PageMaker;
import com.camp_us.dto.MailVO;

public interface MailDAO {
	
	List<MailVO> selectSearchMailList(PageMaker pageMaker,String memId) throws SQLException;

	int selectSearchMailListCount(PageMaker pageMaker,String memId) throws SQLException;

	MailVO selectMailByMailId(String mail_id) throws SQLException;

	void insertMail(MailVO mail) throws SQLException;

	void deleteMail(String mail_id) throws SQLException;
}
