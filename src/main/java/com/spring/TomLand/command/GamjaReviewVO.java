package com.spring.TomLand.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

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
	
	//유저 프로필 사진 변수 추가
	private String profileUploadPath;
	private String profileFileLoca;
	private String profileFileName;
	private String profileFileRealName;
	
	
}
