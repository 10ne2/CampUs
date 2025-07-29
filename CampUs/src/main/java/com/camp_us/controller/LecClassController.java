package com.camp_us.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.camp_us.dto.LecClassVO;
import com.camp_us.dto.UnsubmitHomeworkVO;
import com.camp_us.service.LecClassService;
import com.camp_us.service.UnsubmitHomeworkService;

@Controller
@RequestMapping("/lecture")
public class LecClassController {
    
    @Autowired
    private LecClassService lecClassService;
    
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
		
		
		
		return "lecture/main";
	}

    @GetMapping("/changeMajor")
    @ResponseBody
    public LecClassVO getLectureInfo(@RequestParam("lec_id") String lec_id) throws SQLException {
        return lecClassService.getLecClassById(lec_id);
    
    
    }
    @GetMapping("/syllabus")
    public String syllabus(@RequestParam("lec_id") String lec_id, Model model) {
        model.addAttribute("lec_id", lec_id);
        return "lecture/syllabus";  // views/lecture/syllabus.jsp
    }
}