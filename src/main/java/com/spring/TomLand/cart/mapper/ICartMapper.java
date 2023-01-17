package com.spring.TomLand.cart.mapper;

import java.util.List;

import com.spring.TomLand.command.CartVO;

public interface ICartMapper {
	
	//카트 추가
	public int addCart(CartVO vo) throws Exception;
	
	//카트 삭제
	public void deleteCart(int cartNo);
	
	//카트 수량 수정
	public int modifyCount(CartVO cart);
	
	//카트 목록
	public List<CartVO> getCart(int userNo);
	
	//카트 확인
	public CartVO checkCart(CartVO vo);
	
}
