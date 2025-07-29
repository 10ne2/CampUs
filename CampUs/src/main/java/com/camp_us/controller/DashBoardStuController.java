package com.camp_us.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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
	public String main(HttpSession session, Model model) throws Exception {
		String stu_id = "S20170102";
		List<UnsubmitHomeworkVO> unsubmithwList = unsubmitHomeworkService.getUnsubmitHomeworkList(stu_id);
		/*(String) session.getAttribute("stu_id")*/
		
		/*
		 * if(stu_id == null) { return "redirect:/login"; }
		 */
		
		model.addAttribute("unsubmitList", unsubmithwList);
		
		return "dashboardstu/main";
	}
	
}
