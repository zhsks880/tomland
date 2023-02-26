package com.spring.TomLand.gamjareview.mapper;

import java.util.List;

import com.spring.TomLand.command.GamjaReviewVO;
import com.spring.TomLand.command.PageVO;


public interface IGamjaReviewMapper {
	
	//글 등록
	void insert(GamjaReviewVO vo);
	
	//글 목록
	List<GamjaReviewVO> getList(PageVO paging);
	
	//글 상세
	GamjaReviewVO getDetail(int bno);
	
	//글 삭제
	void delete(int bno);
	
	
	
}
