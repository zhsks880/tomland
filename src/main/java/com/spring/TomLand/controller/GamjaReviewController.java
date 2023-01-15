package com.spring.TomLand.controller;

import java.io.File;
import java.nio.file.Files;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.spring.TomLand.command.GamjaReviewVO;
import com.spring.TomLand.command.PageVO;
import com.spring.TomLand.command.UserVO;
import com.spring.TomLand.gamjareview.service.IGamjaReviewService;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/review")
public class GamjaReviewController {
	
	@Autowired
	private IGamjaReviewService service;
	
	//review 댓글 등록
	@PostMapping("/insert")
	public String insert(MultipartFile file, String content, HttpSession session) {
		
		String writer = ((UserVO) session.getAttribute("login")).getUserId();
		log.info("리뷰 등록자: " + writer);
		String profileFileLoca = ((UserVO) session.getAttribute("login")).getUserFileLoca();
		String profileUploadPath = ((UserVO) session.getAttribute("login")).getUserUploadPath();
		String profileFileName = ((UserVO) session.getAttribute("login")).getUserFileName();
		String profileFileRealName = ((UserVO) session.getAttribute("login")).getUserFileRealName();
		
		GamjaReviewVO reviewVo = new GamjaReviewVO();
		reviewVo.setWriter(writer);
		reviewVo.setContent(content);
		reviewVo.setProfileFileLoca(profileFileLoca);
		reviewVo.setProfileUploadPath(profileUploadPath);
		reviewVo.setProfileFileRealName(profileFileRealName);
		reviewVo.setProfileFileName(profileFileName);;
		
		log.info("서비스로 갈 VO " + reviewVo);
		service.insert(reviewVo, file);

		return "regSuccess";
	}
	
	//review 댓글 목록
	@GetMapping("/getList")
	public List<GamjaReviewVO> getList(PageVO paging){
		paging.setCpp(3);

		return service.getList(paging);
	}
	
	//review 사진 가져오기
	@GetMapping("/display")
	public ResponseEntity<byte[]> getFile(String fileLoca, String fileName){
		
		File file = new File("c:/test/review/" + fileLoca + "/" + fileName);
		
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
	
	//review 프로필 사진 가져오기
	@GetMapping("/display1")
	public ResponseEntity<byte[]> getFile1(String profileFileLoca, String profileFIleName){
		
		File file = new File("c:/test/tomland/" + profileFileLoca + "/" + profileFIleName);
		
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
	
}
