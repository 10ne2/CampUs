package com.camp_us.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.camp_us.command.PageMaker;
import com.camp_us.dto.MailVO;
import com.camp_us.dto.MemberVO;
import com.camp_us.service.MailService;

@Controller
@RequestMapping("/mail")
public class MailController {
	
	private MailService mailService;
	
	@Autowired
	public MailController(MailService mailService) {
		this.mailService = mailService;
	}
	
	@GetMapping("")
	public String list(@ModelAttribute PageMaker pageMaker, Model model, HttpSession session)throws Exception{
		
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String memId = loginUser.getMem_id();
		
		List<MailVO> mailList = mailService.list(pageMaker, memId);
		model.addAttribute("mailList",mailList);
		
		int unreadCount = 0;
        for (MailVO mail : mailList) {
            if (loginUser.getMem_id().equals(mail.getMail_receiver()) && Integer.parseInt(mail.getMail_read()) == 0) {
                unreadCount++;
            }
        }
        model.addAttribute("unreadCount", unreadCount);
	        
		return "/mail";
	}
	
	@GetMapping("/{mailId}")
	public String detail(Model model, HttpSession session) throws Exception{
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String memId = loginUser.getMem_id();
		
		MailVO mailDetail = mailService.detail(memId);
		model.addAttribute("md", mailDetail);
		
		return "/mail";
	}
	
	
}
