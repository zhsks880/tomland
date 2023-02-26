package com.spring.TomLand.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.TomLand.command.GamjaBoardReplyVO;
import com.spring.TomLand.gamjareply.service.IGamjaReplyService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/gamjareply")
public class GamjaReplyController {
	
	@Autowired
	private IGamjaReplyService service;
	
	//답변 달기 이동
	@GetMapping("/qnaAnswer/{bno}")
	public String gamjaPop(int bno, Model model) {
		
		return "gamjareply/gamjaPop";
	}
	
	//답변 등록 하기
	@PostMapping("/qnaRegist")
	@ResponseBody
	public String qnaRegist(@RequestBody GamjaBoardReplyVO replyVo, RedirectAttributes ra) {
		log.info("replyVo : " + replyVo);
		service.qnaRegist(replyVo);
		ra.addFlashAttribute("msg", "answer");
		
		return "answer";
	}
	
}
