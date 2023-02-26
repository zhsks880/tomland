package com.spring.TomLand.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
-- gamjareview 테이블의 bno & gamja 테이블의 gno fk설정 및 삭제 같이 처리까지 묶기
alter table gamjareview add constraint gno foreign key(gno)
references gamja(gno)
on delete cascade;
 */

@Getter
@Setter
@ToString
public class GamjaReviewVO {
	
	private int bno;
	private String writer;
	private String content;
	private String uploadPath;
	private String fileLoca;
	private String fileName;
	private String fileRealName;
	private Timestamp regDate;
	private Timestamp updateDate;
	//감자 gno 추가
	private int gno;
	
	//유저 프로필 사진 변수 추가
	private String profileUploadPath;
	private String profileFileLoca;
	private String profileFileName;
	private String profileFileRealName;
	
}
