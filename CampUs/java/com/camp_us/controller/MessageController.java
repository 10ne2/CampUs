package com.camp_us.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.camp_us.command.PageMaker;
import com.camp_us.dto.MemberVO;
import com.camp_us.dto.MessageVO;
import com.camp_us.service.MessageService;

@Controller
@RequestMapping("/message")
public class MessageController {
	
	@Autowired
	private MessageService messageService;
	
	@Autowired
	public MessageController(MessageService messageService) {
		this.messageService = messageService;
	}
	
	
	@GetMapping("/main")
	public String dashList(HttpSession session, Model model) throws Exception{
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/login";
        }
        String mem_id = loginUser.getMem_id();
        
        List<MessageVO> receiveList = messageService.receiveList(mem_id);
        model.addAttribute("receiveList", receiveList);
        
        List<MessageVO> sendList = messageService.sendList(mem_id);
        model.addAttribute("sendList", sendList);
         
        List<MessageVO> wasteList = messageService.wasteList(mem_id);
        model.addAttribute("wasteList", wasteList);
        
        int unreadCount = messageService.unreadCount(mem_id);
        String displayCount = unreadCount >= 1000 ? "999+" : String.valueOf(unreadCount);
        model.addAttribute("unreadCount",displayCount);
        
        return "/message/main";
	}
	
	//받은메일
	@GetMapping("/receive")
	public String receiveList(@ModelAttribute PageMaker pageMaker, HttpSession session, Model model) throws Exception{
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/login";
        }
        String mem_id = loginUser.getMem_id();
        
        List<MessageVO> receiveMailList = messageService.receiveMailList(pageMaker, mem_id);
        model.addAttribute("receiveMailList", receiveMailList);
        
        int unreadCount = messageService.unreadCount(mem_id);
        String displayCount = unreadCount >= 1000 ? "999+" : String.valueOf(unreadCount);
        model.addAttribute("unreadCount",displayCount);
        
        
		return "/message/receive";
	}
	
	@GetMapping("/receive/imp")
	public String receiveImpList(@ModelAttribute PageMaker pageMaker, HttpSession session, Model model) throws Exception{
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/login";
        }
        String mem_id = loginUser.getMem_id();
        
        List<MessageVO> receiveImpList = messageService.receiveImpList(pageMaker, mem_id);
        model.addAttribute("receiveMailList", receiveImpList);
        model.addAttribute("selectedFilter", "imp");
        
        int unreadCount = messageService.unreadCount(mem_id);
        String displayCount = unreadCount >= 1000 ? "999+" : String.valueOf(unreadCount);
        model.addAttribute("unreadCount",displayCount);
        
		return "/message/receive";
	}
	
	@GetMapping("/receive/read")
	public String receiveReadList(@ModelAttribute PageMaker pageMaker, HttpSession session, Model model) throws Exception{
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/login";
        }
        String mem_id = loginUser.getMem_id();
        
        List<MessageVO> receiveReadList = messageService.receiveReadList(pageMaker, mem_id);
        model.addAttribute("receiveMailList", receiveReadList);
        model.addAttribute("selectedFilter", "read");
        
        int unreadCount = messageService.unreadCount(mem_id);
        String displayCount = unreadCount >= 1000 ? "999+" : String.valueOf(unreadCount);
        model.addAttribute("unreadCount",displayCount);
        
		return "/message/receive";
	}
	
	@GetMapping("/receive/lock")
	public String receiveLockList(@ModelAttribute PageMaker pageMaker, HttpSession session, Model model) throws Exception{
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/login";
        }
        String mem_id = loginUser.getMem_id();
        
        List<MessageVO> receiveLockList = messageService.receiveLockList(pageMaker, mem_id);
        model.addAttribute("receiveMailList", receiveLockList);
        model.addAttribute("selectedFilter", "lock");
        
        int unreadCount = messageService.unreadCount(mem_id);
        String displayCount = unreadCount >= 1000 ? "999+" : String.valueOf(unreadCount);
        model.addAttribute("unreadCount",displayCount);
        
		return "/message/receive";
	}
	
	//보낸메일
	@GetMapping("/send")
	public String sendList(@ModelAttribute PageMaker pageMaker, HttpSession session, Model model) throws Exception{
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/login";
        }
        String mem_id = loginUser.getMem_id();
        
        List<MessageVO> sendMailList = messageService.sendMailList(pageMaker, mem_id);
        model.addAttribute("sendMailList", sendMailList);
        
        int unreadCount = messageService.unreadCount(mem_id);
        String displayCount = unreadCount >= 1000 ? "999+" : String.valueOf(unreadCount);
        model.addAttribute("unreadCount",displayCount);
        
        
		return "/message/send";
	}
	
	@GetMapping("/send/imp")
	public String sendImpList(@ModelAttribute PageMaker pageMaker, HttpSession session, Model model) throws Exception{
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/login";
        }
        String mem_id = loginUser.getMem_id();
        
        List<MessageVO> sendImpList = messageService.sendImpList(pageMaker, mem_id);
        model.addAttribute("sendMailList", sendImpList);
        model.addAttribute("selectedFilter", "imp");
        
        int unreadCount = messageService.unreadCount(mem_id);
        String displayCount = unreadCount >= 1000 ? "999+" : String.valueOf(unreadCount);
        model.addAttribute("unreadCount",displayCount);
        
		return "/message/send";
	}
	
	@GetMapping("/send/lock")
	public String sendLockList(@ModelAttribute PageMaker pageMaker, HttpSession session, Model model) throws Exception{
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/login";
        }
        String mem_id = loginUser.getMem_id();
        
        List<MessageVO> sendLockList = messageService.sendLockList(pageMaker, mem_id);
        model.addAttribute("sendMailList", sendLockList);
        model.addAttribute("selectedFilter", "lock");
        
        int unreadCount = messageService.unreadCount(mem_id);
        String displayCount = unreadCount >= 1000 ? "999+" : String.valueOf(unreadCount);
        model.addAttribute("unreadCount",displayCount);
        
		return "/message/send";
	}
	
	
	//휴지통
	@GetMapping("/waste")
	public String wasteList(@ModelAttribute PageMaker pageMaker, HttpSession session, Model model) throws Exception {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/login";
        }
        String mem_id = loginUser.getMem_id();
        
        List<MessageVO> wasteList = messageService.wasteList(pageMaker, mem_id);
        model.addAttribute("wasteList", wasteList);
        
        int unreadCount = messageService.unreadCount(mem_id);
        String displayCount = unreadCount >= 1000 ? "999+" : String.valueOf(unreadCount);
        model.addAttribute("unreadCount",displayCount);
		
		return "/message/waste";
	}
		
	//세부내용
	@GetMapping("/detail")
	public String detail(int mail_id, HttpSession session, Model model) throws Exception {
		
		ServletContext ctx = session.getServletContext();
		
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		String key = "mail:"+member.getMem_id()+mail_id;
		
		if(ctx.getAttribute(key)!=null) {
			model.addAttribute("mail",messageService.getMail(mail_id));
		}else {
			ctx.setAttribute(key, key);
			model.addAttribute("mail",messageService.detail(mail_id));
		}
		
		return "/message/detail";
	}

}
