package com.spring.TomLand.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.TomLand.command.FreeBoardVO;
import com.spring.TomLand.command.PageVO;
import com.spring.TomLand.freeboard.service.IFreeBoardService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/board")
public class FreeBoardController {
	
	@Autowired
	private IFreeBoardService service;
	
	
	//자유게시판 이동
	@GetMapping("/boardList")
	public void boardList(PageVO vo, Model model) {
		log.info("자유게시판pageVO " + vo);
		
		model.addAttribute("boardList", service.getList(vo));
		model.addAttribute("pc", service.getPc(vo));
	}
	
	//글쓰기 이동
	@GetMapping("/boardWrite")
	public void boardWrite() {
		
	}
	
	//글 등록하기
	@PostMapping("/boardWrite")
	public String boardWrite(FreeBoardVO vo) {
		service.regist(vo);
		
		return "redirect:/board/boardList";
	}
	
	//글 내용 상세보기
	@GetMapping("/boardContent/{bno}")
	public String getContent(@PathVariable int bno, Model model, @ModelAttribute("p") PageVO vo) {
		
		service.viewCount(bno);
		model.addAttribute("article", service.getContent(bno));
		
		return "board/boardContent";
	}
	
	//글 수정하러 가기
	@GetMapping("/boardModify")
	public void update(int bno, Model model, @ModelAttribute("p") PageVO vo) {
		model.addAttribute("article", service.getContent(bno));
		log.info("서비스에서 오는 content: " + service.getContent(bno));
	}
	
	//글 수정하기
	@PostMapping("/boardModify")
	public String update(FreeBoardVO vo, RedirectAttributes ra) {
		service.update(vo);
		log.info("서비스에서 업데이트 VO: " + vo);
		ra.addFlashAttribute("msg", "modify");
		return "redirect:/board/boardContent/" + vo.getBno();
	}
	
	//글 삭제하기
	@PostMapping("/boardDelete")
	public String delete(int bno, RedirectAttributes ra) {
		service.delete(bno);
		ra.addFlashAttribute("msg", "delete");
		return "redirect:/board/boardList";
	}
	
}
