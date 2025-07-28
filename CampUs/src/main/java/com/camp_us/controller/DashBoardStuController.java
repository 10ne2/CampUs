package com.camp_us.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/dashboardstu")
public class DashBoardStuController {
	
	@GetMapping("/main")
	public void main() {}
	
	/*
	 * @GetMapping("/homework") public String showHomeworkList(Model model) {
	 * List<Homework> homeworkList = homeworkService.getAllHomework();
	 * model.addAttribute("homeworkList", homeworkList); return "homework"; //
	 * homework.jsp로 이동 }
	 */

}
