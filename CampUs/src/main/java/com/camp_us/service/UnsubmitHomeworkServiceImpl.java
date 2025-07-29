package com.camp_us.service;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.camp_us.dao.UnsubmitHomeworkDAO;
import com.camp_us.dto.UnsubmitHomeworkVO;

public class UnsubmitHomeworkServiceImpl implements UnsubmitHomeworkService{
	
	private UnsubmitHomeworkDAO unsubmithomeworkDAO;

	public UnsubmitHomeworkServiceImpl(UnsubmitHomeworkDAO unsubmithomeworkDAO) {
		this.unsubmithomeworkDAO = unsubmithomeworkDAO;
	}

	@Override
	public List<UnsubmitHomeworkVO> getUnsubmitHomeworkList(String stu_id) throws SQLException {
		List<UnsubmitHomeworkVO> list = unsubmithomeworkDAO.selectUnsubmitHomework(stu_id);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		for(UnsubmitHomeworkVO hw : list) {
			Date endDate = hw.getHw_enddate();
			if(endDate != null) {
				hw.setHw_enddateStr(sdf.format(endDate));
			}
		}
		
		return list;
	}
	

}
