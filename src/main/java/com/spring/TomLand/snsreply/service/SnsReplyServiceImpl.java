package com.spring.TomLand.snsreply.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.TomLand.command.PageVO;
import com.spring.TomLand.command.SnsReplyVO;
import com.spring.TomLand.snsreply.mapper.ISnsReplyMapper;

import lombok.extern.log4j.Log4j;


@Log4j
@Service
public class SnsReplyServiceImpl implements ISnsReplyService {
	
	@Autowired
	private ISnsReplyMapper mapper;
	
	@Override
	public void replyRegist(SnsReplyVO vo) {
		mapper.replyRegist(vo);
	}

	@Override
	public List<SnsReplyVO> getList(int bno) {
		PageVO vo = new PageVO();
		vo.setPageNum(1);
		vo.setCpp(10);
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("paging", vo);
		data.put("bno", bno);
		
		return mapper.getList(data);
	}

	@Override
	public int getTotal(int bno) {
		return mapper.getTotal(bno);
	}

	@Override
	public void update(SnsReplyVO vo) {

	}

	@Override
	public void delete(SnsReplyVO vo) {
		mapper.delete(vo);
	}

	@Override
	public List<SnsReplyVO> selectOne(String snsWriter) {
		return mapper.selectOne(snsWriter);
	}

}
