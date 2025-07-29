package com.camp_us.service;

import java.sql.SQLException;
import java.util.List;

import com.camp_us.dao.UnsubmitHomeworkDAO;
import com.camp_us.dto.UnsubmitHomeworkVO;

public class UnsubmitHomeworkServiceImpl implements UnsubmitHomeworkService{
	
	private UnsubmitHomeworkDAO unsubmithomeworkDAO;

	public UnsubmitHomeworkServiceImpl(UnsubmitHomeworkDAO unsubmithomeworkDAO) {
		this.unsubmithomeworkDAO = unsubmithomeworkDAO;
	}

	@Override
	public List<UnsubmitHomeworkVO> getUnsubmitHomeworkList(UnsubmitHomeworkVO unsubmitHomework) throws SQLException {
		return unsubmithomeworkDAO.selectUnsubmitHomework(unsubmitHomework);
	}

}
