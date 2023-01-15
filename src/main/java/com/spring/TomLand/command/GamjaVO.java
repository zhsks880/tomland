package com.spring.TomLand.command;
/*
-- gamja table 생성
create table gamja(
    gno number primary key,
    user_no number,
    ino number,
    p_name varchar2(1000) not null,
    p_price varchar2(1000) not null,
    p_condition varchar2(500) not null,
    p_from varchar2(1000),
    p_brand varchar2(1000),
    p_model varchar2(1000),
    p_return varchar2(500),
    p_trade varchar2(500),
    p_region varchar2(1000),
    p_desc varchar2(3000),
    reg_date date default sysdate,
    update_date date default null
);

-- gamja sequence
create sequence gamja_seq
    start with 1
    increment by 1
    maxvalue 5000
    nocycle
    nocache;
 */

import java.sql.Timestamp;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class GamjaVO {
	
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
	
	//이미지 업로드를 위해 변수선언
	private List<GamjaImgVO> imgList;
	
	//감자수정글 파일 추가
	private String file0;
	private String file1;
	private String file2;
	private String file3;
	private String file4;
	
	
}
