package com.spring.TomLand.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.TomLand.command.EmailVO;
import com.spring.TomLand.util.MailSendService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/util")
public class UtilController {
	
	@Autowired
	private MailSendService mailService;
	
	//공공데이터 사이트 이동
	@GetMapping("/gonggong")
	public void gonggong() {
		
	}
	
	//이메일 보내기
	@PostMapping("/contact")
	public String contact(EmailVO vo, RedirectAttributes ra) {
		log.info("메일보내기 vo?" + vo);
		
		mailService.sendSimpleMessage(vo);
		ra.addFlashAttribute("msg", "sendSuccess");
		
		return "redirect:/";
	}
}
