package com.spring.TomLand.freeboard.service;

import java.util.List;

import com.spring.TomLand.command.FreeBoardVO;
import com.spring.TomLand.command.PageVO;
import com.spring.TomLand.util.PageCreator;

public interface IFreeBoardService {
	
	//글 등록
	void regist(FreeBoardVO vo);
	
	//글 목록
	List<FreeBoardVO> getList(PageVO vo);
	
	//총 게시물 수
	int getTotal(PageVO search);
	
	//getTotal
	PageCreator getPc(PageVO vo);
	
	//글 상세보기
	FreeBoardVO getContent(int bno);
	
	//글 수정
	void update(FreeBoardVO vo);
	
	//글 삭제
	void delete(int bno);
	
	//조회수 카운트
	void viewCount(int bno);
	
}
