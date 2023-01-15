package com.spring.TomLand.snsreply.service;

import java.util.List;
import java.util.Map;

import com.spring.TomLand.command.SnsReplyVO;

public interface ISnsReplyService {

	//댓글 등록
	void replyRegist(SnsReplyVO vo);
	
	//목록 요청
	List<SnsReplyVO> getList(int bno);
	
	//댓글 갯수(페이징)
	int getTotal(int bno);
	
	//댓글 수정
	void update(SnsReplyVO vo);
	
	//댓글 삭제
	void delete(SnsReplyVO vo);
	
	//회원 정보 조회 기능
	List<SnsReplyVO> selectOne(String snsWriter);
	
}
