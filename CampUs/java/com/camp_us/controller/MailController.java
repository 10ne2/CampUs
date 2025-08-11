package com.camp_us.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.camp_us.command.MailRegistCommand;
import com.camp_us.command.PageMaker;
import com.camp_us.dto.MailVO;
import com.camp_us.dto.MemberVO;
import com.camp_us.service.MailService;
import com.josephoconnell.html.HTMLInputFilter;

@Controller
@RequestMapping("/mail")
public class MailController {
	
	@Autowired
	private MailService mailService;
	
	@Autowired
	public MailController(MailService mailService) {
		this.mailService = mailService;
	}
	
	@Resource(name="summernotePath")
	private String summernotePath;
	
	@GetMapping("")
	public String list(@ModelAttribute PageMaker pageMaker, Model model, HttpSession session)throws Exception{
		
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
            return "redirect:/login";
        }
		String memId = loginUser.getMem_id();
		
		List<MailVO> mailList = mailService.list(pageMaker, memId);
		model.addAttribute("mailList",mailList);
		
		int unreadCount = mailService.unreadCount(memId);
        model.addAttribute("unreadCount", unreadCount);
        
		return "/mail";
	}
	
	@GetMapping("/detail")
	public String detail(int mail_id, Model model, HttpSession session) throws Exception{
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
	    if (loginUser == null) {
	        return "redirect:/login";
	    }
	    String memId = loginUser.getMem_id();

	    MailVO mailDetailList = mailService.detail(mail_id);
	    model.addAttribute("mail", mailDetailList);

	    // 목록도 같이 넣기
	    List<MailVO> mailList = mailService.list(new PageMaker(), memId);
	    model.addAttribute("mailList", mailList);

	    // 미확인 메일 개수도 같이 넣기
	    int unreadCount = mailService.unreadCount(memId);
        model.addAttribute("unreadCount", unreadCount);

	    return "/mail";
	}
	
	@GetMapping("/regist")
	public String registForm() {
		String url = "/mail";
		return url;
	}
	
	@PostMapping("/regist")
	public String regist(MailRegistCommand mailRegistCommand) throws Exception{
		String url = "/mail/regist_success";
		
		MailVO mail = mailRegistCommand.toMail();
		mail.setMail_name(HTMLInputFilter.htmlSpecialChars(mail.getMail_name()));
		
		File dir = new File(summernotePath);
		File[] files = dir.listFiles();
		if(files!=null) for(File file : files) {
			if(mail.getMail_desc().contains(file.getName())) {
				file.delete();
			}
		}
		
		mailService.regist(mail);
		
		return url;
	}
	
	
}
