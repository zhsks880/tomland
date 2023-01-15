package com.spring.TomLand.reply.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.TomLand.command.PageVO;
import com.spring.TomLand.command.ReplyVO;
import com.spring.TomLand.reply.mapper.IReplyMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ReplyServiceImpl implements IReplyService {
	
	@Autowired
	private IReplyMapper mapper;
	
	@Override
	public void replyRegist(ReplyVO vo) {
		mapper.replyRegist(vo);
	}

	@Override
	public List<ReplyVO> getList(int bno, int pageNum) {
		PageVO vo = new PageVO();
		vo.setPageNum(pageNum);		//화면에 전달된 페이지 번호
		vo.setCpp(2);				//댓글 한 화면에 2개씩
		
		//페이징 쿼리
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("paging", vo);
		data.put("bno", bno);
		
		return mapper.getList(data);
	}

	@Override
	public List<ReplyVO> selectOne(String replyId) {
		return mapper.selectOne(replyId);
	}
	
	@Override
	public int getTotal(int bno) {
		return mapper.getTotal(bno);
	}

	@Override
	public int pwCheck(ReplyVO vo) {
		return 0;
	}

	@Override
	public void update(ReplyVO vo) {
		mapper.update(vo);
	}

	@Override
	public void delete(int rno) {
		mapper.delete(rno);
	}

}
