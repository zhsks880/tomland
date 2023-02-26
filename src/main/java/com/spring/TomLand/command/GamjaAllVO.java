package com.spring.TomLand.command;

import java.sql.Timestamp;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class GamjaAllVO {

	private int gno;
	private int userNo;
	private int ino;
	private String userId;
	private String pName;
	private String pPrice;
	private String pCondition;
	private String pFrom;
	private String pBrand;
	private String pModel;
	private String pReturn;
	private String pTrade;
	private String pRegion;
	private String pDesc;
	private Timestamp regDate;
	private Timestamp updateDate;

	private String uploadPath;
	private String fileLoca;
	private String fileName;
	private String fileRealName;
	
	//리뷰 카운트 추가
	private int reviewCnt;
	

}
