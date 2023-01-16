package com.spring.TomLand.controller;

import java.io.File;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.TomLand.command.GamjaImgVO;
import com.spring.TomLand.command.GamjaVO;
import com.spring.TomLand.command.PageVO;
import com.spring.TomLand.gamja.service.IGamjaService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/gamja")
public class GamjaController {
	
	@Autowired
	private IGamjaService service;
	
	
	//감자마켓 이동
	@GetMapping("/gamjaList")
	public void gamjaList(PageVO vo, Model model) {
		
		model.addAttribute("gamjaList", service.getList(vo));
		model.addAttribute("pc", service.getPc(vo));
	}
	
	//감자상세 이동
	@GetMapping("/gamjaContent")
	public void gamjaContent() {
		
	}
	
	//감자등록 이동
	@GetMapping("/gamjaRegist")
	public void gamjaRegist() {
	}
	
	//감자글 등록
	@PostMapping("/gamjaRegist")
	public String gamjaRegist(@RequestParam("file") List<MultipartFile> imgList, GamjaVO vo, RedirectAttributes ra) {

		//블로그 내용
		ArrayList<GamjaImgVO> gamjaimg = new ArrayList<GamjaImgVO>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String fileLoca = sdf.format(new Date());
		String uploadPath = "c:/test/gamja/" + fileLoca;
		File folder = new File(uploadPath);
		
		if(!folder.exists()) folder.mkdirs();
		
		for(MultipartFile img : imgList) {
			String fileRealName = img.getOriginalFilename();
			UUID uuid = UUID.randomUUID();
			String uuids = uuid.toString().replaceAll("-", "");
			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
			String fileName = uuids + fileExtension;
			File saveFile = new File(uploadPath + "/" + fileName);
			try {
				img.transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
			GamjaImgVO gamjaimgvo = new GamjaImgVO();
			gamjaimgvo.setFileLoca(fileLoca);
			gamjaimgvo.setFileName(fileName);
			gamjaimgvo.setFileRealName(fileRealName);
			gamjaimgvo.setUploadPath(uploadPath);
			gamjaimg.add(gamjaimgvo);	
		}
		
		int result = service.gamjaRegist(vo, gamjaimg);
	
		ra.addFlashAttribute("msg", "등록이 완료 되었습니다.");
		return "redirect:/gamja/gamjaList";
	}
	
	//감자 내글 보기
	@GetMapping("/gamjaContent/{gno}")
	public String getContent(@PathVariable int gno, Model model) {
		
		model.addAttribute("article", service.getContent(gno));
		return "gamja/gamjaContent";
	}
	
	//상품 사진 가져오기
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileLoca, String fileName){
		File file = new File("c:/test/gamja/" + fileLoca + "/" + fileName);
		
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
	
	//감자 글 삭제
	@PostMapping("/delete")
	@ResponseBody
	public String delete(@RequestBody int gno) {
		service.delete(gno);
		
		
		return "delSuccess";
	}
	
	//감자 글 수정 가기
	@GetMapping("/gamjaModify/{gno}")
	public String gamjaModify(@PathVariable int gno, Model model) {
		model.addAttribute("modList", service.getContent(gno));
		return "gamja/gamjaModify";
	}

	//감자 글 수정하기
	@PostMapping("/update")
	public String update(@RequestParam("file") List<MultipartFile> imgList, GamjaVO vo, RedirectAttributes ra) {
		
		//블로그 내용
		ArrayList<GamjaImgVO> gamjaimg = new ArrayList<GamjaImgVO>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String fileLoca = sdf.format(new Date());
		String uploadPath = "c:/test/gamja/" + fileLoca;
		File folder = new File(uploadPath);
		
		if(!folder.exists()) folder.mkdirs();
		
		for(MultipartFile img : imgList) {
			String fileRealName = img.getOriginalFilename();
			UUID uuid = UUID.randomUUID();
			String uuids = uuid.toString().replaceAll("-", "");
			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
			String fileName = uuids + fileExtension;
			File saveFile = new File(uploadPath + "/" + fileName);
			try {
				img.transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
			GamjaImgVO gamjaimgvo = new GamjaImgVO();
			gamjaimgvo.setFileLoca(fileLoca);
			gamjaimgvo.setFileName(fileName);
			gamjaimgvo.setFileRealName(fileRealName);
			gamjaimgvo.setUploadPath(uploadPath);
			gamjaimg.add(gamjaimgvo);	
		}
		
		int result = service.update(vo, gamjaimg);
	
		ra.addFlashAttribute("msg", "수정이 완료 되었습니다.");
		return "redirect:/gamja/gamjaList";
	}
	
	
	
}
