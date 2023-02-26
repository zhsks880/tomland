package com.spring.TomLand.gamjareply.mapper;

import com.spring.TomLand.command.GamjaBoardReplyVO;

public interface IGamjaReplyMapper {
	
	//답변 등록
	void qnaRegist(GamjaBoardReplyVO replyVo);
	
}
