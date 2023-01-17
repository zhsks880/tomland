package com.spring.TomLand.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.TomLand.cart.service.ICartService;
import com.spring.TomLand.command.CartVO;
import com.spring.TomLand.command.UserVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Autowired
	private ICartService service;
	
	//카트 담기
	@PostMapping("/add")
	@ResponseBody
	public String addCart(CartVO vo, HttpServletRequest request) {
		//로그인 한 사용자 인지 체크
		HttpSession session = request.getSession();
		UserVO userVo = (UserVO)session.getAttribute("login");
		if(userVo == null) {
			return "5";
		}
		
		//카트 넣기
		int result = service.addCart(vo);
		log.info("카트로 가는 값!" + service.addCart(vo));
		return result + "";
	}
	
	//카트 삭제
	@PostMapping("/delete/{cartNo}")
	@ResponseBody
	public String deleteCart(@PathVariable int cartNo) {
		
		service.deleteCart(cartNo);
				
		return "delSuccess";
	}
}
