package com.spring.TomLand.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.TomLand.command.ReplyVO;
import com.spring.TomLand.reply.service.IReplyService;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/reply")
public class ReplyController {
	
	@Autowired
	private IReplyService service;

	private int ReplyVO;
	
	//댓글 등록
	@PostMapping("/replyRegist")
	public String replyRegist(@RequestBody ReplyVO vo) {
		
		log.info("ReplyVO ??? " + vo);
		
		service.replyRegist(vo);
		return "regSuccess";
	}
	
	//댓글 목록
	@GetMapping("/getList/{bno}/{pageNum}")
	public Map<String, Object> getList(@PathVariable int bno, @PathVariable int pageNum){
		
		List<ReplyVO> list = service.getList(bno, pageNum);
		int total = service.getTotal(bno);
		log.info("list 값??" + list);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("total", total);
		log.info("화면으로 가는 맵!" + map);
		return map;
	}
	
	
	//댓글 Profile 보기 요청 : replyList 에서 꺼내오기
	@GetMapping("/display1/{replyId}")
	public ResponseEntity<byte[]> getReplyFile(@PathVariable String replyId){
		
		log.info("들어온 replyID" + replyId);
		
		List<ReplyVO> rProfile = service.selectOne(replyId);
		
		log.info("가져온 rProfile: " + rProfile);
		
		File file = new File("c:/test/tomland/" + rProfile.get(ReplyVO).getReplyFileLoca() + "/" + rProfile.get(ReplyVO).getReplyFileName());
		
		ResponseEntity<byte[]> result = null;
		HttpHeaders headers = new HttpHeaders();
		
		try {
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//댓글 수정하기
	@PostMapping("/update")
	public String update(@RequestBody ReplyVO vo) {
		log.info("댓글 수정시 오는 VO" + vo);
		service.update(vo);
		
		return "modSuccess";
	}
	
	//댓글 삭제하기
	@PostMapping("/delete")
	public String delete(@RequestBody ReplyVO vo) {
		service.delete(vo.getRno());
		
		return "delSuccess";
	}
	
}
