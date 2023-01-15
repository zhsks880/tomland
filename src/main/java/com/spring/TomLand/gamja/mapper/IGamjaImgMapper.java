package com.spring.TomLand.gamja.mapper;

import java.util.List;

import com.spring.TomLand.command.GamjaImgVO;

public interface IGamjaImgMapper {
	
	//이미지 가져오기
	public List<GamjaImgVO> getImgList(int gno);
	
}
