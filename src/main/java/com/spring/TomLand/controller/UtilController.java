package com.spring.TomLand.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/util")
public class UtilController {
	
	//공공데이터 사이트 이동
	@GetMapping("/gonggong")
	public void gonggong() {
		
	}
}
