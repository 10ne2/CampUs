package com.camp_us.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.camp_us.command.MailRegistCommand;
import com.camp_us.command.PageMaker;
import com.camp_us.dao.MailDAO;
import com.camp_us.dto.MailFileVO;
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
	private MailDAO mailDAO;
	
	@Autowired
	public MailController(MailService mailService) {
		this.mailService = mailService;
	}
	
	@Resource(name="summernotePath")
	private String summernotePath;
	
	@GetMapping("/list")
	public String list(@ModelAttribute PageMaker pageMaker, Model model, HttpSession session)throws Exception{
		if(mailService == null) {
			throw new RuntimeException("mailService가 주입되지 않았습니다!");
		}
		
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
            return "redirect:/login";
        }
		String memId = loginUser.getMem_id();
		
		List<MailVO> mailList = mailService.list(pageMaker, memId);
		
		model.addAttribute("mailList",mailList);
		return "/mail";
	}
	
	// 보낸메일
	@GetMapping("/list2")
	public String listSender(@ModelAttribute PageMaker pageMaker, Model model, HttpSession session)throws Exception{
		if(mailService == null) {
			throw new RuntimeException("mailService가 주입되지 않았습니다!");
		}
		
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if (loginUser == null) {
            return "redirect:/login";
        }
		String memId = loginUser.getMem_id();
		
		List<MailVO> mailList = mailService.listSender(pageMaker, memId);
		
		model.addAttribute("mailList",mailList);
		return "/mail";
	}
	
	// 받은메일
		@GetMapping("/list3")
		public String listReceiver(@ModelAttribute PageMaker pageMaker, Model model, HttpSession session)throws Exception{
			if(mailService == null) {
				throw new RuntimeException("mailService가 주입되지 않았습니다!");
			}
			
			MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
			if (loginUser == null) {
	            return "redirect:/login";
	        }
			String memId = loginUser.getMem_id();
			
			List<MailVO> mailList = mailService.listReceiver(pageMaker, memId);
			
			model.addAttribute("mailList",mailList);
			return "/mail";
		}
	
	// 중요 메일
		@GetMapping("/list4")
		public String listImp(@ModelAttribute PageMaker pageMaker, Model model, HttpSession session)throws Exception{
			if(mailService == null) {
				throw new RuntimeException("mailService가 주입되지 않았습니다!");
			}
			
			MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
			if (loginUser == null) {
	            return "redirect:/login";
	        }
			String memId = loginUser.getMem_id();
			
			List<MailVO> mailList = mailService.listImp(pageMaker, memId);
			
			model.addAttribute("mailList",mailList);
			return "/mail";
		}
	
	
	@GetMapping("/detail")
	public String detail(int mail_id, Model model, HttpSession session, int  mimp_id) throws Exception{
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
	    return "/mail";
	}
	
	@GetMapping("/regist")
	public String registForm() {
		String url = "/mail";
		return url;
	}
	
	@PostMapping(value = "/regist", produces = "text/plain;charset=utf-8")
	public String regist(MailRegistCommand mailRegistCommand) throws Exception{
		String url = "/mail/regist_success";
		
		/* 파일 */
		List<MultipartFile> uploadFiles = mailRegistCommand.getUploadFile();
		String uploadPath = fileUploadPath;
		
		List<MailFileVO> mailFiles = saveFileToMailFiles(uploadFiles, uploadPath);
		
		// db 메일 생성
		MailVO mail = mailRegistCommand.toMail();
		mail.setMail_name(HTMLInputFilter.htmlSpecialChars(mail.getMail_name()));
		mail.setMailFileList(mailFiles);
		
		// 써머노트 임시파일
		File dir = new File(summernotePath);
		File[] files = dir.listFiles();
		if(files!=null) for(File file : files) {
			if(mail.getMail_desc().contains(file.getName())) {
				file.delete();
			}
		}
		// 메일 인서트
		mailService.regist(mail);
		
		
		
		return url;
	}
	
	
	@javax.annotation.Resource(name="mailSavedFilePath")
	private String fileUploadPath;

	private List<MailFileVO> saveFileToMailFiles(List<MultipartFile> multiFiles,
												String savePath )throws Exception{
		/* if (multiFiles == null) return null; */
		
		//저장 -> mailFileVO -> mailFileList.add
		List<MailFileVO> mailFileList = new ArrayList<MailFileVO>();
		for (MultipartFile multi : multiFiles) {
			//파일명
			String uuid = UUID.randomUUID().toString().replace("-", "");
			String fileName = uuid+"$$"+multi.getOriginalFilename();
			
			//파일저장
			File target = new File(savePath, fileName);
			target.mkdirs();
			multi.transferTo(target);
			
			MailFileVO mailFile = new MailFileVO();
			mailFile.setMafile_uploadpath(savePath);
			mailFile.setMafile_name(fileName);
			mailFile.setMafile_type(fileName.substring(fileName.lastIndexOf('.') + 1).toUpperCase());
			
			//attchList 추가
			mailFileList.add(mailFile);
			
		}
		return mailFileList;
	}
	
	@GetMapping("/remove")
	public ModelAndView remove(@RequestParam("mail_id") String mail_ids, ModelAndView mnv) throws Exception{
		String url = "/mail/remove_success";
		
		String[] mailIdArr = mail_ids.split(",");
		for(String mailIdStr : mailIdArr) {
			int mail_id = Integer.parseInt(mailIdStr.trim());
			
			List<MailFileVO> mailFileList = mailService.getMail(mail_id).getMailFileList();
			if (mailFileList != null) {
				for (MailFileVO mailFile : mailFileList) {
					File target = new File(mailFile.getMafile_uploadpath(), mailFile.getMafile_name());
					if (target.exists()) {
						target.delete();
					}
				}
			}
		mailService.remove(mail_id);
		}
		
		mnv.setViewName(url);
		return mnv;
	}
	
}
