package com.spring.TomLand.util;

import org.springframework.stereotype.Component;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.spring.TomLand.command.PageVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Component
public class PageCreator {
	
	//외부에서 들어올 PageVO & articletotalcount
	private PageVO paging;
	private int articleTotalCount;
	
	private int endPage;
	private int beginPage;
	private boolean prev;
	private boolean next;
	
	private final int buttonNum = 5;
	
	//URI 파라미터 유틸 메서드
	public String makeURI(int page) {
		UriComponents ucp = UriComponentsBuilder.newInstance().queryParam("pageNum", page)
							.queryParam("cpp", paging.getCpp())
							.queryParam("keyword", paging.getKeyword())
							.queryParam("condition", paging.getCondition())
							.build();
		return ucp.toUriString();
	}
	
	//페이징 알고리즘
	private void calcDataOfPage() {
		endPage = (int) (Math.ceil(paging.getPageNum() / (double) buttonNum) * buttonNum);
		
		beginPage = (endPage - buttonNum) + 1;
		
		prev = (beginPage == 1) ? false : true;
		
		next = articleTotalCount <= (endPage * paging.getCpp()) ? false : true;
		
		if(!next) {
			endPage = (int) Math.ceil(articleTotalCount / (double) paging.getCpp());
		}
	}
	
	//컨트롤러가 총 게시물 개수를 PageCreator에게 전달
	public void setArticleTotalCount(int articleTotalCount) {
		this.articleTotalCount = articleTotalCount;
		calcDataOfPage();
	}
	
}
