package com.spring.TomLand.command;
/*
-- snsreply 테이블 생성
create table snsreply(
    rno number primary key,
    bno number,
    sns_writer varchar2(500),
    sns_reply varchar2(2000),
    upload_path varchar2(1000),
    file_loca varchar2(1000),
    file_name varchar2(1000),
    file_realName varchar2(1000),
    reg_date date default sysdate,
    update_date date default null
);

-- snsreply sequence
create sequence snsreply_seq
    start with 1
    increment by 1
    maxvalue 5000
    nocycle
    nocache;
 */

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SnsReplyVO {

	private int rno;
	private int bno;
	private String snsWriter;
	private String snsReply;
	private String uploadPath;
	private String fileLoca;
	private String fileName;
	private String fileRealName;
	private Timestamp regDate;
	private Timestamp updateDate;

}
