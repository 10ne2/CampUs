package com.camp_us.controller.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.camp_us.dto.MailVO;
import com.camp_us.service.MailService;

@RestController
@RequestMapping("/api/mail")
public class MailRestController {
	
	@Autowired
	private MailService mailService;
	
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
	
}
