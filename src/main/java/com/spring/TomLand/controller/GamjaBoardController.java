package com.spring.TomLand.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.TomLand.command.GamjaBoardVO;
import com.spring.TomLand.command.PageVO;
import com.spring.TomLand.gamjaboard.service.IGamjaBoardService;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/gamjaBoard")
@Controller
public class GamjaBoardController {

	@Autowired
	private IGamjaBoardService service;
	
	//QnA등록
	@PostMapping("/regist")
	public String regist(GamjaBoardVO vo) {
		service.regist(vo);
		
		return "redirect:/gamja/gamjaContent/" + vo.getGno();
	}
	
	//QnA 목록 가져오기
	@GetMapping("/getList/{gno}/{pageNum}")
	@ResponseBody
	public List<GamjaBoardVO> getList(PageVO paging){
		paging.setCpp(3);
		
		return service.getList(paging);
	}
	
	//QnA 삭제
	@PostMapping("/delete")
	@ResponseBody
	public String delete(@RequestBody int bno) {
		service.delete(bno);
		
		return "delSuccess";
	}
	
}
