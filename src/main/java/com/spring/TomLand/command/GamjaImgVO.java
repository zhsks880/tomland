package com.spring.TomLand.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
-- gamjaimg table 생성
create table gamjaimg(
    ino number primary key,
    gno number,
    upload_path varchar2(1000),
    file_loca varchar2(1000),
    file_name varchar2(1000),
    file_realName varchar2(1000)
);
-- gamjaimg sequence
create sequence gamjaimg_seq
    start with 1
    increment by 1
    maxvalue 5000
    nocycle
    nocache;
 */

@Getter
@Setter
@ToString
public class GamjaImgVO {
	
	private GamjaVO vo;
	
	private int ino;
	private int gno;
	private String uploadPath;
	private String fileLoca;
	private String fileName;
	private String fileRealName;

}
