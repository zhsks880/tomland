package com.spring.TomLand.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
-- gamjaboard 테이블 생성
create table gamjaboard(
bno number primary key,
title varchar2(1000) not null,
writer varchar2(1000) not null,
content varchar2(2000) not null,
reg_date date default sysdate
);

-- gamjaboard sequence
create sequence gamjaboard_seq
    start with 1
    increment by 1
    maxvalue 5000
    nocycle
    nocache;
    
alter table gamjaboard add gno number default 0 not null;
 */

@Getter
@Setter
@ToString
public class GamjaBoardVO {

	private int bno;
	private String title;
	private String writer;
	private String content;
	private Timestamp regDate;
	
	//게시글 번호받을 변수
	private int gno;
	
	//게시글 댓글 개수 변수
	private int replyCount;
	
	//댓글 받을 변수 선언
	private int rno;
	private String qnaWriter;
	private String qnaReply;
	private Timestamp qnaRegDate;
	
	
}
