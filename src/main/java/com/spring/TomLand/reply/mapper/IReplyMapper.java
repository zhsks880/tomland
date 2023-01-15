package com.spring.TomLand.reply.mapper;

import java.util.List;
import java.util.Map;

import com.spring.TomLand.command.ReplyVO;

public interface IReplyMapper {
	
	//댓글 등록
	void replyRegist(ReplyVO vo);
	
	//목록 요청
	List<ReplyVO> getList(Map<String, Object> data);
	
	//댓글 갯수(페이징)
	int getTotal(int bno);
	
	//비밀번호 확인
	int pwCheck(ReplyVO vo);
	
	//댓글 수정
	void update(ReplyVO vo);
	
	//댓글 삭제
	void delete(int rno);
	
	//회원 정보 조회 기능
	List<ReplyVO> selectOne(String replyId);
	
	
}
