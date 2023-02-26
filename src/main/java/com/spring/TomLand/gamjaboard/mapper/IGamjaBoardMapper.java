package com.spring.TomLand.gamjaboard.mapper;

import java.util.List;

import com.spring.TomLand.command.GamjaVO;
import com.spring.TomLand.command.PageVO;
import com.spring.TomLand.command.GamjaBoardVO;

public interface IGamjaBoardMapper {
	
	//글 등록
	void regist(GamjaBoardVO vo);
	
	//글 목록
	List<GamjaBoardVO> getList(PageVO paging);
	
	//글 상세보기
	GamjaBoardVO getContent(int bno);
	
	//글 삭제
	void delete(int bno);
	
	
}
