package com.spring.TomLand.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageVO {
	
	//사용자가 선택한 페이지 정보를 담을 변수
	private int pageNum;
	private int cpp;
	
	//검색에 필요한 데이터를 담을 변수
	private String keyword;
	private String condition;
	
	//기본 페이지는 1페이지로 보여질 게시물 개수 5개
	public PageVO() {
		pageNum = 1;
		cpp = 5;
	}
	
	//사용자 만 갯수 세기 위해 추가
	private String userId;
	
}
