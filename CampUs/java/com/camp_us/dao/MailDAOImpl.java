package com.camp_us.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.camp_us.command.PageMaker;
import com.camp_us.dto.MailVO;

public class MailDAOImpl implements MailDAO {
	
	private SqlSession session;
	
	public MailDAOImpl(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<MailVO> selectSearchMailList(PageMaker pageMaker,String memId) throws SQLException {
		int offset = pageMaker.getStartRow()-1;
		int limit = pageMaker.getPerPageNum();
		RowBounds bounds = new RowBounds(offset,limit);
		
		Map<String,Object> dataMap = new HashMap<String,Object>();
		dataMap.put("keyword", pageMaker.getKeyword());
		dataMap.put("mem_id", memId);
		
		
		List<MailVO> mailList = session.selectList("Mail-Mapper.selectSearchMailList",dataMap,bounds);
		
		return mailList;
	}

	@Override
	public int selectSearchMailListCount(PageMaker pageMaker,String memId) throws SQLException {
		Map<String,Object> dataMap = new HashMap<String,Object>();
		dataMap.put("keyword", pageMaker.getKeyword());
		dataMap.put("mem_id", memId);
		
		int count = session.selectOne("Mail-Mapper.selectSearchMailListCount",dataMap);
		return count;
	}

	@Override
	public MailVO selectMailByMailId(int mail_id) throws SQLException {
		MailVO mail = session.selectOne("Mail-Mapper.selectMailByMailId",mail_id);
		return mail;
	}

	@Override
	public void insertMail(MailVO mail) throws SQLException {
		session.insert("Mail-Mapper.insertMail",mail);
	}

	@Override
	public void deleteMail(int mail_id) throws SQLException {
		session.delete("Mail-Mapper.insertMail",mail_id);
	}

	@Override
	public int selectUnreadReceiverCount(String mem_id) throws SQLException {
		int count = session.selectOne("Mail-Mapper.selectUnreadReceiverCount", mem_id);
		return count;
	}
	
	
}
