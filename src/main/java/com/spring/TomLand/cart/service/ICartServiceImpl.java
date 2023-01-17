package com.spring.TomLand.cart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.TomLand.cart.mapper.ICartMapper;
import com.spring.TomLand.command.CartVO;

import lombok.extern.log4j.Log4j;


@Service
@Log4j
public class ICartServiceImpl implements ICartService {
	
	@Autowired
	private ICartMapper mapper;
	
	//장바구니 추가
	@Override
	public int addCart(CartVO vo){
		
		//장바구니 데이터 체크
		CartVO checkCart = mapper.checkCart(vo);
		if(checkCart != null) {
			return 2;
		}
		//장바구니 등록 & 에러 시 0 반환
		try {
			return mapper.addCart(vo);
		} catch (Exception e) {
			return 0;
		}
	}

	@Override
	public void deleteCart(int cartNo) {
		mapper.deleteCart(cartNo);
	}

	@Override
	public int modifyCount(CartVO cart) {
		return 0;
	}

	@Override
	public List<CartVO> getCart(int userNo) {
				
		return null;
	}

	@Override
	public CartVO checkCart(CartVO vo) {
		return null;
	}

}
