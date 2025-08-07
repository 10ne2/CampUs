package com.camp_us.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.camp_us.command.PageMaker;
import com.camp_us.dto.MailVO;

public interface MailService {
	
	// 목록 : 검색포함.
	List<MailVO> list(PageMaker pageMaker,String memId) throws SQLException;
		
	// 등록
	void regist(MailVO mail)throws SQLException;
	
	// 삭제
	void remove(String mail_id)throws SQLException;
}
