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
		session.delete("Mail-Mapper.deleteMail",mail_id);
	}
	@Override
	public int selectMailSeqNext() throws SQLException {
		return  session.selectOne("Mail-Mapper.selectMailSeqNext");
	}
	@Override
	public MailVO getMail(int mail_id) throws SQLException {
		return session.selectOne("Mail-Mapper.getMail",mail_id);
	}

	
	//  즐겨찾기
	@Override
	public void insertMailImp(MailVO mail) throws SQLException {
		session.insert("Mail-Mapper.insertMailImp", mail);
	}
	@Override
	public int selectMailImpSeqNext() throws SQLException {
		return  session.selectOne("Mail-Mapper.selectMailImpSeqNext");
	}
	@Override
	public void deleteMailImp(int mimp_id) throws SQLException {
		session.delete("Mail-Mapper.deleteMailImp",mimp_id);
	}
	@Override
	public Integer selectMailImpByMailAndMember(int mail_id, String mem_id) throws SQLException {
		Map<String,Object> dataMap = new HashMap<String,Object>();
		dataMap.put("mail_id", mail_id);
		dataMap.put("mem_id", mem_id);
		
		return session.selectOne("Mail-Mapper.selectMailImpByMailAndMember",dataMap);
	}
	
	// 보낸메일
	@Override
	public List<MailVO> selectSearchMailListBySender(PageMaker pageMaker, String memId) throws SQLException {
		int offset = pageMaker.getStartRow()-1;
		int limit = pageMaker.getPerPageNum();
		RowBounds bounds = new RowBounds(offset,limit);
		
		Map<String,Object> dataMap = new HashMap<String,Object>();
		dataMap.put("keyword", pageMaker.getKeyword());
		dataMap.put("mem_id", memId);
		
		
		List<MailVO> mailList = session.selectList("Mail-Mapper.selectSearchMailListBySender",dataMap,bounds);
		
		return mailList;
	}
	@Override
	public int selectSearchMailListCountBySender(PageMaker pageMaker, String memId) throws SQLException {
		Map<String,Object> dataMap = new HashMap<String,Object>();
		dataMap.put("keyword", pageMaker.getKeyword());
		dataMap.put("mem_id", memId);
		
		int count = session.selectOne("Mail-Mapper.selectSearchMailListCountBySender",dataMap);
		return count;
	}
	
	// 받은 메일
	@Override
	public List<MailVO> selectSearchMailListByReceiver(PageMaker pageMaker, String memId) throws SQLException {
		int offset = pageMaker.getStartRow()-1;
		int limit = pageMaker.getPerPageNum();
		RowBounds bounds = new RowBounds(offset,limit);
		
		Map<String,Object> dataMap = new HashMap<String,Object>();
		dataMap.put("keyword", pageMaker.getKeyword());
		dataMap.put("mem_id", memId);
		
		
		List<MailVO> mailList = session.selectList("Mail-Mapper.selectSearchMailListByReceiver",dataMap,bounds);
		
		return mailList;
	}
	@Override
	public int selectSearchMailListCountByReceiver(PageMaker pageMaker, String memId) throws SQLException {
		Map<String,Object> dataMap = new HashMap<String,Object>();
		dataMap.put("keyword", pageMaker.getKeyword());
		dataMap.put("mem_id", memId);
		
		int count = session.selectOne("Mail-Mapper.selectSearchMailListCountByReceiver",dataMap);
		return count;
	}
	
	// 중요 메일
	@Override
	public List<MailVO> selectSearchMailListByImp(PageMaker pageMaker, String memId) throws SQLException {
		int offset = pageMaker.getStartRow()-1;
		int limit = pageMaker.getPerPageNum();
		RowBounds bounds = new RowBounds(offset,limit);
		
		Map<String,Object> dataMap = new HashMap<String,Object>();
		dataMap.put("keyword", pageMaker.getKeyword());
		dataMap.put("mem_id", memId);
		
		
		List<MailVO> mailList = session.selectList("Mail-Mapper.selectSearchMailListByImp",dataMap,bounds);
		
		return mailList;
	}
	@Override
	public int selectSearchMailListCountByImp(PageMaker pageMaker, String memId) throws SQLException {
		Map<String,Object> dataMap = new HashMap<String,Object>();
		dataMap.put("keyword", pageMaker.getKeyword());
		dataMap.put("mem_id", memId);
		
		int count = session.selectOne("Mail-Mapper.selectSearchMailListCountByImp",dataMap);
		return count;
	}
	
	//  조회
	@Override
	public void insertMailRead(MailVO mail) throws SQLException {
		session.insert("Mail-Mapper.insertMailRead", mail);
	}
	@Override
	public int selectMailReadSeqNext() throws SQLException {
		return  session.selectOne("Mail-Mapper.selectMailReadSeqNext");
	}
	
	//insert
}
