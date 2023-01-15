package com.spring.TomLand.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
-- freeboard 테이블 생성
create table freeboard(
    bno number primary key,
    title varchar2(1000) not null,
    writer varchar2(1000) not null,
    content varchar2(3000),
    reg_date date default sysdate,
    update_date date default null
);

-- freeboard sequence
create sequence freeboard_seq
    start with 1
    increment by 1
    maxvalue 5000
    nocycle
    nocache;

alter table freeboard add view_count number default 0 not null;
 */


@Getter
@Setter
@ToString
public class FreeBoardVO {
	
	private int bno;
	private String title;
	private String writer;
	private String content;
	private Timestamp regDate;
	private Timestamp updateDate;
	//게시글 조회수 변수 추가
	private int viewCount;
	
	//게시글에 대한 댓글 개수 받을 변수
	private int replyCount;

}
