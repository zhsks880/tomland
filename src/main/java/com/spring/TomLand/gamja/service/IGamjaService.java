package com.spring.TomLand.gamja.service;

import java.util.ArrayList;
import java.util.List;

import com.spring.TomLand.command.GamjaAllVO;
import com.spring.TomLand.command.GamjaBoardVO;
import com.spring.TomLand.command.GamjaImgVO;
import com.spring.TomLand.command.GamjaVO;
import com.spring.TomLand.command.PageVO;
import com.spring.TomLand.util.PageCreator;

public interface IGamjaService {
	
	//글 등록
	int gamjaRegist(GamjaVO vo, ArrayList<GamjaImgVO> gamjaimg);
	
	//글 목록
	List<GamjaVO> getList(PageVO vo);
	
	//총 게시물 수
	int getTotal(PageVO search);
	
	//getTotal
	PageCreator getPc(PageVO vo);
	
	//글 상세보기
	List<GamjaAllVO> getContent(int gno);
	
	//글 수정
	int update(GamjaVO vo, ArrayList<GamjaImgVO> gamjaimg);
	
	//글 삭제
	void delete(int gno);
	
	//이미지 등록
	public void imageRegi(GamjaImgVO vo);
	
	//이미지 업데이트
	public void imageUpdate(GamjaImgVO vo);
	
	//감자 리뷰 갯수
	int getReivew(int gno);
	
	//QnA 갯수
	int getQnaCnt(int gno);
	
	//QnA 가져오기
	List<GamjaBoardVO> getQna(int gno);
	
	//QnA 문의 가져오기
	List<GamjaVO> getOneQna(int gno);
	
	//QnA 문의랑 답변 가져오기
	List<GamjaVO> getOneContent(int bno);
}
