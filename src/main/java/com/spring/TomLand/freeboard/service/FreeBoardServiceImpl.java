package com.spring.TomLand.freeboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.TomLand.command.FreeBoardVO;
import com.spring.TomLand.command.PageVO;
import com.spring.TomLand.freeboard.mapper.IFreeBoardMapper;
import com.spring.TomLand.util.PageCreator;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class FreeBoardServiceImpl implements IFreeBoardService {
	
	@Autowired
	private IFreeBoardMapper mapper;
	
	@Autowired
	private PageCreator pc;
	
	
	@Override
	public void regist(FreeBoardVO vo) {
		mapper.regist(vo);
	}

	@Override
	public List<FreeBoardVO> getList(PageVO vo) {
		return mapper.getList(vo);
	}

	@Override
	public int getTotal(PageVO search) {
		return 0;
	}

	@Override
	public FreeBoardVO getContent(int bno) {
		return mapper.getContent(bno);
	}

	@Override
	public void update(FreeBoardVO vo) {
		mapper.update(vo);
	}

	@Override
	public void delete(int bno) {
		mapper.delete(bno);
	}
	
	//getTotal
	public PageCreator getPc(PageVO vo) {
		pc.setPaging(vo);
		pc.setArticleTotalCount(mapper.getTotal(vo));
		return pc;
	}
	
	@Override
	public void viewCount(int bno) {
		mapper.viewCount(bno);
	}
}
