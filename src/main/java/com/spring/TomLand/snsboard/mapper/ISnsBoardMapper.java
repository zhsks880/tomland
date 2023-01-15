package com.spring.TomLand.snsboard.mapper;

import java.util.List;

import com.spring.TomLand.command.PageVO;
import com.spring.TomLand.command.SnsBoardVO;
import com.spring.TomLand.command.SnsLikeVO;

public interface ISnsBoardMapper {
	
	//글 등록
	void insert(SnsBoardVO vo);
	
	//글 목록
	List<SnsBoardVO> getList(PageVO paging);
	
	//글 상세
	SnsBoardVO getDetail(int bno);
	
	//글 삭제
	void delete(int bno);
	
	//좋아요 검색
	int searchLike(SnsLikeVO vo);
	
	//좋아요 등록
	void createLike(SnsLikeVO vo);
	
	//좋아요 삭제
	void deleteLike(SnsLikeVO vo);
	
	//로그인 사용자 접속 시 좋아요 한 게시물 체크
	List<Integer> listLike(String userId);
	
}
