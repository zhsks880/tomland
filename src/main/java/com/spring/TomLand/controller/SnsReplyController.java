package com.spring.TomLand.controller;

import java.io.File;
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

import com.spring.TomLand.command.SnsReplyVO;
import com.spring.TomLand.snsreply.service.ISnsReplyService;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/snsReply")
public class SnsReplyController {
	
	@Autowired
	private ISnsReplyService service;
	
	private int SnsReplyVO;
	
	//sns댓글 등록
	@PostMapping("/replyRegist")
	public String replyRegist(@RequestBody SnsReplyVO vo) {

		service.replyRegist(vo);
		
		return "regSuccess";
	}
	
	//sns댓글 목록
	@GetMapping("/getList/{bno}")
	public Map<String, Object> getList(@PathVariable int bno){
		
		List<SnsReplyVO> list = service.getList(bno);
		int total = service.getTotal(bno);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("total", total);
		return map;
	}
	
	//sns댓글 profile 보기
	@GetMapping("/display/{snsWriter}")
	public ResponseEntity<byte[]> getsnsReplyFile(@PathVariable String snsWriter){
		
		List<SnsReplyVO> sProfile = service.selectOne(snsWriter);
		
		File file = new File("c:/test/tomland/" + sProfile.get(SnsReplyVO).getFileLoca() + "/" + sProfile.get(SnsReplyVO).getFileName());
		
		ResponseEntity<byte[]> result = null;
		HttpHeaders headers = new HttpHeaders();
		
		try {
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//sns댓글 삭제
	@PostMapping("/delete")
	public String delete(@RequestBody SnsReplyVO vo) {
		service.delete(vo);
		return "delSuccess";
	}
	
}
