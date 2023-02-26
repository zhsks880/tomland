package com.spring.TomLand.gamjareply.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.TomLand.command.GamjaBoardReplyVO;
import com.spring.TomLand.gamjareply.mapper.IGamjaReplyMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class IGamjaReplyService implements IGamjaReplyServiceImpl {
	
	@Autowired
	private IGamjaReplyMapper mapper;
	
	@Override
	public void qnaRegist(GamjaBoardReplyVO replyVo) {
		mapper.qnaRegist(replyVo);
	}

}
