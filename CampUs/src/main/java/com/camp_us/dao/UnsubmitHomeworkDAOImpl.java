package com.camp_us.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.camp_us.dto.UnsubmitHomeworkVO;

public class UnsubmitHomeworkDAOImpl implements UnsubmitHomeworkDAO {
	
	private SqlSession session;	
	public UnsubmitHomeworkDAOImpl (SqlSession session) {
		this.session = session;
	}

	@Override
	public List<UnsubmitHomeworkVO> selectUnsubmitHomework(UnsubmitHomeworkVO unsubmitHomework) throws SQLException {
		return session.selectList("UnsubmitHomework-Mapper.selectUnsubmitHomework", unsubmitHomework);
	}

}
