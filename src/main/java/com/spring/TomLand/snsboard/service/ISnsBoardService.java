package com.spring.TomLand.snsboard.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.spring.TomLand.command.GamjaImgVO;
import com.spring.TomLand.command.PageVO;
import com.spring.TomLand.command.SnsBoardVO;
import com.spring.TomLand.command.SnsLikeVO;

public interface ISnsBoardService {

	//글 등록
	void insert(SnsBoardVO vo, MultipartFile file);
	
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
	
	//이미지 데이터 변환
	public List<GamjaImgVO> getImg(int gno);
	
}
