package com.spring.TomLand.gamjaboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.TomLand.command.GamjaVO;
import com.spring.TomLand.command.PageVO;
import com.spring.TomLand.command.GamjaBoardVO;
import com.spring.TomLand.gamjaboard.mapper.IGamjaBoardMapper;
import com.spring.TomLand.util.PageCreator;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class GamjaBoardServiceImpl implements IGamjaBoardService {
	
	@Autowired
	private IGamjaBoardMapper mapper;
	
	@Autowired
	private PageCreator pc;
	
	
	@Override
	public void regist(GamjaBoardVO vo) {
		mapper.regist(vo);
	}

	@Override
	public List<GamjaBoardVO> getList(PageVO paging) {
		return mapper.getList(paging);
	}

	@Override
	public GamjaBoardVO getContent(int bno) {
		return null;
	}

	@Override
	public void delete(int bno) {
		mapper.delete(bno);
	}

}
