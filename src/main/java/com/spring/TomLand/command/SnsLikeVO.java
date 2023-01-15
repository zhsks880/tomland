package com.spring.TomLand.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
create table snslike(
    lno number primary key,
    bno number not null,
    userId varchar2(500)
);

create sequence snslike_seq
    start with 1
    increment by 1
    maxvalue 10000
    nocycle
    nocache;
 */


@Getter
@Setter
@ToString
public class SnsLikeVO {
	
	private int bno;
	private String userId;
	private int lno;
	
	
}
