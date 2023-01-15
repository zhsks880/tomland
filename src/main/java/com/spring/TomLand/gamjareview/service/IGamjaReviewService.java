package com.spring.TomLand.gamjareview.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.TomLand.command.GamjaReviewVO;
import com.spring.TomLand.command.PageVO;

public interface IGamjaReviewService {
	
	
	//글 등록
	void insert(GamjaReviewVO vo, MultipartFile file);
	
	//글 목록
	List<GamjaReviewVO> getList(PageVO paging);
	
	//글 상세
	GamjaReviewVO getDetail(int bno);
	
	//글 삭제
	void delete(int bno);
	
	
}
