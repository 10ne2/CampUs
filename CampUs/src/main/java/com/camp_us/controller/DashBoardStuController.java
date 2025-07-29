package com.camp_us.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.camp_us.dto.UnsubmitHomeworkVO;
import com.camp_us.service.UnsubmitHomeworkService;

@Controller
@RequestMapping("student/dashboard")
public class DashBoardStuController {
	
	@Autowired
	private UnsubmitHomeworkService unsubmitHomeworkService;
	
	@GetMapping("/main")
	public void main(/* HttpSession session, */String stu_id, Model model) throws Exception {
		List<UnsubmitHomeworkVO> unsubmithwList = unsubmitHomeworkService.getUnsubmitHomeworkList(stu_id);
		/* String stu_id = "S20170102" */
		/*(String) session.getAttribute("stu_id")*/;
		
		/*
		 * if(stu_id == null) { return "redirect:/login"; }
		 */
		
		model.addAttribute("unsubmitList", unsubmithwList);
	}
	
}
