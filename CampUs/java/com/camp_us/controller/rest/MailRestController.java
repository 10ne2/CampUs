package com.camp_us.controller.rest;

import java.io.File;
import java.nio.file.Paths;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriUtils;

import com.camp_us.dao.MailFileDAO;
import com.camp_us.dto.MailFileVO;
import com.camp_us.dto.MailVO;
import com.camp_us.dto.MemberVO;
import com.camp_us.service.MailService;

@RestController
@RequestMapping("/api/mail")
public class MailRestController {
	
	@Autowired
	private MailService mailService;
	
	@Autowired
	private MailFileDAO mailFileDAO;
	
	
	@GetMapping("/detail")
	public ResponseEntity<MailVO> mailDetailList(int mail_id) throws Exception{
		ResponseEntity<MailVO> entity = null;
		MailVO mailDetailList = null;
		
		
		try {
			mailDetailList = mailService.detail(mail_id);
            entity = new ResponseEntity<MailVO>(mailDetailList, HttpStatus.OK);
        } catch(Exception e) {
            entity = new ResponseEntity<MailVO>(HttpStatus.INTERNAL_SERVER_ERROR);
            e.printStackTrace();
        }
		
		return entity;
	}

	@GetMapping("/getFile")
	@ResponseBody
	public ResponseEntity<Resource> getFile(int mafile_no) throws Exception {
						
		MailFileVO mailFile  = mailFileDAO.selectMailFileByMafileNo(mafile_no);
	    String filePath = mailFile.getMafile_uploadpath() + File.separator + mailFile.getMafile_name();
		
		
	    Resource resource = new UrlResource(Paths.get(filePath).toUri());
	    
	    return ResponseEntity.ok()
	            .header(HttpHeaders.CONTENT_DISPOSITION,"attachment; filename=\"" + 
				UriUtils.encode(mailFile.getMafile_name().split("\\$\\$")[1], "UTF-8") + "\"")
	            .body(resource);		
	}
	
	@GetMapping("/imp")
    public ResponseEntity<String> toggleImportant(@RequestParam Integer mail_id, HttpSession session) {
        MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("로그인이 필요합니다.");
        }

        String mem_id = loginUser.getMem_id();

        try {
            mailService.toggleMailImportant(mail_id, mem_id);
            return ResponseEntity.ok("success");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("오류 발생");
        }
    }
	
	@PostMapping("/read")
	public ResponseEntity<String> insertMailRead(@RequestBody MailVO mail, HttpSession session) {
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
        if (loginUser == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("로그인이 필요합니다.");
        }
        
        
        mail.setMem_id(loginUser.getMem_id());
        
        try {
            mailService.insertMailRead(mail);
            return ResponseEntity.ok("읽음 기록이 등록되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                                 .body("읽음 기록 등록 중 오류가 발생했습니다.");
        }
    }
	
}
