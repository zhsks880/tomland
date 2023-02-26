package com.spring.TomLand.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class GamjaBoardReplyVO {
	
	private int rno;
	private String qnaSeller;
	private String qnaReply;
	private int qnaReplyBno;
	private Timestamp qnaRegDate;
	
	//감자글 번호
	private int qnaReplyGno;
}
