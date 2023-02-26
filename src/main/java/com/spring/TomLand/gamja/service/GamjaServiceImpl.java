package com.spring.TomLand.gamja.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.TomLand.command.GamjaAllVO;
import com.spring.TomLand.command.GamjaBoardVO;
import com.spring.TomLand.command.GamjaImgVO;
import com.spring.TomLand.command.GamjaVO;
import com.spring.TomLand.command.PageVO;
import com.spring.TomLand.gamja.mapper.IGamjaMapper;
import com.spring.TomLand.util.PageCreator;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class GamjaServiceImpl implements IGamjaService {
	
	@Autowired
	private IGamjaMapper mapper;
	
	@Autowired
	private PageCreator pc;
			
	@Override
	public int gamjaRegist(GamjaVO vo, ArrayList<GamjaImgVO> gamjaimg) {
		int result = 0;
		
		result = mapper.gamjaRegist(vo);
		
		for(GamjaImgVO gam : gamjaimg) {
			gam.setGno(vo.getGno());
			result = mapper.imageRegi(gam);
		}
		return result;
	}
	

	@Override
	public List<GamjaVO> getList(PageVO vo) {

		return mapper.getList(vo);
	}
	

	@Override
	public int getTotal(PageVO search) {
		return 0;
	}

	
	//getTotal
	public PageCreator getPc(PageVO vo) {
		pc.setPaging(vo);
		pc.setArticleTotalCount(mapper.getTotal(vo));
		return pc;
	}
	
	@Override
	public void imageRegi(GamjaImgVO vo) {
		
	}
	
	@Override
	public void imageUpdate(GamjaImgVO vo) {
		
	}
	
	@Override
	public List<GamjaAllVO> getContent(int gno) {
		return mapper.getContent(gno);
	}

	@Override
	public int update(GamjaVO vo, ArrayList<GamjaImgVO> gamjaimg) {
		int result = 0;
		
		result = mapper.update(vo);
				
		for(GamjaImgVO gam : gamjaimg) {
			gam.setGno(vo.getGno());
			result = mapper.imageUpdate(gam);
		}
		return result;
	}

	@Override
	public void delete(int gno) {
		mapper.delete(gno);
	}
	
	@Override
	public int getReivew(int gno) {
		return mapper.getReivew(gno);
	}


	@Override
	public List<GamjaBoardVO> getQna(int gno) {
		return mapper.getQna(gno);
	}
	
	@Override
	public int getQnaCnt(int gno) {
		return mapper.getQnaCnt(gno);
	}
	
	@Override
	public List<GamjaVO> getOneQna(int gno) {
		return mapper.getOneQna(gno);
	}
	
	@Override
	public List<GamjaVO> getOneContent(int bno) {
		return mapper.getOneContent(bno);
	}
}
