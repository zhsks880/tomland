package com.spring.TomLand.controller;

import java.io.File;
import java.nio.file.Files;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.TomLand.command.PageVO;
import com.spring.TomLand.command.SnsBoardVO;
import com.spring.TomLand.command.SnsLikeVO;
import com.spring.TomLand.command.UserVO;
import com.spring.TomLand.snsboard.service.ISnsBoardService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/sns")
public class SnsController {
	
	@Autowired
	private ISnsBoardService service;
	
	//snsBoard 이동
	@GetMapping("/snsBoard")
	public void snsBoard() {
		
	}
	
	//글 등록
	@PostMapping("/upload")
	@ResponseBody
	public String upload(MultipartFile file, String content, HttpSession session) {
		
		String writer = ((UserVO) session.getAttribute("login")).getUserId();
		
		String profileFileLoca = ((UserVO) session.getAttribute("login")).getUserFileLoca();
		String profileUploadPath = ((UserVO) session.getAttribute("login")).getUserUploadPath();
		String profileFileName = ((UserVO) session.getAttribute("login")).getUserFileName();
		String profileFileRealName = ((UserVO) session.getAttribute("login")).getUserFileRealName();
		
		SnsBoardVO snsVo = new SnsBoardVO();
		snsVo.setWriter(writer);
		snsVo.setContent(content);
		
		snsVo.setProfileFileLoca(profileFileLoca);
		snsVo.setProfileUploadPath(profileUploadPath);
		snsVo.setProfileFileName(profileFileName);
		snsVo.setProfileFileRealName(profileFileRealName);
		
		service.insert(snsVo, file);
		
		return "success";
		
	}
	
	//글 목록 가져오기
	@GetMapping("/getList")
	@ResponseBody
	public List<SnsBoardVO> getList(PageVO paging){
		paging.setCpp(3); 	//처음에 글 3개 표현
		return service.getList(paging);
	}
	
	//sns 사진 가져오기
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileLoca, String fileName){
		
		File file = new File("c:/test/sns/" + fileLoca + "/" + fileName);
		
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
	
	//sns 프로필 사진 가져오기
	@GetMapping("/display1")
	@ResponseBody
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
	
	//글 상세보기
	@GetMapping("/getDetail/{bno}")
	@ResponseBody
	public SnsBoardVO getDetail(@PathVariable int bno) {
		return service.getDetail(bno);
	}
	
	//글 삭제하기
	@PostMapping("/delete")
	@ResponseBody
	public String delete(@RequestBody int bno, HttpSession session) {
		SnsBoardVO vo = service.getDetail(bno);
		UserVO user = (UserVO) session.getAttribute("login");
		
		if(user == null || !user.getUserId().equals(vo.getWriter())) {
			return "noAuth";
		}
		service.delete(bno);
		//DB삭제 후 실제 파일도 삭제
		File file = new File(vo.getUploadPath() + "/" + vo.getFileName());
		return file.delete() ? "success" : "fail";
	}
	
	//좋아요 버튼 클릭
	@PostMapping("/like")
	@ResponseBody
	public String likeConfirm(@RequestBody SnsLikeVO vo) {
		
		if(service.searchLike(vo) == 0) {
			service.createLike(vo);
			return "like";
		} else {
			service.deleteLike(vo);
			return "delete";
		}
	}
	
	//회원 진입 시 좋아요 체크
	@PostMapping("/listLike")
	@ResponseBody
	public List<Integer> listLike(@RequestBody String userId){
		return service.listLike(userId);
	}
	

}

