package com.spring.TomLand.gamjareply.service;

import com.spring.TomLand.command.GamjaBoardReplyVO;

public interface IGamjaReplyServiceImpl {
	
	//답변 등록
	void qnaRegist(GamjaBoardReplyVO replyVo);
	
}
