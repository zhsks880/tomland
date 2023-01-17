package com.spring.TomLand.command;

import lombok.Getter;
import lombok.ToString;
import lombok.Setter;

/*
-- 장바구니 테이블 생성
create table cart(
    cart_no number primary key,
    user_no number,
    gno number,
    foreign key (user_no) references users(user_no),
    foreign key (gno) references gamja(gno)
);
-- cart sequence
create sequence cart_seq
    start with 1
    increment by 1
    maxvalue 5000
    nocycle
    nocache;
-- 유니크 제약 조건 걸기
alter table cart add unique (user_no, gno);
-- 수량 추가
alter table cart add book_count number;
 */
@Getter
@Setter
@ToString
public class CartVO {
	
	private int cartNo;
	private int userNo;
	private int gno;
	private int bookCount;
	
	//상품에서 가져올 변수
	private String userId;
	private String pName;
	private String pPrice;
	
	
	//추가
	private int totalPrice;
}
