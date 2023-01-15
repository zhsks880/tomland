package com.spring.TomLand.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
-- freereply 테이블 생성
create table freereply(
    rno number primary key,
    bno number,
    reply varchar2(2000),
    reply_id varchar2(500),
    reply_pw varchar2(1000),
    reply_date date default sysdate,
    update_date date default null
);

-- freereply sequence
create sequence freereply_seq
    start with 1
    increment by 1
    maxvalue 5000
    nocycle
    nocache;
    
alter table freereply add reply_uploadPath varchar2(500);
alter table freereply add reply_fileLoca varchar2(500);
alter table freereply add reply_fileName varchar2(500);
alter table freereply add reply_fileRealName varchar2(500);
 */

@Getter
@Setter
@ToString
public class ReplyVO {
	
	private int rno;
	private int bno;
	private String reply;
	private String replyId;
	private String replyPw;
	private Timestamp replyDate;
	private Timestamp updateDate;
	//댓글 프사 사진 추가
	private String replyUploadPath;
	private String replyFileLoca;
	private String replyFileName;
	private String replyFileRealName;
}
