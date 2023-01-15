package com.spring.TomLand.command;

import java.sql.Timestamp;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
create table users(
    user_no number primary key,
    user_id varchar2(50) not null,
    user_name varchar2(50) not null,
    user_pw varchar2(50) not null,
    user_email1 varchar2(50),
    user_email2 varchar2(50),
    user_phone1 varchar2(50),
    user_phone2 varchar2(50),
    user_phone3 varchar2(50),
    user_addr_zipnum varchar2(20),
    user_addr_basic varchar2(100),
    user_addr_detail varchar2(100),
    user_uploadPath varchar2(100),
    user_fileLoca varchar2(100),
    user_fileName varchar2(100),
    user_fileRealName varchar2(100),
    user_reg_date date default sysdate
);
 */

@Getter
@Setter
@ToString
public class UserVO {
	
	private int userNo;
	private String userId;
	private String userName;
	private String userPw;
	private String userEmail1;
	private String userEmail2;
	private String userPhone1;
	private String userPhone2;
	private String userPhone3;
	private String userAddrZipnum;
	private String userAddrBasic;
	private String userAddrDetail;
	private String userUploadPath;
	private String userFileLoca;
	private String userFileName;
	private String userFileRealName;
	private Timestamp userRegDate;

	//총게시글 갯수 추가
	private int writeCount;
	
	//총댓글 갯수 추가
	private int replyCount;
	
	//userBoardList 추가
	private List<FreeBoardVO> userBoardList;
	
}
