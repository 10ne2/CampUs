package com.camp_us.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("")
public class AdminLTEController {

	@GetMapping("/student")
	public void starter() {}
	@GetMapping("/mypage")
	public ModelAndView mypage(ModelAndView mnv) throws Exception {
		String url="/mypage";
		mnv.setViewName(url);
		return mnv;
	}
	@GetMapping("/adminmenu")
		public void adminmenu() {}
	@GetMapping("/empmenu")
		public void empmenu() {}
}