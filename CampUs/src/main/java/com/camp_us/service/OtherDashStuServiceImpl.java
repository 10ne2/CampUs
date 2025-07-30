package com.camp_us.service;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;

import com.camp_us.dao.OtherDashStuDAO;
import com.camp_us.dto.OtherDashStuVO;

public class OtherDashStuServiceImpl implements OtherDashStuService{
	
	private OtherDashStuDAO otherDashStuDAO;

	public OtherDashStuServiceImpl(OtherDashStuDAO otherDashStuDAO) {
		this.otherDashStuDAO = otherDashStuDAO;
	}

	@Override
	public List<OtherDashStuVO> getNoticeList(String stu_id) throws SQLException {
		List<OtherDashStuVO> list = otherDashStuDAO.selectNoticeList(stu_id);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		for (OtherDashStuVO vo : list) {
	        if (vo.getCfRegDate() != null) {
	            // Date → String 변환
	            String formattedDate = sdf.format(vo.getCfRegDate());
	            vo.setRegDateStr(formattedDate); // cfRegDateStr: String 타입 필드 추가
	        }
	    }
		
		return list;
	}

	@Override
	public List<OtherDashStuVO> getFileList(String stu_id) throws SQLException {
		return otherDashStuDAO.selectFileList(stu_id);
	}

	@Override
	public List<OtherDashStuVO> getAttendenceList(String stu_id) throws SQLException {
		return otherDashStuDAO.selectAttendenceList(stu_id);
	}

}
