package com.spring.TomLand.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
-- snsboard 테이블 생성
create table snsboard(
    bno number primary key,
    writer varchar2(500),
    content varchar2(2000),
    upload_path varchar2(1000),
    file_loca varchar2(1000),
    file_name varchar2(1000),
    file_realName varchar2(1000),
    reg_date date default sysdate,
    update_date date default null
    
    alter table snsboard add profile_uploadPath varchar2(1000);
alter table snsboard add profile_fileLoca varchar2(1000);
alter table snsboard add profile_fileName varchar2(1000);
alter table snsboard add profile_fileRealName varchar2(1000);
);

-- snsboard sequence
create sequence snsboard_seq
    start with 1
    increment by 1
    maxvalue 5000
    nocycle
    nocache;
 */

@Getter
@Setter
@ToString
public class SnsBoardVO {
	
	private int bno;
	private String writer;
	private String content;
	private String uploadPath;
	private String fileLoca;
	private String fileName;
	private String fileRealName;
	private Timestamp regDate;
	private Timestamp updateDate;
	
	//유저 프로필 사진 변수 추가
	private String profileUploadPath;
	private String profileFileLoca;
	private String profileFileName;
	private String profileFileRealName;
	
	//좋아요 갯수 변수 추가
	private int likeCnt;
}
